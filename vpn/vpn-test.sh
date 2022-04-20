is_running=$(ps -axu | grep --silent -e vpn -e root -e  c.ovpn 2>/dev/null && echo True || echo False)
wd=/opt/vpn/vpn
cd $wd
echo 'vpn is running?', $is_running

if [[ ! $is_running ]];then
	echo 'is not running, lets restart'
else
	echo 'our ip is correctly set?'
	vpnip=$VPN_EXPECTED_ID
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

