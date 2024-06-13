#!/bin/bash
echo "Configuring WEB Server..."
echo "<html><body><h1>Welcome to cimatec.com.br</h1></body></html>" > /var/www/html/index.html
systemctl restart apache2
