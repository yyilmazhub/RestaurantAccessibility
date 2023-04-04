# Fonctionnement du déploiement de votre projet sur vos serveurs pre-prod et prod

**ATTENTION** l'environnement de production ne peut se tester que sur le serveur de preprod ou de prod il s'agit d'une configuration particulière. Donc si vous exécutez la commande suivante : ./dcTool prod up sur votre machine personnelle, la mise en production ne sera pas fonctionnelle. À moins que vous suiviez ce qui est indiqué dans le README.md du dépôt. 

## les serveurs

* pre-prod : serveurs IUT (attention proxy, attention pas public)
* prod : serveurs IUT (attention proxy, public)

Les logins et mdp de connexion aux serveurs de pre-prod et de prod ont été donnés dans le canal Slack de votre projet. 

## les scripts de déploiement

* deploy.sh preprod: permet de déployer votre application web sur la pre-prod (arrêt pile, téléchargemnt du code source depuis git et lancement pile)
* deploy.sh prod: permet de déployer votre application web sur la prod (arrêt pile, téléchargemnt du code source depuis git et lancement pile)
* stop.sh preprod : permet d'arrêter la pile Docker de la pre-prod (suppression des volumes api-vendor, mysql-data et mongo-data )
* stop.sh prod : permet d'arrêter la pile Docker de la prod (suppression des volumes api-vendor, mysql-data et mongo-data )
* restart.sh preprod : permet de redémarrer les conteneurs de la pre-prod (pas de mise à jour du code source)
* restart.sh prod : permet de redémarrer les conteneurs de la prod (pas de mise à jour du code source)


Pour la pre-prod, le code source correspond au dernier commit de la branche **release** de votre dépôt. L'objectif de la pre-prod est de tester une version de release d'un sprint. 

Pour la prod, le code source correspond au dernier commit de la branche **master** de votre dépôt. C'est le serveur accessible par le commanditaire de votre projet. 

## pré-requis -> opération déjà faite sur les serveurs de l'IUT

Le mot de passe de la clé SSH a été donnée dans le canal Slack de votre projet. 

Afin de pouvoir cloner votre dépôt sur le serveur de preprod ou de prod il faut installer une clé SSH sur chaque serveur. Il faut donc suivre la procédure suivante sur chaque serveur : 

source: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

1. $ mkdir ~/.ssh
2. $ cd ~/.ssh
3. $ ssh-keygen -t ed25519 -C "mel"
    -> le mél correspond au mél de votre compte github 
    -> nom du fichier : id_github_ed25519
    -> mot de passe : ce que vous voulez, mais il faut bien le noter
4. $ nano ~/.ssh/config
	Host github.com
        AddKeysToAgent yes
        IgnoreUnknown UseKeychain
        UseKeychain yes
        IdentityFile ~/.ssh/id_github_ed25519

5. $ eval "$(ssh-agent -s)"
    -> cela démarre l'agent ssh en arrière tâche. 
6. $ ssh-add -k ~/.ssh/id_github_ed25519
    -> cela ajoute la clé nouvellement créée à son trousseau et ce de manière permanente
7. il faut maintenant ajouter cette clé à votre compte github
    * aller dans les préférences de votre compte github.com (Settings)
    * aller dans la rubrique SSH and GPG keys
    * cliquer sur New ssh keys
    * donner un titre à votre clé et copier le contenu de la clé publique
8. $ ssh -T git@github.com
    -> cela teste si la clé SSH est reconnue par Github, le message suivant devrait s'afficher : 
    "Hi xxxxxxx! You've successfully authenticated, but GitHub does not provide shell access."

À partir de maintenant toutes les opérations pourront se faire en ligne de commande avec cette clé SSH

## mise à jour des scripts

Ces scripts bash sont à **versionner** dans votre dépôt de projet (pour tout regrouper au même endroit).  
Il faut mettre ces scripts à jour par rapport à votre projet, puis les déployer via SFTP sur le serveur concerné. Cette mise à jour se fait par sFTP. 

1. Installer l'extension VS Code SFTP Liximomo. Le paramétrage des liaisons sFTP des deux serveurs est déjà fait (cf fichier sftp.json prédsent dans le dossier .vscode). 
2. Ouvrez la palette de VS Code, tapez SFTP: Set Profile.  
3. Choisissez le serveur que vous voulez mettre à jour : preprod ou prod.
4. Allez dans le menu latéral gauche SFTP. 
5. Tapez votre mot de passe. 
6. Dès que vous modifiez et enregistrez un des trois fichiers suivants : deploy.sh, restart.sh ou stop.sh il sera automatiquement mis à jour sur le serveur sélectionné. 


### correction de bug de l'extension SFTP Liximomo (v1.12.9)
source : https://stackoverflow.com/questions/67506693/error-no-such-file-sftp-liximomo-extension

1. Shutdown / Quit VS Code.
2. Locate the following file:
Mac OS X:
~/.vscode/extensions/liximomo.sftp-1.12.9/node_modules/ssh2-streams/lib/sftp.js
Windows:
C:\Users\account_name\.vscode\extensions\liximomo.sftp-1.12.9\node_modules\ssh2-streams\lib\sftp.js
3. Make a backup copy of the file.
4. Modify line 388, which should be:
if ( code === STATUS_CODE . OK ) { changing it to:
if (code === STATUS_CODE.OK || code === STATUS_CODE.NO_SUCH_FILE) {
5. Save the file.
6. Relaunch VS Code; test by uploading or downloading from your sftp server. The error should not be present.


## Remarques au sujet des bases de données

cf fichier README-BDD.MD


