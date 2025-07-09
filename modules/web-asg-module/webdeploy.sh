#!/bin/bash
sudo -i
sudo apt update -y
sudo apt install -y nginx git
sudo systemctl start nginx
cd /var/www/html
git clone "https://github.com/Ironhack-Archive/online-clone-amazon.git"
sudo mv online-clone-amazon/* .
