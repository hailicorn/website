# Hailicorn Home page

## Virtual Host Configuration
```
<VirtualHost *:80>
    ServerAdmin info@hailicorn.com
    ServerName hailicorn.com
    ServerAlias www.hailicorn.com
    DocumentRoot /var/www/hailicorn.com/website/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
