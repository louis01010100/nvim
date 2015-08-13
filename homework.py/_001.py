#!/usr/bin/env python3


with open('result', mode='w', encoding='utf-8') as a_file:
    for x in range(1, 10):
        for y in range(1, 10):
            a_file.write("{:d} x {:d} = {:d}\t".format(y, x, x * y))
        a_file.write("\n")
