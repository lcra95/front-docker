FROM httpd:latest

# Habilitar el módulo rewrite
RUN sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Habilitar el uso de .htaccess y configurar el AllowOverride
RUN sed -i '/<Directory "\/usr\/local\/apache2\/htdocs">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /usr/local/apache2/conf/httpd.conf

# Copiar el archivo .htaccess
COPY ./html/.htaccess /usr/local/apache2/htdocs/.htaccess
