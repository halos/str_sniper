#!/usr/bin/python
# -*- coding: utf-8 -*-

import re
import sys
import binascii

lines = sys.stdin.readlines()

# checks if the entire string is hex ascii

ascii_pattern = r'^([a-fA-F0-9]+)$'

for line in lines:
	
	line = line[:-1]
	
	if (re.match(ascii_pattern, line) is not None) and (len(line) % 2 == 0):
		
		chars_pattern = r'([a-fA-F0-9]{2})'

		chars = re.findall(chars_pattern, line)

		line = ''

		for i in chars:
			line += binascii.a2b_hex(i)

	print line
