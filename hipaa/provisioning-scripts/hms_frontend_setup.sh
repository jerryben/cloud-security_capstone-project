#!/bin/bash

# Function to wait for a short period
short_wait() {
  sleep 5
}

# Upgrade OS and other packages
echo "Updating package lists..."
sudo apt update
echo "Upgrading installed packages..."
sudo apt upgrade -y
 
# Wait for a short period
short_wait


# Download and run the NodeSource setup script for Node.js 14.x
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
echo "Installing NodeJS......."

sudo apt-get install -y nodejs 
echo "Checking installed NodeJS version......"
node -version

# Wait for a short period
short_wait 


# Install npm
echo "Installing Package Manager(NPM) for NodeJS......"
sudo apt install npm -y
echo "Checking installed NPM version....."
npm -version

# Wait for a short period
short_wait 

# Install Nginx 
echo "Installing Nginx Web Server......"
sudo apt install nginx -y
echo "Checking installed Nginx version......"
nginx -version





# Cloning the HIPAA backend Private Repository
echo "Cloning the HIPAA frontend..."
git clone https://github.com/jerryben/CloudSecurityCapstone.git

echo "hms-frontend cloned successfully"

short_wait

cd /hms-frontend
echo "listing the content of bank-frontend folder"
ls -al



