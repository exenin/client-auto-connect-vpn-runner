echo """ :::: VPN CONNECT SCRIPT :::: 

"""
echo kill existing vpn
ps -axu  | grep -e vpn | grep c.ovpn | grep -e root | awk '{print $2}' | xargs sudo kill -9 2>/dev/null


#openvpn c.ovpn

for vpn in $(ls /opt/vpn/config/*.ovpn);
do
  s=$(echo $vpn | cut -d'/' -f4 | sed 's/\./_/g')
  tmux new-session -d -s $s "sudo openvpn ${vpn}";
done
