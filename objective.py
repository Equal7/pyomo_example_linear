"""Модуль с целевой функцией ЛП"""

import pyomo.environ as pe


def objective_rule():
    def inner(model: pe.AbstractModel):
        """
        Целевая функция.
        Минимизируем интервальное суммарное покрытие удовлетворенного спроса за периоды.
        """
        return sum(
            model.satisfied_demand[period, period_next, location]
            for period in model.periods
            for period_next in model.periods
            for location in model.locations
            if period_next > period
        ) 
    return inner

