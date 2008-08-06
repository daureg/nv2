#! /usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable-msg=W0312
"""Make the start title of the text file"""
import sys, os
if __name__ == "__main__":
	FULL_TITLE=sys.argv[1]
	AUTHOR="Géraud Le Falher"
	DATE = sys.argv[2]
	if DATE == "today":
	    DATE = os.popen("date +'%A %d %B %Y'").read().strip()
	print FULL_TITLE.upper().center(80)
	print AUTHOR.center(80)
	print DATE.center(80) + "\n"
