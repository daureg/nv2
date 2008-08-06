#! /bin/bash
NAME=`basename $1 .nv`
cat $NAME.nv > $NAME.htm
sed -i 's/«/« /g' $NAME.htm
sed -i 's/»/ »/g' $NAME.htm
sed -i 's/\.\.\./… /' $NAME.htm
sed -i 's/^-/— /' $NAME.htm
sed -i 's/^/<p>/' $NAME.htm
sed -i 's/$/<\/p>/' $NAME.htm
sed -i 's/^<p>— /<p class\=\"dialogue\">— /' $NAME.htm
sed -i 's/^<p>« /<p class\=\"dialogue\">« /' $NAME.htm
sed -i 's/\*/<em>/g' $NAME.htm
sed -i 's/|\$/<\/em>/g' $NAME.htm
sed -i 's/<p>_0 /<h1 class\=\"chapitre\">Chapitre : /' $NAME.htm
sed -i '/<h1 class\=\"chapitre\">/ s/<\/p>/<\/h1>/' $NAME.htm
sed -i 's/<p>_1 /<h1 class\=\"nouv\">/' $NAME.htm
sed -i '/<h1 class\=\"nouv\">/ s/<\/p>/<\/h1>/' $NAME.htm
sed -i 's/<p>_2 /<h2 class\=\"nouv\">/' $NAME.htm
sed -i '/<h2 class\=\"nouv\">/ s/<\/p>/<\/h2>/' $NAME.htm
sed -i 's/^<p>__<\/p>$/<div class\=\"vertical-space\"><\/div>/' $NAME.htm
sed -i 's/^<p>_<\/p>$/<br \/>/' $NAME.htm
sed -i -f iso2htm.sed $NAME.htm
