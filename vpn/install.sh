sudo apt-get install -y openvpn tmux
cdir=$(pwd)
echo current dir is $cdir
ls /opt/vpn

echo "install cron"
crontab /opt/vpn/configs/vpn.cron 

