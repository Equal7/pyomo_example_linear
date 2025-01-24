from models import Production, Transport, Demand, Delay, Penalty


def get_data_from_csv(path_to_files: str) -> dict:
    """Получение данных из csv файла для модели"""
    # Получение данных
    productions = Production.load_from_csv(filepath=f"{path_to_files}data.csv")
    demands = Demand.load_from_csv(filepath=f"{path_to_files}data.csv")
    transports = Transport.load_from_csv(filepath=f"{path_to_files}transport.csv")
    delay = Delay.load_from_csv(filepath=f"{path_to_files}delay.csv")
    penalty = Penalty.load_from_csv(filepath=f"{path_to_files}penalty.csv")

    # можно реализовать нормальную работу с данными и получение необходимых форматов для подачи в модель здесь, 
    # но реализовал автоматическую в виде классовых методов.
    data = {
        "periods": {
            None: sorted(set(Production.get_all_field_values(field_name="period")))
        },
        "locations": {
            None: sorted(set(Production.get_all_field_values(field_name="location")))
        },
        "paths": {None: sorted(set(Transport.get_all_field_values(field_name="path")))},
        "capacity": Production.capacity_data(),
        "demand": Demand.demand_data(),
        "max_delay": {None: delay.max_delay},
        "penalty": Penalty.penalty_data(),
    }
    # В pyomo жутка работа с данными, но как есть
    return {None: data}
