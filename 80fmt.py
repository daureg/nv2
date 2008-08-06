#! /usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable-msg=W0312
# Author: Géraud Le Falher <daureg@gmail.com>
# Licence: GPL2 <http://www.opensource.org/licenses/gpl-2.0.php>
"""."""
import sys, os
def fmt_line(one_line, length):
	"""."""
	tmp = ".__pete_and_the_pirates"
	ftmp = open(tmp, 'w')
	ftmp.write(one_line.strip())
	ftmp.close()
	result = os.popen("fmt -w %d %s" % (length, tmp)).read().strip() + "\n"
	return result	
#	space_pos = []
#	real_cut = [-1]
#	for i in range(len(one_line)):
#		if one_line[i] == ' ':
#			space_pos.append(i)
#	for i in range(len(space_pos)):
#		if space_pos[i] > (len(real_cut) * length):
#			real_cut.append(space_pos[i-1])
#			space_pos = [i-1 for i in space_pos]
#	for i in range(1, len(real_cut)):
#		print one_line[real_cut[i-1]+1:real_cut[i]]
#	print one_line[real_cut[len(real_cut)-1]+1:len(one_line)-1]

if __name__ == "__main__":
	LEN = int(sys.argv[1])
	f = open(sys.argv[2], 'r')
	line = f.readlines()
	for i in line:
		if len(i) > LEN:
			i = fmt_line(i, LEN)
		if i[0] == '-':
		    i = "— " + i[1:]
		if i[0] != '_':
			i = "    " + i
		print i,
	f.close()
	sys.exit()

