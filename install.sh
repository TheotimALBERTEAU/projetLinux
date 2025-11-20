# Pre install packages
apt update
apt install nodejs npm git sudo

# Add user
sudo useradd -m -s $(which bash) -G sudo kuma

# Get sources
git clone https://github.com/louislam/uptime-kuma.git

# Build app
npm run setup

# Move app build to kuma user
sudo mv uptime-kuma /home/kuma/app
sudo chown kuma:kuma /home/kuma/app

# MariaDB
sudo apt install mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb

echo "Vous allez devoir modifier le mot de passe du root, retenez-le"
sudo mariadb-secure-installation

echo "Entrez à nouveau le mot de passe de l'utilisateur root :"
mariadb -u root -p -e "CREATE DATABASE kuma;"

# Create service
sudo cp uptime-kuma.service /etc/systemd/system/uptime-kuma.service

sudo systemctl daemon-reload
sudo systemctl start uptime-kuma && sudo systemctl enable uptime-kuma

# Sécurité 
sudo apt install fail2ban ufw

sudo ufw enable
sudo ufw allow 3001