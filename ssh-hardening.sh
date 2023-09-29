#!/bin/bash

# Backup SSHd config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Disable root login and password authentication
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Restart SSH
sudo systemctl restart ssh
