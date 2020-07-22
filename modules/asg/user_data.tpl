#! /bin/bash
sudo yum install -y mysql
export MYSQL_HOST=${endpoint}
exec "$@"
./user_data.tpl printenv | grep MYSQL_HOST
mysql --user=${user} --password=${password} wordpress 
CREATE USER 'wordpress' IDENTIFIED BY 'wordpress-pass';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpress;
FLUSH PRIVILEGES;
Exit
sudo yum install -y httpd
sudo service httpd start
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
cd wordpress
cp wp-config-sample.php wp-config.php
sed 's/database_name_here/${dbname}/g;s/username_here/${user}/g;s/password_here/${password}/g;s/localhost/${endpoint}/g' wp-config.php
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
cd /home/ec2-user
cp -r /var/lib/cloud/instance/wordpress/* /var/www/html
service httpd restart
