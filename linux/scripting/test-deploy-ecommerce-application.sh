#!/bin/bash
#
# This script is copied from KodeKloud

function print_color() {
    case $1 in
        "green") COLOR="\033[0;32m" ;;
        "red")   COLOR="\033[0;31m" ;;
        "*")     COLOR="\033[0m" ;;
    esac

    NC="\033[0m"
    echo -e "${COLOR}$2 ${NC}"
}

function check_service_status() {
    service_name=$1
    is_service_active=$(systemctl is-active $service_name)
    if [ $is_service_active = "active" ]
    then
        print_color "green" "$service_name is active."
    else
        print_color "red" "$service_name is not active."
    fi
}

function is_firewalld_rule_configured() {
    port=$1
    firewalld_ports=$(sudo firewall-cmd --list-all --zone=public | grep -i ports)
    if [[ $firewalld_ports = *$port* ]]
    then
        print_color "green" "Port $port is configured."
    else
        print_color "red" "Port $port is not configured."
    fi
}


function check_item() {
    web_page="$1"
    item=$2
    if [[ $web_page = *$item* ]]
    then
        print_color "green" "Item $item is found in the webpage."
    else
        print_color "red" "Item $item is not found in the webpage."
    fi
}



# Install firewalld
print_color "green" "Installing firewalld ..."
sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
check_service_status firewalld


# Install mariadb
print_color "green" "Installing MariaDB ..."
sudo yum install -y mariadb-server
#sudo vim /etc/my.cnf
sudo systemctl start mariadb
sudo systemctl enable mariadb
check_service_status mariadb

# Add FirewallD rules for database
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

is_firewalld_rule_configured 3306

# Configure Database
print_color "green" "Configuring DB ..."
cat > configure-db.sql <<-EOF
CREATE DATABASE ecomdb;
CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
FLUSH PRIVILEGES;
EOF

sudo mysql < configure-db.sql

# Load inventory data into Database
print_color "green" "Loading inventory data into DB ..."
cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");

EOF

sudo mysql < db-load-script.sql


mysql_db_results=$(sudo mysql -e "use ecomdb; select * from products;")
if [[ $mysql_db_results = *Laptop* ]]
then
    print_color "green" "Inventory data are loaded."
else
    print_color "red" "Inventory data are not loaded."
    exit 1
fi




# ------------------ Web Server Configuration ----------------------
# Install apache web server and php
print_color "green" "Configuring Web Server ..."
sudo yum install -y httpd php php-mysql

# Configure Firewall rules for web server
print_color "green" "Configuring Firewalld rules for web server ..."
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload
is_firewalld_rule_configured 80

sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf

# Start and enable httpd service
print_color "green" "Starting web server ..."
sudo systemctl enable httpd
sudo systemctl start httpd
check_service_status httpd

# Install GIT and download source code repo
print_color "green" "Cloning git repo ..."
sudo yum install -y git
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/

# Replace database IP with localhost
sudo sed -i 's/172.20.1.101/localhost/g' /var/www/html/index.php

sudo systemctl restart httpd
check_service_status httpd

print_color "green" "All set."

web_page=$(curl "http://localhost")
for item in Laptop Drone VR Watch
do
    check_item "$web_page" $item
done
