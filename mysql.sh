#!/bin/bash

echo "Running mysql_secure_installation script..."

# Set the root password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'redhat'; FLUSH PRIVILEGES;"

# Remove anonymous users
mysql -uroot -predhat -e "DELETE FROM mysql.user WHERE User='';"

# Disallow root login remotely
mysql -uroot -predhat -e "UPDATE mysql.user SET Host='localhost' WHERE User='root';"

# Remove the test database
mysql -uroot -predhat -e "DROP DATABASE IF EXISTS test; DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"

# Reload privilege tables
mysql -uroot -predhat -e "FLUSH PRIVILEGES;"

echo "mysql_secure_installation completed."
