"""Модуль с ограничениями к задаче ЛП"""

import pyomo.environ as pe


# Ограничения
def production_capacity_rule(model, period, location):
    """
    Ограничение производства.
    Cбщий объем производства в точке location в момент period не может превышать мощность производства в этой точке.
    """

    return (0, model.production[period, location], model.capacity[period, location])


def unsatisfied_constraint(model, period, location):
    """
    Неудовлетворенный спрос в точке location в момент period
    не может превышать потребности спроса.
    """
    return (
        0,
        model.unsatisfied_demand[period, location],
        model.demand[period, location],
    )


def balance_rule(model, period, location):
    """
    Ограничение на задержку.
    Балансировка спроса, производства, суммарного покрытия неудовлетворения спроса, 
    суммарного входящего и исходящего потоков и неудовлетворенного текущего спроса 
    в точке location в момент period
    """
    incoming = sum(
        model.transport[path, period] for path in model.paths if path[1] == location
    )
    outgoing = sum(
        model.transport[path, period] for path in model.paths if path[0] == location
    )
    return (
        model.production[period, location]
        + incoming
        - sum(
            model.satisfied_demand[prev_period, period, location]
            for prev_period in model.periods
            if prev_period < period and period <= prev_period + model.max_delay
        )
        - outgoing
        + model.unsatisfied_demand[period, location]
        == model.demand[period, location]
    )


# ограничение на неуд. спрос
def unsatisfied_demand_rule(model, period, location):
    """
    Неудовлетворенный спрос в точке location в момент period =
    суммарному покрытию спроса этого периода за интервал последующих периодов, не выходящих за максимальное допустимое опоздание.
    В последний период неудовлетворенный спрос должен быть нулевым.
    """
    return model.unsatisfied_demand[period, location] == sum(
        model.satisfied_demand[period, other_period, location]
        / (
            1 + (model.penalty[location] * (other_period - period))
        )
        for other_period in model.periods
        if other_period > period
    )


# Ограничение на периоды покрытия
def coverage_rule(model, period, other_period, location):
    """
    Покрытие спроса в точке location в момент period не может выходить за рамки максимального допустимого опоздания.
    """
    if period - 2 < max(model.periods) and other_period > period + 2:
        return model.satisfied_demand[period, other_period, location] == 0
    else:
        return pe.Constraint.Skip
