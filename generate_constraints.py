#!/usr/bin/env python3

# Tipps
# ipython3: interactive python shell

# to import libraries
import argparse
import sys

parser = argparse.ArgumentParser(description='Generate constraint file for serializer.')

parser.add_argument('--number', type=int, required=True,
                    help='1 stands for tree-structure, 2 for shift-structure and 3 for mixed.')

#parser.add_argument('--output', type=str, required=True,
                    #help='Output file.')

args = parser.parse_args(sys.argv[1:])

print(args.number)

signal_name1 = 'asdf'
signal_name2 = 'qwer'
max_delay = 123

line = "set_constraint {} {} {}".format(signal_name1, signal_name2, max_delay)

#with open(args.output, 'w') as f:
#	f.write(line)