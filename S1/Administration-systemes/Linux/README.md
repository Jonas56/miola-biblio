# Administration systeme sous LINUX

## Table of contents

- [Introduction](#introduction)
- [Gestion des utilisateurs](#gestion-des-utilisateurs)
- [Gestion des packages](#gestion-des-packages)
- [Demarage et niveau de fonctionnement](#demarage-et-niveaux-de-fonctionnement)
- [Système de fichiers](#système-de-fichiers)
- [Gestion des quotas](#gestion-des-quotas)
- [Sauvegarde et récupération](#sauvegarde-et-récupération)

## Resources

- [Documentation](https://wiki.centos.org/Documentation)
- [Learn Linux, 101 IBM](https://developer.ibm.com/tutorials/l-lpic1-map/)

## Introduction

<p align=center>
  <img src="https://www.pngkit.com/png/detail/201-2016309_gnulinux-logo-gnu-linux-logo-png.png" height=450>
</p>

<!-- Le système Unix a été créé par [AT&T](https://fr.wikipedia.org/wiki/American_Telephone_%26_Telegraph) au début des années 1970 et s'est notamment répandu dans le monde universitaire. Dès la fin de l'année 19772, des chercheurs de l'université de Californie apportèrent de nombreuses améliorations au système Unix et le distribuèrent sous le nom de Berkeley Software Distribution (BSD). Finalement, les distributions BSD furent purgées du code AT&T, et librement disponibles en 1991. La distribution de BSD a toutefois été l'objet d'une procédure judiciaire d'AT&T (en) au début des années 1990. -->

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
[root@localhost ~]# rpm -evh --nodeps mysql
## pour forcer la suppression meme si ce package est deja utilise
```

### Installation des logiciels depuis le code source

L’idée de l’installation consiste à :

- Télécharger les fichiers code source du logiciel
- Paramétrer l'installation selon le système
- Compiler ces programmes pour avoir les binaires
- Installer les binaires générés.

L’installation depuis le code source est souvent plus compliquée qu’une installation depuis un binaire avec rpm ou yum

Les codes sources sont disponibles sur le net sous format d’une archive compressée. Par
exemple : NomLogiciel-ver.tar.gz

- **Etapes d'installation**

  - Télécharger le logiciel : c'est un fichier .tar.gz par exemple
  - Décompresser et désarchiver : decompresser avec `gunzip NomLogiciel-ver.tar.gz` et desarchiver avec `tar xvf NomLogieciel.tar`
  - Se déplacer dans le dossier créé par le désarchivage avec la commande cd
  - Paramétrer le logiciel selon le système par le script
  - Compiler le logiciel en se basant sur le fichier « Makefile » généré par le script « configure » avec `make`
  - Installer les binaires par la commande : `make install`
  - – Pour désinstaller : `make clean `

- #### [Lien utile](https://www.digitalocean.com/community/tutorials/how-to-compile-and-install-packages-from-source-using-make-on-a-vps)

## Demarage et niveaux de fonctionnement

### Séquence de démarrage du système

Le démarrage d’un système Linux passe par les étapes suivantes :

- La phase de test du matériel par le BIOS via le POST (Power On Self Test)
- Lancement du chargeur du démarrage GRUB installé dans le MBR (Master Boot Record )
- Chargement du kernel en mémoire RAM
- Lancement du processus « init ».
- Le processus « init » lance d’autres processus et exécute les scripts définis dans le fichier « /etc/inittab »
- Le processus « init » lance le script « rc » en lui passant comme argument le niveau de démarrage
- Le script « rc » exécute l’ensemble des scripts dans le répertoire « /etc/rc.d/rcX.d » avec X le niveau de démarrage.
- Le processus « init » exécute à la fin le script « /etc/rc.local ».

<p align=center>
  <img src="https://4.bp.blogspot.com/-srC-qTNDJd0/WQUXd670NNI/AAAAAAAAJFM/j6jj3_F0X5gtKy71s1QZK1I50MTF6GHhwCLcB/s1600/linux-boot-process.png">
</p>

### Niveaux de fonctionnement (Run Levels)

- Les scripts dans le répertoire « /etc/rc.d/rcX.d » (X=0,1,2...) ont des noms sous la forme suivante: **SnnNom** ou bien **KnnNom**

  - **S** Pour les noms des scripts qui lancent des services (Start)
  - **K** Pour les noms des scripts qui arrêtent des services (Stop)
  - **nn** Est un numéro entre 0 et 99, il indique l'ordre d'exécution des scripts. On commence par le numéro le plus petit jusqu'au plus grand.

- Les niveaux de démarrage sous Linux sont:

  - **0** Arrêt du système, aucun service n’est activé.
  - **1** Niveau mono utilisateur.
  - **2** Mode multi utilisateurs sans certains services réseau comme NFS.
  - **3** Mode multi utilisateurs complet.
  - **4** Réservé ( peut être définit par l’administrateur ).
  - **5** Mode multi utilisateurs complet avec connexion en mode graphique.
  - **6** Redémarrage du système. Tous les services seront arrêtés puis ils seront redémarrés
  - **s** Niveau single (pour la maintenance ou récupération).

- Les scripts de démarrage pour chaque niveau d'exécution seront différents et effectueront des tâches différentes. Ces scripts de démarrage correspondant à chaque niveau d'exécution peuvent être trouvés dans des fichiers spéciaux présents dans les sous-répertoires rc. Dans le répertoire `/etc/rc.d`, il y aura soit un ensemble de fichiers nommés rc.0, rc.1, rc.2, rc.3, rc.4, rc.5 et rc.6, soit un ensemble de répertoires nommés rc0.d, rc1.d, rc2.d, rc3.d, rc4.d, rc5.d et rc6.d.

- Le niveau de fonctionnement par défaut d'un système est précisé dans le fichier `/etc/inittab` avec l'action `initdefault`. La ligne suivante du fichier `/etc/inittab` indique que le niveau de démarrage par défaut est 5: **id:5:initdefault:**

- Afficher le niveau de fonctionnement d'un système on utilise la commande `who -r` ou bien `runlevel`

  - La commande `runlevel` affiche deux valeurs: le niveau précédent suivie de niveau actuel. La valeur **N** indique un système éteint

- Le processus `init`
  - Il est lancé au démarrage du système.
  - Il est responsable de faire passer le système à un niveau de fonctionnement donné
  - Pour passer d'un niveau à un autre on peut lancer la commande `init` avec comme argument le niveau vers lequel on souhaite passer

```console
[root@localhost ~]# init 3
```

- Le script **/etc/rc.d/rc.sysinit**
  - Ce script est lancé par `init` au démarrage
  - Il permet l'initialisation des paramètres système (nom, mémoire, chargement des modules, montage des disques, application de la politique Selinux...)

### Gestion et Paramétrage des niveaux de fonctionnement

- Les niveaux de fonctionnement prédéfinis dans un système précisent quels sont les services qui doivent être lancé et ceux qui doivent être arrêtés quand `init` fait passer le système à ce niveau.
- Il est possible de paramétrer ces niveaux et de préciser l'état de chaque service dans un niveau donné.
- Plusieurs commandes sont disponibles selon les versions de Unix. Par exemple dans les systèmes qui hérite de **Redhat**:

  - `chkconfig`
  - `ntsysv`
  - `system-config-services` ou bien `redhat-config-services`

- La commande `chkconfig` :

  - Permet de lister l'ensemble des services et leurs états dans chaque niveau de démarrage

  ```console
  [root@localhost ~]# chkconfig list
  ```

  - Permet de lister l'état d'un service donné

  ```console
  [root@localhost ~]# chkconfig list sendmail
  ```

  - Permet de changement de l'état d'un service dans un (ou plusieurs) niveau donné.

  ```console
  [root@localhost ~]# chkconfig level 3 sendmail on
  [root@localhost ~]# chkconfig level 235 sendmail on
  [root@localhost ~]# chkconfig level 3 sendmail off
  ```

- La commande `ntsysv`: Permet la gestion de l'état des services dans un niveau de démarrage

  - Pour gérer les services dans le niveau de fonctionnement actuel on lance:

  ```console
  [root@localhost ~]# ntsysv
  ```

  - Pour gérer les services dans le niveau de fonctionnement donné on le précise comme argument : (par exemple pour le niveau 5)

  ```console
  [root@localhost ~]# ntsysv 5
  ```

- La commande `system-configservices`: permet la gestion des services en mode graphique.

- Démarrage en mode single

Le mode single est un niveau de démarrage utilisé pour la maintenance du système Il est accessible depuis le menu de **GRUB** au démarrage ou bien par la commande `init s `

## Système de fichiers

<!-- [useful link]: https://tldp.org/LDP/intro-linux/html/sect_03_01.html
[useful link 2]: https://www.tutorialspoint.com/unix/unix-file-system.htm -->

Un système de fichiers est une structure de données. La commande `mkfs`, qui crée un système de fichier, inscrit cette structure de données dans une partition.
Tous les systèmes de fichier comporte au moins trois tables systèmes:

- **le super Block** qui contient les informations clé concernant le système de fichiers
- **la table des inodes** c'est à dire la table déscripteur du fichier. Chaque fichier est indentifié d'une manière unique par le numéro d'inode qui le décrit.
- **Répertoire** qui assure les correspondances entre un nom fichier et un numéro inode

### Structure d'un inode

Le terme _INODE_ designe le descripteur d'un fichier. Il contient les attributs des fichiers, (ceux afficher par la commande `ls -l`), et une table d'accés au blocs de données. Il existe une table d'inodes par disque. L'espace qu'elle occupe est reservée à la création du système de fichiers sur ce disque. La taille de la table des inodes est donc un paramétre statique important d'un système de fichier, car elle fige la norme de fichier que l'on peut au plus créer sur le disque.

Pour un disque donné le numero d'inode est l'unique moyen d'indentifier un fichier sans ambiguïte. La commande `ls -i` permet de connaitre le numéro d'ionde d'un fichier

Le système de fichier de base c'est **ext2** qui dérive du système de fichier FFS (File Fast System | Créer par L'université de Berkeley)

### Les differents types de systèmes de fichiers

- **MINIX** - Le premier système de fichier utiliser par Linux
- **ext2** - Le système de fichier standard du système linux (La base)
- **MsDOS** - le système de fichier de Windows
- **VFAT** - pour Windows
- **ext3**- le système de fichier avec journalisation, (**ext2** + La Journalisation)
- **ext4** - le système de fichier actuel

### Gestion de l'espace disque

L'espace disque est un resource précieux, même si les capacités des disques ont considerablement evolués dans ces dernières années, l'administrateur doit en contrôler l'usage, `du` et `df` sont deux commades importantes (y en a plusieurs).

- `df` : Indique l'espace libre d'un disque contenant un système de fichier monteé la taille de l'espace libre est indiqué et affiché en KO (Kilo Octects) -i (list inode information instead of block usage | --inodes) -k(like | --block-size=1K) et -T (print file system type | --print-type)
- `du` : Affiche le nombre de blocs d'un Ko utilise par un disque, -s (display only a total for each argument | --summarize) -k (like | --block-size=1K)

-- #### [Lien utile](https://www.redhat.com/sysadmin/du-vs-df#:~:text=df%20vs.,du&text=The%20(very%20complicated)%20answer%20can,a%20given%20directory%20or%20subdirectory.)

**REMARQUE**:
Il y a d'autres commandes qui permet d'afficher l'espace libre/occupé d'un disque, parmis ces commandes il y a la commande `find`, elle permet de rechercher des fichiers selon différents critères dont celui de la taille avec l'option `-size`

Exemple:

```console
[root@localhost ~]# find /home -size +100k -atime +90 -print
```

Resultat

```console
 /home/saidi_anass/.local/share/Trash/files/Settings.ui
```

### Commades Generiques

- `mkfs`: permet de créer un système de fichier
- `mount`: Monte un système de fichier
- `unmount`: démonte un système de fichier
- `fsck`: Vérifie un système de fichier
- `df`: espace libre
- `du`: espace occupe
- `lsof`: identifie les processus

### Commande propre a **ext2**

- `mke2fs`: Crée un système de fichier **ext2**
- `e2fsck`: Verifier un système de fichier **ext2**
- `tune2fs`: Permet de paramétrer un système de fichier **ext2**
- `debugfs`: Permet de debugger un système de fichier **ext2**

### Type des fichier sous Linux

Unix/Linux fait la difference comme tout les systèmes d'exploitation entre trois types de fichier:

- Les fichiers normaux

- Les Repertoires/Dossier (Folder). (Un repertoire est un fichier, tout est considére comme fichier sous Linux)

- Les fichiers Speciaux.

- **Les fichiers normaux** : Correspondant a des informations stockées sur un support magnétique (DVD, CD, Disque Dur, USB..), ces fichiers sont crées par des programmes utilisateur (compilateur du C ...) ou par des utilitaires système (un editeur de texte comme Vi, nano, Gedit, Vim, cat ou touch).

Le système Unix ne s'interesse pas au contenue d'un fichier normal, par contre il gere de façon très éfficace les informations permettant de preciser:

- Le proprietaire du fichier
- Les droits d'accés à ce fichier
- Le secteurs occupés sur le disque par ce fichier.

**REMARQUE**:
Le contenue d'un fichier normal relève des programmes qu'il a créer, bien souvent seul ce programme peut accéder au contenue de ce fichier, pour cela chaque logiciel peut utiliser sont propre format de stockage

- **Les Repertoires/Dossiers** : sont des fichiers particuliers dont le contenue est peu important pour les utilisateurs, mais extremement important pour le système.
  Cette categorie de fichiers se crée et se manipule par des primitives (Commandes internes au noyau | les principales sont, `mkdir` Crée un nouveau repertoire si possible, `cd` changer le repertoire actif si possible, `rmdir` supprimer un repertoire si possible)

- **Fichiers speciaux** : sont en fait des périphérique d’entré/sortie (Ecran, clavier, ...)

### Droits d'accés au système de fichiers

Au niveau de chaque fichier l’ensemble des utilisateurs reconnus par le système est devisé en 3 classes:

- le propriétaire du fichier, noté **u**
- le groupe des utilisateurs privilégiés, noté **g**
- tout le reste, noté **o** (other)
- tout le monde, noté **a** (all)

Pour chacune de ces classes d'utilisateurs le système contrôle trois modes différents d'accés aux fichiers:

- accés en lecture noter **r** (_read_ c'est le mode le plus important)
- accés en ecriture noter **w**(_write_ c'est le deuxieme degré d'importance)
- accés en execution note **x** (_execute_ c'est le troisieme degré d'importance)

La commande chmod permet de manipuler les droits d'accés pour les fichiers, elle fonctionne en deux modes :

- _chmod_ en mode symbolique :

  - pour donner le droit w pour un fichier f1 pour l'utilisateur: `chmod u+w f1`

- _chmod_ en mode absolue :

  - codage numerique du droit d'accés pour faciliter d'avantage la manipulation des droits d'accés aux fichiers, UNIX utilise un code pour représenter chaque droit, chaque classe d'utilisation. Ces codes sont exprimés en octale (base 8)

    |     |  r  |  w  |  x  | total |
    | --- | :-: | :-: | :-: | :---: |
    | u   | 400 | 200 | 100 |  700  |
    | g   | 40  | 20  | 10  |  70   |
    | o   |  4  |  2  |  1  |   7   |

_Q1_ : est-ce possible de connaitre les droits d'accés d'un fichier avant sa creation?

_R1_ : oui, a l'aide de la commande umask

_Q2_ : est-ce qu'on peut changer ces droits par défauts

_R2_ : oui en utilisant umask..

- **les droits par défaut pour un fichier est 666**
- **les droits par défaut pour un dossier est 777**

### Droits d'endossements

#### Dilemme:

On sait que les mots de passe des users sont stockés dans un fichier texte géneralement appelé **/etc/passwd**. Le propriétaire de ce fichier est l'admin qui est le seul en principe a puvoir y accéder en ecriture (droit **w**).
On sait aussi que chaque user peut changer lui même son mot de passe grace a la commande `passwd` qui correspond à un fichier éxecutable nommé le plus souvent `/bin/passwd` et pour lequel tout le monde dispose des droits **x**.
Comment peut on modifier grâce a un programme donné, les infos d'un fichier pour lequel on n'a pas le droit w

#### Solution

Grâce a un autre droit qui est le dorit d'endossement qui s'appele droit **uid**. Tout utilisateur qui a le droit d'éxecuter un fichier ayant le bit uid positionné (_uid=1_) est considéré par le système **pendant l'execution** comme étant le propriétaire de l'éxecutable. En d'autres termes, l'utilisateur qui éxecute un fichier avec le bit **uid** positionné hérite provisoirement les droits du propriétaire de l'éxecution. Ce droit peut être positionné grâce a la commande `setuid`, de la même façon le bit **gid** peut être positionné grâce a la commande `setgid`. **gid** signifie que tout utilisateur qui a le droit d'éxecuter un fichier pour lequel ce bit est positionné hérite pendant l'execution les droits a louer au groupe de ce fichier.

#### UID:

-** Pour un fichier exécutable .exe : si le bit UID est positionné (sa valeur = 1), il est représenté par s, numériquement égale à 4000. **
-** Le bit UID : représente droit d’endossement de l’identité du propriétaire. **
-** Pour un fichier exécutable .exe : si le bit UID est positionné pour un user donner.
Ce dernier hérite pendant l’exécution les droits alloués au propriétaire de ce fichier.
x devient s (rws) **

#### GID:

-** GID : sa valeur égale à 2000, représenté par s **
-** Le bit GID : représente droit d’endossement de l’identité du groupe. **
-** Pour un fichier exécutable .exe : si le bit GID est positionné pour un user donner.
Ce dernier hérite pendant l’exécution les droits alloués au groupe de ce fichier.
A la place de x on met s (rws) **
-**  Pour les répertoires : SGID = 2000 - les fichiers qui se trouvent dans le répertoire
appartiennent au groupe du répertoire  **

#### Sticky Bit:

-** STICKY BIT : sa valeur égale à 1000, représenté par t **
-** Le programme restera en mémoire (ram) après sa première exécution **
-** Le bit STICKY BIT : représente droit d’endossement de l’identité du groupe. **
-** Pour un fichier exécutable .exe : si le bit STICKY BIT est positionné, Le programme restera en mémoire (RAM) après sa première exécution, et il restera en mémoire jusque ce qu’on atteint le pc. **
-** Les répertoires - si le sticky bit est positionné sur un répertoire, seul le propriétaire
pourra supprimer ses fichiers **


**Remarque** : un autre bit est utilisé comme droit d'accés est `stickybit`. <br>
Pour un fichier éxecutable ce bit signifie lorsqu'il est positionné que le programme doit rester en RAM après sa premiere éxecution, on parle d'un programme résident. Ce bit est possitionné à l'aide d'un directive de compilation.

#### Resumé

Dans la fiche de renseignement de chaque fichier UNIX le champs d'information appelé droit d'accés (de type `int`) est structuré comme suit:

| code stickybit | gid  | uid  | r   | w   | x   | r   | w   | x   | r   | w   | x   |
| -------------- | ---- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1000           | 2000 | 4000 | 400 | 200 | 100 | 40  | 20  | 10  | 4   | 2   | 1   |

### Montage et démontage du système de fichier

Le montage d’un système de fichier consiste à attacher la racine de l’arbre du système de fichier à un répertoire d’un système de fichier déjà active.

Cette opération qui s’appelle le montage est réalisée par la commande `mount`. La suppression des liens entre le répertoire de montage et le système de fichier est effectué par la commande `umount`.
Les fichiers ne sont pas accessibles par les commandes usuelles (`cp`, `mv`, `cat`, ...) que s’ils sont montés. LINUX mémorise les paramètres de montage dans le fichier **/etc/mnttab**.

- Automatiser le montage du system de fichier:

  - pour automatiser le système de système de fichier, l'administrateur système doit modifier le contenu du fichier **/etc/fstab**
  - 1er type: `mount` et `umount`
  - 2eme type: `fstab` pour un montage au demarage
  - 3eme type: Montage a la volée

le démon `automount` réalise automatiquement le montage d'un système de fichier si un processus manipule des fichiers situés en dessous du répertoire de montage, il le demonte quand l'arborescence n'est plus utilisée. Pour le mettre en oeuvre il faut installer le paquetage `autofs`

## Gestion des quotas

La mise en oeuvre des quotas va permettre a l'administrateur de limiter le nombre de fichier ou le nombre de blocs d'un utilisateur ou d'un groupe sur un disque aussi limiter l'accés au resource partagées. Les quotas offrent un plus grand interet dans LINUX qui est souvent utilisé comme serveur de fichier (**Samba**) et comme serveur de messagerie (**Sendmail**, **Postfixe**, ...). Il existe deux type de limite pour les Quotas

- **Limite Hard** (Limite infranchissable): un utilisateur ou un groupe qui atteint sa limite hard de fichier ne pourra pas en créer un de plus.

- **Limite soft**: peut être franchis (en provoquant un _warning_) pendant un certain nombre de jour consecutif (par défaut 7 jours). Si au terme de ce lapse de temps, l'utilisateur n'est pas redecendut en dessous de sa limite soft le point devient a son tour infrachissable.

### Les Principales Commandes

- `edquota` : permet de fixer les quotas.
- `quotaon` : activer la vérification du quota.
- `quotaoff` : désactiver la vérification du quota.
- `quota`, `repquota`: lister les quotas.

Pour fixer les quotas pour un utilisateur sur un disque en utilise la commande `setquota`

**Exemple**: Fixer les quotas pour Ali sur le disque **/dev/sdb2** avec les spéecifications suivantes:

inode : (soft)100 - 110(hard)

bloc : (soft)10000 - 20000 (hard)

```console
[root@localhost ~]# setquota Ali 10000 20000 100 110 /dev/sdb2
```

## Sauvegarde et récupération
