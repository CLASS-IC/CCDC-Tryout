#!/bin/bash

# Install vsftpd if not installed
sudo apt update
sudo apt install vsftpd -y

# Backup the original configuration file
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

# Configure vsftpd to disallow anonymous logins
sudo sed -i 's/anonymous_enable=YES/anonymous_enable=NO/' /etc/vsftpd.conf

# Enable FTPS (FTP over SSL)
echo "ssl_enable=YES" | sudo tee -a /etc/vsftpd.conf

# Restart vsftpd
sudo systemctl restart vsftpd
