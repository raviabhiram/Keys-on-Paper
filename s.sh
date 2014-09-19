#! /bin/sh

if [ $# -ne 1 ]
then
	echo"Error."
	exit
fi
./a.out $1 > ascii.txt #compilation of mta.c will give a.out
awk '$9 ~ /NT/ {print $4"\t-->\t"$10}' ascii.txt > file.txt
awk '{print $1}' file.txt > num.txt
awk '{print $3}' file.txt > note.txt
cut -d "+" -f 1 num.txt > n1.txt
cut -d "+" -f 2 num.txt > n2.txt
cut -d "/" -f 1 n2.txt > n3.txt
cut -d "/" -f 2 n2.txt > n4.txt
sed 's^[0-9]*[/][0-9]*^0^g' n1.txt > n7.txt
paste -d " " n7.txt n3.txt n4.txt > n8.txt
awk '{if($3 != 0)
	{ 
	res = $1 + $2 / $3;
	 print res;
	}
      else
	{
	print 0;
	}}' n8.txt > n9.txt
paste -d "\t-->\t" n9.txt note.txt > output.txt
cat time.txt
rm n* f*
#the output of this file can be used to write a lilypond file to get the desired pdf containing the notations
