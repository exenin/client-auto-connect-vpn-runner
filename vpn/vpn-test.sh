is_running=$(ps -axu | grep --silent -e vpn -e root -e  c.ovpn 2>/dev/null && echo True || echo False)
wd=/opt/vpn/
cd $wd
echo 'vpn is running?', $is_running

if [[ ! $is_running ]];then
	echo 'is not running, lets restart'
else
	echo 'our ip is correctly set?'
	vpnip='66.228.33.203'
	currentip=$(curl ipv4.icanhazip.com)
	if [[ "$vpnip" != "$currentip" ]];
	then
		echo $vpnip ' doest not match our current which is ' $currentip
		echo 'lets run dovpn script'
		bash -x dovpn.sh
	else
		echo 'ip seems correct'
	fi

fi

