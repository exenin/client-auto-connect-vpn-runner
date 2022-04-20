git clone https://github.com/exenin/client-auto-connect-vpn-runner.git /opt/vpn || echo exists
cd /opt/vpn
git pull

echo "Installing tools - tmux + openvpn"
bash vpn/install.sh
