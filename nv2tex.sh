#! /bin/bash
NAME=`basename $1 .nv`
#Saut de ligne à chaque fin de paragraphe
sed 's/$/\n/' $NAME.nv > tmp
sed -i 's/^__$/\\vspace{28pt}/' tmp
sed -i 's/\.\.\./\\dots ~ /' tmp
sed -i 's/«/\\og /g' tmp
sed -i 's/»/\\myfg/g' tmp
sed -i 's/^-/\\tiret /' tmp
sed -i 's/\*/\\emph\{/g' tmp
sed -i 's/|\$/\}/g' tmp
sed -i 's/^_1 /\\section\*\{/' tmp
sed -i '/^\\section\*/ s/$/\}/' tmp
sed -i 's/^_0 /\\chapter\{/' tmp
sed -i '/^\\chapter/ s/$/\}/' tmp
sed -i 's/^_2 /\\subsection\*\{/' tmp
sed -i '/^\\subsection\*/ s/$/\}/' tmp
sed -i 's/%/\\%/' tmp
#joindre les ligne \\
sed -e :a -e '$!N;s/\n_/\\\\/;ta' -e 'P;D' tmp > texte.tex
