sudo nmap -sn 192.168.0.1/24 -oG - |  awk '192 {print $2}' >> output.txt
#!/bin/bash -x
lines=$(<output.txt)  

for LINE in $lines
do
	if [[ $LINE == 192* ]]
	then
	echo "$LINE IP CATCHED :) ";
	nmap -sV --script vuln $LINE
	fi
done
rm output.txt
