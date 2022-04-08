#!/bin/bash

##########################################################################################
# INSTALLER->nginx - install nginx 
# nginx.installer.sh script for installer.sh
# nginx setup
##########################################################################################

# TOOLS
source "./installer-tools.sh" # shared fn and vars

# APACHE
echo "${EMPTY}"
echo "${LINECAP} nginx setup"
echo "${EMPTY}"

sudo apt install nginx -y
sudo ufw allow 'Nginx Full' -y
sudo nft add rule inet filter input tcp dport {80, 443} ct state new,established counter accept

sudo rm /etc/nginx/sites-available/default # rewrite default configuration
cat << EOF > /etc/nginx/sites-available/default
server {

	listen 80 default_server;
	listen [::]:80 default_server;

	listen 443 ssl default_server;
	listen [::]:443 ssl default_server;

	server_name _;
	root /var/www/html;

	# include snippets/snakeoil.conf;


	index index.php index.html index.htm index.nginx-debian.html;
    # location
	location / {
		# First attempt to serve request as file, then as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}
	# pass PHP scripts to FastCGI server
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
	
		# With php-fpm (or other unix sockets):
		fastcgi_pass unix:/run/php/php7.4-fpm.sock;
		# With php-cgi (or other tcp sockets):
		fastcgi_pass 127.0.0.1:9000;
	}
	# deny access to .htaccess files, if Apache's document root concurs with nginx's one
	location ~ /\.ht {
		deny all;
	}
}
EOF

# TOUCH-STATUS
touch "${INSTALLED}/nginx.status" #touch .status file