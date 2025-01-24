import logging
import os
import sys
import pyomo.environ as pe
from pyomo.dataportal import DataPortal

from logging.handlers import RotatingFileHandler
from optimization import LPModel
from config import BaseModelConfig
from data import get_data_from_csv
from models import Production, Transport, Demand, Delay, Penalty


def prepare_logs() -> None:
    """Подготовка логов"""

    if not os.path.exists("logs/"):
        os.makedirs("logs/")

    logging.basicConfig(
        level=logging.DEBUG,
        format="%(asctime)s - %(module)s - %(levelname)s - %(funcName)s: %(lineno)d - %(message)s",
        handlers=[
            RotatingFileHandler(
                "logs/logs.log", maxBytes=100000000, backupCount=10, encoding="utf-8"
            )
        ],
        encoding="utf-8",
    )


if __name__ == "__main__":
    # Подготовка логов
    prepare_logs()
    
    # Данные
    data = get_data_from_csv(path_to_files="data/")
    # Конфигурация
    config = BaseModelConfig(solver_name="glpk")
    # Решение модели
    model = LPModel(config=config, data=data)
    result, model_instance = model.solve()
