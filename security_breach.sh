#gnome-terminal -e
printf "\nIntruder Detected\n"
#osascript -e 'activate application "Terminal"'
sleep 3 
printf "The following Security Wizard will now begin, it is recommended that you do not use the computer at this time\n"
sleep 3
echo -n "." && sleep 0.5 && echo -n "." && sleep 0.5 && echo -n "." && sleep 0.5 && echo -n "." && sleep 0.5 && echo -n "." && sleep 2 && echo -n "."
# Print Kremlin Data
dig kremlin.ru | while read; do echo "$REPLY" && sleep 0.01; done
sleep 4
ifconfig | while read; do echo "$REPLY" && sleep 0.01; done
# Print Intruder Detected
printf "\nIntruder detected\n" && sleep 0.5
printf "Locating ." && sleep 0.5 && echo -n "." && sleep 0.5 && echo -n "." && sleep 0.5 && echo -n "." && echo -n "." && sleep 0.5 && echo -n "."
sleep 0.3
printf "\n IP SOURCE : RUSSIA \n   IP = 95.173.136.70\n"
sleep 0.8
echo "Attempting to Secure Computer"
echo -n "["

i="0"
while [ $i -lt 70 ]
do
	echo -n "#"
	sleep 0.05
	i=$[$i+1]
done
echo "]"
sleep 0.5
# Print Breached
i="0"
while [ $i -lt 10 ]
do 
	echo "ALERT: FIREWALL BREACHED"
	sleep 0.5
	i=$[$i+1]
done

sleep 2
traceroute mil.ru
# Print Skull
printf "\n \n \n \n"
cat skull | while read; do echo "$REPLY"  && sleep 0.1; done

sleep 3
