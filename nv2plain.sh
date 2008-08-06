#! /bin/bash
NAME=`basename $1 .nv`
cat $NAME.nv > ${NAME}_plain.txt
sed -i '/^_$/d' ${NAME}_plain.txt
sed -i 's/^__$//' ${NAME}_plain.txt
sed -i 's/^_1 //' ${NAME}_plain.txt
sed -i 's/^_2 //' ${NAME}_plain.txt
sed -i 's/^_0/chapitre :/' ${NAME}_plain.txt 
sed -i 's/|\$/\*/g' ${NAME}_plain.txt
sed -i 's/\.\.\./… /'  ${NAME}_plain.txt
