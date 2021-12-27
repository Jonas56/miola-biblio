# Administration systeme sous LINUX

## Table of contents

- [Introduction]()
- [Gestion des utilisateurs]()
- [Gestion des packages]()
- [Demarage et niveau de fonctionnement]()
- [Systeme de fichiers]()
- [Gestion des quotas]()
- [Sauvegarde et récupération]()

## Resources

- [Documentation](https://wiki.centos.org/Documentation)

## Introduction

<!-- TODO: Linux historique et definition-->

## Gestion des utilisateurs

<!-- TODO: -->

Un utilisateur est une entité, dans un système d'exploitation Linux, qui peut manipuler des fichiers et effectuer plusieurs autres opérations. Chaque utilisateur se voit attribuer un identifiant unique **UID** pour chaque utilisateur du système d'exploitation. Le propriétaire d’un fichier est déterminé par ce numéro. Ces utilisateurs seront aussi dotés d’un nom d’utilisateur unique (**login**) et d’un mot de passe (**password**) pour qu’ils puissent s’authentifier lors de leur connexion au système.

### Types de comptes

- **Superutilisateur (root):** Il s'agit du compte d'utilisateur principal du système Linux. Il est automatiquement créé lors de l'installation. Il a le privilège le plus élevé dans le système. Il peut effectuer n'importe quel travail administratif et peut accéder à n'importe quel service. Ce compte est destiné à l'administration du système et ne doit être utilisé qu'à cette tâche. Il ne doit pas être utilisé pour des activités de routine. Il ne peut pas être supprimé. Mais si besoin, il peut être désactivé.
- **Comptes ordinaires:** Il s'agit du compte d'utilisateur normal. Lors de l'installation, un compte utilisateur normal est créé automatiquement. Après l'installation, nous pouvons créer autant de comptes d'utilisateurs réguliers que nécessaire. Ce compte a des privilèges modérés. Ce compte est destiné aux travaux courants. Il ne peut effectuer que les tâches pour lesquelles il est autorisé et ne peut accéder qu'aux fichiers et services pour lesquels il est autorisé. Selon les besoins, il peut être désactivé ou supprimé.
- **Comptes système (service account):** on trouve sur le système toute une série de comptes qui ne sont pas affectés à des personnes. Ceux-ci servent à faciliter la gestion des droits d’accès de certaines application et démons. Ainsi en lançant le serveur Web sous l’identité du compte "apache", on pourra aisément limiter ses droits d’accès à certains fichiers.

### Groupes

- Les groupes sont des entitées logiques qui permettent l'organisation des utilisateurs
- Chaque groupe possède un identificateur ( le
  GID)
- Un utilisateur appartient à un groupe principale.

### Le fichier `/etc/passwd`

- est une base de données en texte brut qui contient des informations pour tous les comptes d'utilisateurs du système;
- Il appartient à root;
- Le fichier ne peut être modifié que par root ou les utilisateurs avec des privilèges **sudo** et lisible par tous les utilisateurs du système.
- Ce fichier contient une ligne par compte utilisateur. Chaque ligne identifie un compte d'un utilisateur. Les lignes sont composées de 7 champs séparés par des « : »

`username:password:UID:GID:commentaire:repertoire:shell`

- **Username**: La chaîne que vous saisissez lorsque vous vous connectez au système. Chaque nom d'utilisateur doit être une chaîne unique sur la machine.
- **password:** le mot de passe
- **UID:** l'identificateur de l'utilisateur, il doit être unique. C'est un entier.
- **GID:** l'identificateur du groupe principale de l'utilisateur
- **commentaire (GECOS):** un champ commentaire pour la description du compte
- **repertoire:** le répertoire de travail de l'utilisateur
- **shell**: le shell de connexion de l'utilisateur

### Le fichier `/etc/shadow`

- Le fichier /etc/shadow stocke le mot de passe réel dans un format crypté (plus comme le hachage du mot de passe) pour le compte de l'utilisateur avec des propriétés supplémentaires liées au mot de passe de l'utilisateur.
- Généralement, l'entrée du fichier shadow se présente comme suit:

`username:password:lastchg:min:max:warn:inactive:expire:`

- **password:** la chaîne cryptée du mot de passe
- **Last password change (lastchanged):** nombre de jours depuis le 1er janvier 1970 pendant lesquels le mot de passe a été modifié pour la dernière fois.
- **min:** nombre minimum de jour entre deux modifications de mot de passe
- **max:** durée de validité d'un mot de passe en nombre de jour
- **warn:** nombre de jours pendants lequel un utilisateur recevra un message l'invitant à modifier son mot de passe avant expiration
- **inactive:** nombre de jour ou le compte est autorisé à être inactif, avant d'être verrouillé
- **expire:** date d'expiration du compte.

### Le fichier `/etc/group`

- Il stocke les informations de groupe ou définit les groupes d'utilisateurs, c'est-à-dire qu'il définit les groupes auxquels les utilisateurs appartiennent. Il y a une entrée par ligne, et chaque ligne a le format suivant:

`foo:x:24:vivek,student13,raj`

- Nom du Groupe
- Mot de passe
- GID
- Liste des utilisateurs autorisés à se connecter au groupe (les noms sont séparés par des virgules)

### Créer un utilisateur (useradd)

Ajouter un utilisateur jonas sans spécifier son UID :

```console
[root@localhost ~]# useradd jonas
[root@localhost ~]# cat /etc/passwd
```

Resultat:

```console
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
.
.
.
ident:x:98:98:pident user:/:/sbin/nologin
radvd:x:75:75:radvd user:/:/bin/false
jonas:x:1000:0::/home/jonas:/bin/bash
```

- Une entrée est ajoutée dans le fichier /etc/passwd sans le mot de passe.
- Un user id par défaut (UID) est assigné à l'utilisateur jonas.
- Par défaut RedHat crée un nouveau groupe qui sera assigné à cet utilisateur.

Ajouter un utilisateur user2 en spécifiant son UID

```console
[root@localhost ~]# useradd -u 1040 user2
```

Ajouter un utilisateur user3 en spécifiant son groupe par défaut

```console
[root@localhost ~]# useradd –g dev user3
```

Ajouter un utilisateur user4 en spécifiant son groupe par défaut et ses groupes secondaires

```console
[root@localhost ~]# useradd –g dev –G test,prod user4
```

Ajouter un utilisateur user5 en spécifiant un commentaire

```console
[root@localhost ~]# useradd –c ‘Consultant pour projet x’ user5
```

### Changer de mot de passe (passwd)

- Supprimer le mot de passe d'un utilisateur:

```console
[root@localhost ~]# passwd -d NomUtilisateur
```

- Modifier le mot de passe d'un utilisateur

```console
[root@localhost ~]# passwd NomUtilisateur
```

- Verrouiller le compte d'un utilisateur

```console
[root@localhost ~]# passwd -l NomUtilisateur
```

- Forcer le changement de mot de passe à la prochaine connexion

```console
[root@localhost ~]# passwd -f NomUtilisateur
```

### Supprimer un utilisateur (userdel)

- Supprimer un utilisateur sans supprimer son répertoire personnel:

```console
[root@localhost ~]# userdel user1
```

- Supprimer un utilisateur et son répertoire personnel:

```console
[root@localhost ~]# userdel -r user1
```

### Modifier les attributs d’un utilisateur (usermod)

- Changer de UID

```console
[root@localhost ~]# usermod -u 4444 user1
```

- Changer de groupe :

```console
[root@localhost ~]# usermod -g 2222 user1
```

- On peut aussi utiliser le nom du groupe :

```console
[root@localhost ~]# usermod -g dev user1
```

- Changer de shell :

```console
[root@localhost ~]# usermod -s /bin/csh user1
```

### Commandes de gestion des groupes

- `groupadd` : La commande groupadd permet de créer des groupes. La syntaxe de la commande est:

- Exemple : `groupadd -g GID nomDuGroupe`

Avec GID est l’identifiant du groupe

- `groupmod` : cette commande permet de modifier le nom ou le GID d'un groupe. La syntaxe de la commande:

- `groupmod [-g GID] [-n newNom] oldNom`

- `groupdel` : permet de supprimer un groupe ne contenant pas de membres ( un groupe vide)

## Gestion des packages

L'installation, la mis a jour, et la suppression de packages logiciels sur des machines Linux sont l'une des tâches courantes que chaque administrateur système doit effectuer.

La gestion des packages est une méthode d'installation, de mise à jour, de suppression et de suivi des mises à jour logiciels à partir de référentiels spécifiques (dépôts) dans le système Linux. Les distributions Linux utilisent souvent différents outils de gestion de packages. Les distributions basées sur Red Hat utilisent RPM (RPM Package Manager) et YUM (Yellowdog Updater, Modified).

### La gestion des paquetages par l'outil yum

YUM est le principal outil de gestion des packages pour l'installation, la mise à jour, la suppression et la gestion des packages logiciels dans Red Hat Enterprise Linux. YUM effectue la résolution des dépendances lors de l'installation, de la mise à jour et de la suppression des packages logiciels. YUM peut gérer les packages à partir des référentiels installés dans le système ou à partir des packages .rpm. Le fichier de configuration principal pour YUM se trouve dans /etc/yum.conf, et tous les dépôts se trouvent dans /etc/yum.repos.d.

Il est facile de gérer les packages sous Linux avec YUM. Sur la ligne de commande, entrez

```console
# yum -option commande
```

Il existe de nombreuses options et commandes disponibles à utiliser avec YUM.

- Voici les commandes les plus utilisées:

<p align=center>

|   Comande   |                          Usage                           |
| :---------: | :------------------------------------------------------: |
| yum install |             Installe les packages spécifiés              |
|   remove    |             Supprime les packages spécifiés              |
|   search    |     Si on veut étendre la recherche à la description     |
|    info     |   Pour avoir des informations détaillées sur un paquet   |
|   update    |    Met à jour chaque package dans la dernière version    |
|  repo list  |                  Lister tous les dépôts                  |
|   history   | Affiche ce qui s'est passé dans les transactions passées |

</p>

- Les options suivantes sont couramment utilisées avec YUM:

<p align=center>

|    Option     |                                   Description                                   |
| :-----------: | :-----------------------------------------------------------------------------: |
|      -C       |                        Execute à partir du cache système                        |
|  --security   | Comprend des packages qui fournissent un correctif pour un problème de sécurité |
|      -y       |                        Répond oui à toutes les questions                        |
| --skip-broken |                    Ignore les paquets causant des problèmes                     |
|      -v       |                                     Verbose                                     |

</p>

YUM propose de nombreuses options pour la gestion des packages. Pour des informations détaillées sur les options, executer la commande `man yum` et `yum –help`. Voici également un lien vers [Yum cheat sheet](https://access.redhat.com/articles/yum-cheat-sheet).

Yum facilite l'installation par :

- La vérification de la validité de la signature des paquetages.
- La résolution du problème de dépendance logiciels.
- Permet la mise à jour de l'ensemble des paquetages logiciels installés.
- La recherche de logiciel selon des critères
- Les dépôts utilisés sont des serveurs web qui contiennent des logiciels

### La gestion des paquetages par l'outil rpm

RPM est un outil de gestion de packages populaire dans les distributions basées sur Red Hat Enterprise Linux. À l'aide de RPM, vous pouvez installer, désinstaller et interroger des packages logiciels individuels. Pourtant, il ne peut pas gérer la résolution des dépendances comme YUM. RPM vous fournit une sortie utile, y compris une liste des packages requis. Un package RPM se compose d'une archive de fichiers et de métadonnées. Les métadonnées incluent des scripts d'assistance, des attributs de fichier et des informations sur les packages.

RPM maintient une base de données des packages installés, ce qui permet des requêtes puissantes et rapides. La base de données RPM se trouve dans /var/lib et le fichier est nommé \_\_db\*.

RPM a quelques modes de base: interroger, vérifier, installer, mettre à niveau, effacer, afficher les balises de requête, afficher la configuration. Au moins un de ces modes doit être sélectionné pour effectuer les tâches de gestion des packages. Chaque mode a son propre ensemble d'options. Par exemple, le mode d'installation i possède son propre ensemble d'options d'installation. Les options pour les modes se trouvent sur les pages de manuel RPM par la commande `man rpm`.

Les modes courament utilisés:

| Modes |          Description           |
| :---: | :----------------------------: |
|  -i   |       install un package       |
|  -U   |     mis a jour un package      |
|  -e   |       efface un package        |
|  -V   |       Verifie un package       |
|  -q   | Interroge (queries) un package |

Voici quelques options générales couramment utilisées:

|    Modes    |    Description     |
| :---------: | :----------------: |
| -? \| -help | il affiche le help |
|  --version  | affiche la version |
|     -v      |      verbose       |

Pour installer ou mettre à jour un package .rpm à l'aide de RPM, exécutez cette commande:

```consolehell
[root@localhost ~]# rpm -i package-file
[root@localhost ~]# rpm -U package-file
[root@localhost ~]# rpm -ivh package-file
## -i pour install && -v verbose && -U pour upgrade && h pour hash (cette option affiche le # comme barre de progré de l'opération)
```

Pour interroger un package .rpm executer cette commande:

```consolehell
[root@localhost ~]# rpm -qu mysql
mysql-community-libs-5.5.50-2.el6.x86_64.rpm
[root@localhost ~]#
```

Pour effacer un package, utiliser cette commande:

```consolehell
[root@localhost ~]# rpm -evh mysql
```

### Installation des logiciels depuis le code source

### Installation des logiciels par scripts ou interfaces graphique

## Demarage et niveaux de fonctionnement

- [Cool link 1](https://www.geeksforgeeks.org/what-happens-when-we-turn-on-computer/)

- [Cool link 2](https://www.geeksforgeeks.org/run-levels-linux/)
