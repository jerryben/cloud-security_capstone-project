#!/bin/bash

set -e

# Function to wait for a short period
short_wait() {
  sleep 5
}

echo "======= Updating your Ubuntu virtual machine ====="
sudo apt update && sudo apt upgrade -y


short_wait

echo "============ expect ============="
sudo apt install expect -y

echo "============ Installing MySQL Server ============="
sudo apt install mysql-server -y


echo "========== Starting and Enabling MySQL service ==========="
sudo systemctl start mysql.service
sudo systemctl enable mysql.service


echo "============ Checking MySQL service status ============="
if sudo systemctl is-active --quiet mysql.service; then
  echo "MySQL service is running"
else
  echo "Error: MySQL service is not running!"
  exit 1
fi

short_wait

echo "============ Configuring MySQL root password ============="
echo "Enter your desired root password for MySQL:"
read -s root_password

# Reset root password manually
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$root_password'; FLUSH PRIVILEGES;"

echo "====== Root password changed; privileges flushed ======="

short_wait



echo "====== Don't enter root password again when prompted below ======"
short_wait
# Use expect to automate mysql_secure_installation
expect -c "
spawn mysql_secure_installation
expect \"Enter password for user root:\"
send \"$root_password\r\"
expect \"VALIDATE PASSWORD PLUGIN can be used to test passwords...\"
send \"n\r\"
expect \"Change the password for root ? ((Press y|Y for Yes, any other key for No) :\"
send \"n\r\"
expect \"Remove anonymous users? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect \"Disallow root login remotely? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect \"Remove test database and access to it? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect \"Reload privilege tables now? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect eof
"

echo "======= MySQL_secure_configuration completed! ========"

short_wait

#Creating PCI_DSS database, user and granting user all privileges
echo "==== Creating PCI_DSS database, user and granting all privileges ===="
echo "Enter your desired username for the non-root user:"
read username

echo "Enter your desired password for the non-root user:"
read -s userpassword

# Run MySQL commands
mysql -u root -p"$root_password" <<EOF
CREATE USER '$username'@'%' IDENTIFIED BY '$userpassword';
CREATE DATABASE online_banking;
GRANT ALL PRIVILEGES ON *.* TO '$username'@'%';
FLUSH PRIVILEGES;
EOF

# Check if the commands were successful
if [ $? -eq 0 ]; then
  echo "Database and user created successfully."
else
  echo "Error creating database and user."
fi

short_wait

echo "====== Checking current bind IP from mysqld.cnf ======"
current_bind_ip=$(grep '^bind-address' /etc/mysql/mysql.conf.d/mysqld.cnf | awk '{print $3}')
echo "Current bind address in mysqld.cnf: $current_bind_ip"
 
read -p "Do you want to change the bind address to 0.0.0.0? (y/N): " change_bind

if [[ $change_bind == "y" || $change_bind == "Y" ]]; then
  sudo sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
  echo "Changed bind address to 0.0.0.0."
fi

short_wait

# Change mysqld port number from 3306 to 11011
# Path to the MySQL configuration file
CONFIG_FILE="/etc/mysql/mysql.conf.d/mysqld.cnf"

# Use sed to replace the port number
sudo sed -i 's/# port\s*=\s*3306/port = 11011/' "$CONFIG_FILE"

# Uncomment the line if it was commented out
sudo sed -i 's/# port = 11011/port = 11011/' "$CONFIG_FILE"


echo "Port number changed from 3306 to 11011"

short_wait

echo "========== Saving all changes and restarting MySQL service ======"
sudo systemctl restart mysql.service
echo "MySQL configuration complete!"

