"""Модуль для датаклассов"""
import csv


class AbstractTracker:

    def __init__(self):
        if not hasattr(self.__class__, '_instances'):
            self.__class__._instances = []
        self.__class__._instances.append(self)

    @classmethod
    def get_all_field_values(cls, field_name):
        return [getattr(instance, field_name, None) for instance in cls._instances if getattr(instance, field_name, None) is not None]


class AbstractLoader:
    
    @classmethod
    def load_from_csv(cls, filepath: str) -> list:
        """Загрузить объекты класса из CSV-файла"""
        instances = []
        class_fields = {field for field in cls.__static_attributes__ if not field.startswith("_")}

        with open(filepath, mode='r', encoding='utf-8') as file:
            reader = csv.DictReader(file)
            for row in reader:
                instance = cls(**{key: value for key, value in row.items() if key in class_fields})
                instances.append(instance)
        return instances if len(instances) > 1 else instances[0]
    
    def __repr__(self):
        return f'{self.__class__.__name__}({self.__dict__})'
    
    
class Production(AbstractTracker, AbstractLoader):

    def __init__(self, period: int, location, capacity: int):
        self.period = int(period)
        self.location = location
        self.capacity = int(capacity)
        super().__init__()

    @classmethod
    def capacity_data(cls):
        dict_ = {}
        for instance in cls._instances:
            dict_[instance.period, instance.location] = instance.capacity
        return dict_


class Transport(AbstractTracker, AbstractLoader):

    def __init__(self, from_location, to_location):
        self.from_location = from_location
        self.to_location = to_location
        super().__init__()
    
    @property
    def path(self):
        if self.from_location and self.to_location:
            return (self.from_location, self.to_location)
        else:
            return None

class Demand(AbstractTracker, AbstractLoader):

    def __init__(self, period: int, location, demand: int):
        self.period = int(period)
        self.location = location
        self.demand = int(demand)
        super().__init__()
    
    @classmethod
    def demand_data(cls):
        dict_ = {}
        for instance in cls._instances:
            dict_[instance.period, instance.location] = instance.demand
        return dict_


class Penalty(AbstractTracker, AbstractLoader):

    def __init__(self, location, penalty: int):
        self.location = location
        self.penalty = float(penalty)
        super().__init__()
    
    @classmethod
    def penalty_data(cls):
        dict_ = {}
        for instance in cls._instances:
            dict_[instance.location] = instance.penalty
        return dict_
    

class Delay(AbstractLoader):

    def __init__(self, max_delay):
        self.max_delay = int(max_delay)
        super().__init__()