#!/bin/bash
apt install wget -y
clear

echo "🅰🅻🅼🅾🆂🆃 🅲🅻🅾🆄🅳"

echo Tạo VPS Hosting miễn phí của riêng bạn!

read -p "Bạn có chắc chắn muốn tiếp tục không? Đồng ý cho tạo hay không? (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

clear
