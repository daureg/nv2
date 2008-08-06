#! /bin/bash
DIR=`pwd`
NAME=`basename $PWD`.nv
python 80fmt.py 80 $NAME > tmp
sed -i 's/^_$//' tmp
sed -i 's/^__$/\n/' tmp
sed -i 's/^_0/\tCHAPITRE :/' tmp
sed -i '/^\tCHAPITRE :/s/$/\n/' tmp
sed -i '/^_1/s/$/\n/' tmp
sed -i '/^_1/s/^/\n/' tmp
sed -i 's/^_1 //' tmp
sed -i 's/^_2/ /' tmp
sed -i 's/|\$/\*/g' tmp
sed -i 's/«/« /g' tmp
sed -i 's/»/ »/g' tmp
sed -i 's/\.\.\./… /' tmp
cat tmp
