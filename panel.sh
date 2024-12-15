#!/bin/bash
clear

echo "🅰🅻🅼🅾🆂🆃 🅲🅻🅾🆄🅳"

echo Tạo Panel Hosting miễn phí của riêng bạn!

read -p "Bạn có chắc chắn muốn tiếp tục không? Đồng ý cho tạo hay không? (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

clear

echo "Apt update && install"
apt update && apt upgrade -y
apt install wget sudo nano git curl -y
echo "Apt update thành công"

clear

echo "Tải Pufferpanel"
export SUDO_FORCE_REMOVE=yes
apt remove sudo -y
apt install curl wget git python3 -y
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash
apt update && apt upgrade -y
curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py
chmod -R 777 /bin/systemctl
apt install pufferpanel
sed -i "s/\"host\": \"0.0.0.0:8080\"/\"host\": \"0.0.0.0:8080\"/g" /etc/pufferpanel/config.json
echo "Tải thành công"

clear

echo "Đang tạo user mới Pufferpanel"
pufferpanel user add --name almostcloud2025 --password almostcloud2025 --email admin2025@almost.com --admin
echo -e "${GREEN}Admin user almostcloud2025 & password almostcloud2025 & email admin2025@almost.com added successfully!${NC}"
echo "Tạo thành công"

clear

echo "Bắt đầu Pufferpanel"
systemctl restart pufferpanel
echo -e "${GREEN}PufferPanel Tạo và bắt đầu với port: 8080!"
echo "Bắt đầu thành công"
