#! /usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable-msg=W0312
"""Make a HTML link with the given desc and name"""
import sys, os
if __name__ == "__main__":
	FULL_TITLE=sys.argv[1]
	SHORT_NAME=sys.argv[2]
	DESC=sys.argv[3]
	pdf_size = int(os.stat('%s.pdf'%SHORT_NAME).st_size)/1000
	txt_size = int(os.stat('%s.txt'%SHORT_NAME).st_size)/1000
	plain_size = int(os.stat('%s_plain.txt'%SHORT_NAME).st_size)/1000
	LINK = """<li><a class="intern" href="%s">%s</a> (%s) : autres versions <a class="intern" href="%s/%s.pdf"> [pdf, %dKo]</a>, <a class="intern" href="%s/%s.txt">[texte formaté, %dKo]</a>, <a class="intern" href="%s/%s_plain.txt">[texte brut, %dKo]</a></li>""" \
			%(SHORT_NAME, FULL_TITLE,DESC,SHORT_NAME,SHORT_NAME,pdf_size,SHORT_NAME,SHORT_NAME,txt_size,SHORT_NAME,SHORT_NAME,plain_size)
	print LINK
