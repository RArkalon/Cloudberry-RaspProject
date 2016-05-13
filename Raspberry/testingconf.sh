#! /bin/sh
case $1 in
	start)
		#FIRST
		echo " --- Script begining ---\n" > /home/pi/Desktop/cloudberry/log.sh
		date >> /home/pi/Desktop/cloudberry/log.sh
		#TEST CONNECT
		connect=`curl -sL -w "%{http_code}\\n" "54.144.23.166" -o /dev/null`
		if [ "$connect" = "200" ];
		then
			echo Congratulation connection serv on >> /home/pi/Desktop/cloudberry/log.sh
			#GET ID (now in php file)
			#SERIAL="$(cat /proc/cpuinfo | grep Serial | cut -d ':' -f 2)"
			#echo   Your ID is $SERIAL >> /home/pi/Desktop/cloudberry/log.sh
			#GET CONF
			wget -O /home/pi/Desktop/cloudberry/config.php  HTTP://54.158.91.82/cloudberry/config.php
			sleep 2
			chmod 777 /home/pi/Desktop/cloudberry/config.php
			php /home/pi/Desktop/cloudberry/config.php
		else
			echo Oh...connection serv off >> /home/pi/Desktop/cloudberry/log.sh
		fi
		echo "Configuration is done" >> /home/pi/Desktop/cloudberry/log.sh
		#CURL FAIL NOT GOOD SOLUTION
		#curl -X POST 'http://54.144.23.166/cloudberry/' -d "/home/pi/Desktop/cloudberry/data.json" --header "Content-Type:application/json"
		;;
	stop)
		#OPTION STOP SERVER
		echo "script OFF" >> /home/pi/Desktop/cloudberry/log.sh
		;;
	*)
		echo $"usage: $0 {start|stop}"
		exit 1
		;;
esac
exit 0
