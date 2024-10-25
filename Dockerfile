# Utilise l'image officielle de PrestaShop avec PHP 7.4
FROM prestashop/prestashop:1.7.8.11

# Variables d'environnement pour éviter les questions interactives
ENV PS_INSTALL_AUTO=1
ENV DEBIAN_FRONTEND=noninteractive

# Installe wget et unzip, puis télécharge et installe PrestaShop
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://download.prestashop.com/download/releases/prestashop_1.7.8.7.zip -O /var/www/html/prestashop.zip && \
    unzip -o /var/www/html/prestashop.zip -d /var/www/html/ && \
    rm /var/www/html/prestashop.zip && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Définir le répertoire de travail
WORKDIR /var/www/html
