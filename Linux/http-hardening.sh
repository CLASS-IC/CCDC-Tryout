#!/bin/bash

# This is used to install, update, and patch the apache server

# Update Apache and related packages
sudo apt update
sudo apt install apache2 -y

# Disable directory listing
sudo sed -i '/Options Indexes FollowSymLinks/ s/Indexes//g' /etc/apache2/apache2.conf

# Restart Apache
sudo systemctl restart apache2
