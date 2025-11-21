#!/bin/bash -e

sudo apt install nginx

git clone https://github.com/kubowania/2048.git
sudo mv 2048/* /var/www/html/
