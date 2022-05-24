# Pour accéder à Kali Linux 

Lien : `https://localhost:6901`

User : `kasm_user`  
Password : `password` 

## Compiler les images 

Executer la commande suivante : 

```
docker-compose up -d
```

## Récupérer les infos du network

Lancer la commande suivante : 

```
docker inspect apache | grep IPAddress
```

Mettre l'ip sur un navigateur web de kali linux pour voir si les containeurs communiquent bien.

!!!!!
```
Il faut aussi récupérer l'ip du container mariadb, et mettre celle-ci dans la ligne 4 des fichiers `db_requester` du dossier `html`.
```
!!!!!

## Mysql

Executer la commande suivante : 

```
mysql -h 127.0.0.1 -u root -p citizix_db < "[PATH]/setup_db.sql"
```

Permet d'éxécuter le script de création de la base de données.


Connexion à la base de données : 

```
mysql -h 127.0.0.1 -u root -p
```
Mot de passe : `S3cret`

## Infos
Un dossier htlm est créé et pointera vers le dossier `/var/www/html` de apache2.

Le volume kali sert à transférer les fichiers de Kali Linux sur le répertoire /home de l'user.

Le volume sur le dossier ./conf est utilisé pour les fichiers de configuration mod-security.