#!/bin/bash

# Update and install necessary packages
sudo apt-get update -y
sudo apt-get install -y curl gnupg

# Add PufferPanel's package repository
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash

# Install PufferPanel
sudo apt-get install -y pufferpanel

# Generate default configuration files
sudo pufferpanel configure

# Add an admin user to PufferPanel
# Replace the email and password with your preferred credentials
sudo pufferpanel user add --email exampletotest050@gmail.com --name ahcip --password ahcip12345 --admin

# Start PufferPanel in the foreground to avoid using systemctl (Render doesn't use systemd)
sudo pufferpanel web --bind 0.0.0.0:8080
