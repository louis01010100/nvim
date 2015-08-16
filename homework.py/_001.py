#!/usr/bin/env python3

def func(x):
    return ["{:d} x {:d} = {:d}".format(y, x, x * y) for y in range(1, 10)]


table = list(map(func, range(1,10)))

for column in table:
    for row in column:
        print("{:s}".format(row))
