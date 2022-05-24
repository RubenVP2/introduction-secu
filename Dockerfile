FROM ubuntu/apache2

# Copy du dossier html
COPY ./html /var/www/html

# Mise à jour des dépendances
RUN apt-get update -y && apt-get upgrade -y

RUN apt search libapache2-mod-sec

# Ajout du répository pour libapache2-mod-security2
RUN apt-get install -y software-properties-common

# Installation de libapache2-mod-security2
RUN apt-get install libapache2-mod-security2 -y

# Restart du service apache2
RUN service apache2 restart

# Copy du fichier de conf 
RUN cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf

# Installation de git
RUN apt-get install git -y

# Clone du répertoire dans /usr de modsecurity owasp
RUN cd /usr && git clone https://github.com/SpiderLabs/owasp-modsecurity-crs.git

# Moove crs rules
RUN mkdir /etc/modsecurity/rules
RUN cd /usr/owasp-modsecurity-crs/rules && cp *.* /etc/modsecurity/rules/

# Installation de nano
RUN apt-get install nano -y

# Installation du module apache php
RUN apt-get update && apt-get install php libapache2-mod-php -y

# Installation mariadb
RUN apt-get install mariadb-server -y

RUN service mariadb start

# Expose les ports pour mariadb 
EXPOSE 3306
