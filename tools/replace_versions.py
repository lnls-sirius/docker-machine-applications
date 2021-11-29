"""Script that replaces string templates for package versions."""

import sys


def read_replace_list_file(fname):
    """."""
    with open(fname, 'r') as fp:
        replaces = fp.read().splitlines()
    replaces = [replace.split() for replace in replaces]
    return replaces


def read_input_file(fname):
    """."""
    with open(fname, 'r') as fp:
        data = fp.read().splitlines()
    return data


def replace(data, replaces):
    """."""
    data2 = []
    for datum in data:
        if ':pkg_' in datum:
            for replace in replaces:
                if len(replace) != 2:
                    continue
                key, value = replace
                if key in datum:
                    data2.append(datum.replace(':'+key, value))
        else:
            data2.append(datum)
    return data2


def print_output_file(data):
    """."""
    for datum in data:
        print(datum)
        

def run_replace():
    """."""
    replaces = read_replace_list_file(sys.argv[1])
    data = read_input_file(sys.argv[2])
    data2 = replace(data, replaces)
    print_output_file(data2)


if __name__ == "__main__":
    run_replace()
