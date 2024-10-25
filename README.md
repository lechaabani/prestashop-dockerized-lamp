# LAMP PrestaShop Dockerisé

Ce projet permet de déployer PrestaShop dans un conteneur Docker avec MySQL et phpMyAdmin.

## Prérequis

- Docker
- Docker Compose

## Instructions

1. Clonez le repository ou téléchargez ce projet.
2. Accédez au répertoire du projet dans le terminal.
3. Exécutez la commande suivante pour démarrer les services :

   ```bash
   docker-compose up -d --build
   ```

4. Accédez à PrestaShop à l'adresse [http://localhost:8080](http://localhost:8080).
5. Accédez à phpMyAdmin à l'adresse [http://localhost:8081](http://localhost:8081) avec les identifiants :
   - **Serveur** : mysql
   - **Nom d'utilisateur** : prestashop
   - **Mot de passe** : prestashop

## Astuce : Problème de Permissions avec /tmp

Si vous rencontrez des erreurs liées à la création de fichiers temporaires, comme `Can't create/write to file '/tmp/... (Errcode: 13 - Permission denied)`, vous pouvez ajouter un volume temporaire pour éviter ces problèmes.

1. Ouvrez votre fichier `docker-compose.yml`.
2. Ajoutez la ligne suivante sous le service MySQL pour utiliser un volume temporaire personnalisé :

   ```yaml
   volumes:
     - mysql_tmp:/tmp  # Volume temporaire
   ```

3. Définissez le volume `mysql_tmp` dans la section des volumes :

   ```yaml
   volumes:
     mysql_tmp:
   ```

Cela permet de s'assurer que MySQL a les permissions nécessaires pour écrire dans le répertoire temporaire.

## Contribution

Les contributions sont les bienvenues !
