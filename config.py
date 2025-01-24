"""Модуль конфигураций для модели ЛП"""
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

SOLVER_PATH = config['opt']['SOLVER_PATH']

class BaseModelConfig:
    """Базовый конфиг модели ЛП"""
    def __init__(self, *args, **kwargs) -> None:

        self.output = kwargs.get('output', True)
        self.solver_name = kwargs.get('solver_name', 'glpk')
        self.solver_path = kwargs.get('solver_path', SOLVER_PATH)
