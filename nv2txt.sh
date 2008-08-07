#! /bin/bash
NAME=`basename $1`
python 80fmt.py 80 $NAME.nv > tmp
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
rm tmp
