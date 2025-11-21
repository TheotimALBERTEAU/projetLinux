#!/bin/bash -e

sudo apt install fail2ban ufw

sudo ufw enable

sudo ufw allow 3001
