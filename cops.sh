#!/bin/bash
# This is COPS - Console Output Parser for SRCDS
pathscript='/home/sourcecs/cops'
pathlog='/home/sourcecs/sourcecs/dd2'
inputfile='screenlog.0'


#cd ${pathlog}
cd ${pathscript}
movelog()
{
	currepoch=$(date +%s)
	if [ -e ${pathlog}/${inputfile} ]
	then
		mv ${pathlog}/${inputfile} temp-${currepoch}
	else
		echo "pusty przebieg" >> temp-${currepoch}
	fi
#mv ${pathlog}/${inputfile} temp-${currepoch}
	cp temp-${currepoch} analyze.it
	#cat analyze.it >> /var/www/html/konsola.txt
#echo "${pathlog} ${inputfile} ${currepoch}" >> debug
	#echo "COPS-by-fizek" >> ${pathscript}/temp-${currepoch}
	#echo "${currepoch} $(wc -l temp-${currepoch})" >> liczbalinii
#echo "${pathlog} ${inputfile} ${currepoch}" >> debug
	#echo "COPS-by-fizek" >> ${pathscript}/temp-${currepoch}
	cat temp-${currepoch} >> dust2-console-$(date +%Y-%m-%d)
	tail -n 1000 dust2-console-$(date +%Y-%m-%d) > /var/www/html/konsola.txt
#echo "${pathlog} ${inputfile} ${currepoch}" >> debug
	rm -f temp-${currepoch}
#echo "${pathlog} ${inputfile} ${currepoch}" >> debug
	#unset currepoch
}
for i in {1..5}
do
	sleep 11
	movelog
done
exit 0;
