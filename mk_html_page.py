#! /usr/bin/env python
# -*- coding: utf-8 -*-
# pylint: disable-msg=W0312
"""Make a HTML page with the given desc and name"""
import sys, os
if __name__ == "__main__":
	FULL_TITLE=sys.argv[1]
	DESC=sys.argv[2]
	KEYWORD=sys.argv[3]
	SHORT_NAME=sys.argv[4]
	# le nombre de sous repertoire en partant de la racine avant d'atteindre cet index.php
	ROOT_LEVEL=sys.argv[5]
	COMMON_STRING = int(ROOT_LEVEL) * "../" + "common/"
	DATE = sys.argv[6]
	if DATE == "today":
	    DATE = os.popen("date +'%A %d %B %Y'").read().strip()
	BEGIN = """<?php header("Vary: Accept");
header("X-Hacker: It will be better for you to read Shakespeare than HTTP headers");
if (stristr($_SERVER["HTTP_ACCEPT"], "application/xhtml+xml")) 
    header("Content-Type: application/xhtml+xml; charset=utf-8");
else
    header("Content-Type: text/html; charset=utf-8");?>
<?php include_once("%stitle"); ?>
GeraudSoft | %s (%s)
<?php include_once("%shead"); ?>
<meta name="keywords" content="%s" />
<meta name="description" content="%s" />
<?php include_once("%sstart"); ?>
"""%(COMMON_STRING, FULL_TITLE, DATE, COMMON_STRING, KEYWORD, DESC, COMMON_STRING)
	END = """<div class="vertical-space"></div>
</div>
<div class="footer">
<?php
$jour = array("Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi");
$mois = array("Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre");
$nMois = date("m",filemtime($_SERVER['PATH_TRANSLATED'])) - 1;
echo '<div class="timestamp">';
echo "Dernière modification le ";
echo $jour[date("w",filemtime($_SERVER['PATH_TRANSLATED']))];
echo date(" d ", filemtime( $_SERVER['PATH_TRANSLATED'] ) );
echo $mois[$nMois];
echo date(" Y ", filemtime( $_SERVER['PATH_TRANSLATED'] ) );
echo date(" à H\hi", filemtime( $_SERVER['PATH_TRANSLATED'] ) );
echo "</div>\\n";
?>
<?php include_once("%send"); ?>
""" % (COMMON_STRING)
	f = open('%s.htm'%SHORT_NAME, 'r')
	print BEGIN, f.read(), END
	f.close

