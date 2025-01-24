"""Модуль с моделью ЛП"""

import logging
import pandas as pd
import pyomo.environ as pe

from pyomo.contrib import appsi
from pyomo.dataportal import DataPortal

from models import Production, Transport, Demand
from objective import *
from constraints import *

logger = logging.getLogger(__name__)


class LPModel:
    """Модель ЛП"""

    def __init__(self, config, data=None):
        self.config = config
        self.model = pe.AbstractModel()
        self.data = self.get_data_dat() if data is None else data
        self.result = None

    def create_sets(self):
        """Создание множеств данных"""
        # периоды
        self.model.periods = pe.Set()
        # точки производства или потребления
        self.model.locations = pe.Set()
        # маршруты
        self.model.paths = pe.Set(dimen=2)

    def create_params(self):
        """Создание параметров"""
        # мощность
        self.model.capacity = pe.Param(self.model.periods, self.model.locations)
        # спрос
        self.model.demand = pe.Param(self.model.periods, self.model.locations)
        # штраф
        self.model.penalty = pe.Param(self.model.locations)
        # максимальная задержка
        self.model.max_delay = pe.Param(within=pe.NonNegativeReals)

    def create_vars(self):
        """Создание переменных задачи"""
        # передвижение груза
        self.model.transport = pe.Var(
            self.model.paths, self.model.periods, domain=pe.NonNegativeIntegers
        )
        # производство
        self.model.production = pe.Var(
            self.model.periods, self.model.locations, domain=pe.NonNegativeIntegers
        )
        # неудовлетворенный спрос
        self.model.unsatisfied_demand = pe.Var(
            self.model.periods, self.model.locations, within=pe.NonNegativeIntegers
        )
        # покрытие удовлетворенного спроса в периоде 
        self.model.satisfied_demand = pe.Var(
           self.model.periods, self.model.periods, self.model.locations,  within=pe.NonNegativeIntegers
        )
    def create_objective(self):
        """Создание целевой функции"""
        self.model.objective = pe.Objective(rule=objective_rule(), sense=pe.minimize)

    def create_constraints(self):
        """Создание ограничений задачи"""
        # ограничение потребления
        self.model.production_capacity_rule = pe.Constraint(
            self.model.periods, self.model.locations, rule=production_capacity_rule
        )
        # ограничение 
        self.model.unsatisfied_demand_rule = pe.Constraint(
            self.model.periods, self.model.locations, rule=unsatisfied_demand_rule
        )
        self.model.unsatisfied_constraint = pe.Constraint(
            self.model.periods, self.model.locations, rule=unsatisfied_constraint
        )
        # # ограничение неудовлетворенного спроса
        self.model.balance_rule = pe.Constraint(
            self.model.periods, self.model.locations, rule=balance_rule
        )
        self.model.coverage_rule = pe.Constraint(
            self.model.periods, self.model.periods, self.model.locations, rule=coverage_rule
        )


    def construct_model(self):
        """Конструирование модели"""

        self.create_sets()
        self.create_params()
        self.create_vars()
        self.create_objective()
        self.create_constraints()

    def get_data_dat(self):
        """Получение данных для модели"""
        # Чтение .dat
        data = DataPortal()
        data.load(filename="data/data.dat")
        return data

    def _solve(self):
        """Решение задачи"""
        model_instance = self.model.create_instance(self.data)
        # model_instance.display()
        solver = pe.SolverFactory(
            self.config.solver_name, executable=self.config.solver_path
        )
        try:
            result = solver.solve(
                model_instance,
                tee=self.config.output,
                load_solutions=False,
            )
        except RuntimeError as e:
            logging.exception("RuntimeError")
            print(f"{e.__class__.__name__}: {e}")
        return result, model_instance

    def solve(self):
        """Метод создания и решения модели"""

        self.construct_model()
        row_result, instance = self._solve()
        self.print_result_status(row_result, instance)

        if row_result.solver.termination_condition == pe.TerminationCondition.optimal:
            self.prettify_print(instance)

        # Записываем модель в формат lp
        instance.write("model.lp", io_options={"symbolic_solver_labels": True})

        return row_result, instance


    def print_result_status(self, result, instance):
        """Вывод результата"""

        print("\n--------")
        if result.solver.termination_condition == pe.TerminationCondition.infeasible:
            print("Модель не имеет решения.")
            print(
                f'Результаты:\n'
                f'Termination_condition - {result.solver.termination_condition=}\n'
                f'Status - {result.solver.status=}\n'
                )
            print(f'Необходимо изменить входные данные для возможности планирования с текущими параметрами.')
        elif result.solver.termination_condition == pe.TerminationCondition.optimal:
            print("Найдено оптимальное решение.")
            print(
                f'Результаты:\n'
                f'Termination_condition - {result.solver.termination_condition=}\n'
                f'Status - {result.solver.status=}\n'
                f'Значение целевой функции - минимального  штрафа за неудовлетворенный спрос: {instance.objective()}'
                )
    
    def prettify_print(self, model_instance):
        print("Итог:")
        for location in model_instance.locations:
            for period in model_instance.periods:
            
                print(
                    f"Период {period}, Точка {location}: \n"
                    f"Произведено: {model_instance.production[period, location].value},\n"
                    f"Спрос: {model_instance.demand[period, location]},\n",
                    f"Остаток потребности: {model_instance.unsatisfied_demand[period, location].value}.",
                )
                for route in model_instance.paths:
                    if route[0] == location or route[1] == location:
                        print(
                            f"Маршрут {route}, Период {period}: {model_instance.transport[route, period].value}"
                        )
                for next_period in model_instance.periods:
                    if next_period > period and next_period - period <= model_instance.max_delay:
                        print(
                            f"Период {period}, Период удовлетворения спроса {next_period}, Точка {location}: {model_instance.satisfied_demand[period, next_period, location].value}"
                        )
                print("-----------------------")
        # Вывод результатов
        print("Целевая функция:", model_instance.objective())
