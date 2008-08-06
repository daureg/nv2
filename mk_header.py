#! /usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable-msg=W0312
"""Make header of a html page"""
import sys, os
if __name__ == "__main__":
    FULL_TITLE = sys.argv[1]
    KEYWORD = sys.argv[2]
    DESC = sys.argv[3]
    header = """%s</title>
<meta http-equiv="content-type" content="application/xhtml+xml;charset=utf-8" />
<meta name="keywords" content="%s" />
<meta name="description" content="%s" />
<style type="text/css">""" % ( FULL_TITLE, KEYWORD, DESC)
    print header
