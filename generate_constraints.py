#!/usr/bin/env python3

# Tipps for Kaja:
# ipython3: interactive python shell

import argparse
import sys

parser = argparse.ArgumentParser(description='Generate constraint file for serializer.')

parser.add_argument('--num-inputs', type=int, required=True,
                    help='Number of parallel inputs to serializer.')

parser.add_argument('--output', type=str, required=True,
                    help='Output file.')

args = parser.parse_args(sys.argv[1:])

print(args.num_inputs)

signal_name1 = 'asdf'
signal_name2 = 'qwer'
max_delay = 123

line = "set_constraint {} {} {}".format(signal_name1, signal_name2, max_delay)

with open(args.output, 'w') as f:
	f.write(line)