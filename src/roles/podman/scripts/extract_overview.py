import json
import sys
from collections.abc import Callable
from itertools import count


def get_name(func: Callable) -> str:
    return func.__name__.replace('create_', '')


def create_ports_mapping(apps: dict, result: dict = None) -> list[dict[str, list[str]]]:
    ports_mapping = [
        {app_name: [elem.split(':')[-2] if ':' in elem else elem
            for service_name, service_conf in (app_conf or {}).get('services', {}).items()
            for elem in service_conf.get('ports', [])
        ]
        } for app_name, app_conf in apps.items()
    ]
    ports_mapping = filter(lambda e: list(e.values())[-1], ports_mapping)
    ports_mapping = sorted(ports_mapping, key=lambda e: list(e.values())[-1][0])
    return ports_mapping

def create_suggested_ports(apps: dict, result: dict) -> dict[str, str]:
    name = get_name(create_ports_mapping)
    ports_mapping = result[name]
    kind_to_app_nums = {}
    kind_to_lowest = {}
    for mapping in ports_mapping:
        ports = next(iter(mapping.values()))
        for port in ports:
            kind_to_app_nums.setdefault(port[0], []).append(port[1:-1])
    for kind, app_nums in kind_to_app_nums.items():
        unique_app_nums = set(map(int, app_nums))
        kind_to_lowest[kind] = f'{next(i for i in count() if i not in unique_app_nums)+1:02d}'
    return kind_to_lowest

def create_overview(apps: dict):
    funcs = [
        create_ports_mapping,
        create_suggested_ports
    ]
    result = {}
    for func in funcs:
        name = get_name(func)
        func_result = func(apps, dict(result))
        result[name] = func_result
    return result


if __name__ == '__main__':
    apps = json.load(sys.stdin)
    result = create_overview(apps)
    print(json.dumps(result))
