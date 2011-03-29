#!/usr/bin/python
# -*- coding: utf-8 -*-

import re
import binascii

# checks if the entire string is hex ascii

pattern = r'^([a-fA-F0-9]+)$'

cad = raw_input()

if re.match(pattern, cad):

	pattern = r'([a-fA-F0-9]{2})'

	chars = re.findall(pattern, cad)

	cad = ''

	for i in chars:
		cad += binascii.a2b_hex(i)

print cad
