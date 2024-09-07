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

# Install Java (OpenJDK 17)
echo "Installing OpenJDK 17..."
sudo apt install openjdk-17-jdk openjdk-17-jre -y
echo "Checking installed Java version..."
java -version

# Wait for a short period
short_wait

# Install Maven
echo "Installing Maven..."
sudo apt install maven -y
echo "Checking installed Maven version..."
mvn -version


short_wait

# Installing MySQL client to test connectivity to database
echo "Installing MySQL client..."
sudo apt install mysql-client -y
echo "Checking installed mysql-client version..."
mysql -version


# Cloning the PCI-DSS backend Private Repository
echo "Cloning the PCI-DSS backend..."
git clone https://github.com/jerryben/CloudSecurityCapstone.git



echo "All package Upgraded successfully"
short_wait
echo "OpenJDK installed successfully"
short_wait
echo "Maven installed successfully"
short_wait
echo "mysql-clent installed successfully"
short_wait
echo "PCI-DSS repository Cloned successfully"
short_wait

# list directory to see the cloned backend folder
echo "Check to see the cloned backend folder"
cd bank-backend
ls -al

short_wait

# Open application.properties for credential editing
sudo nano src/main/resources/application.properties
echo "Script execution completed."
