# TCP/IP

# Routage

## Table of content

- [Introduction](#introduction)
  - [Qu’est ce qu’un routeur?]()
  - [Routage définition?]()
  - [Table de routage]()
- [Routage Statique]()
- [Routage Dynamique]()
- [ICMP]()
- [TCP et UPD]()
- [DNS]()

## Prerequis

- [Modèle OSI]()
- [Adressage]()
- [VLSM]()

## Introduction

### Qu’est ce qu’un routeur?

Un routeur est un dispositif qui fonctionne à la couche 3 du modèle OSI. La couche 3 est la couche réseau, elle est responsable de l'échange d'informations entre des réseaux distincts. Et c'est exactement le rôle d'un routeur: connecter deux ou plusieurs réseaux afin que les paquets puissent circuler librement entre eux.

### Routage définition

Processus par lequel un élément (courier, appels télephonique, trains, paquets IP...) va être acheminer d'un endroit a un autre.

- Un élement faisant du routage doit connaitre:
  - La destination,
  - De quelle source il peut apprendre les chemins d'accès à la destination voulue,
  - Le(s) meilleur(s) iténairarires pour atteindre la destination,
  - Un moyen d'actualiser les iténairaires

On distingue deux types de routage:

- Routage statique
- Routage dynamique

### Table de routage

- Une table de routage est un ensemble de règles, représentées sous forme de tableau, qui permet de déterminer où seront acheminés les paquets de données circulant sur un réseau IP. La table indique alors au dispositif comment acheminer le paquet vers le prochain saut du parcours sur le réseau.

- Si aucune entrée dans la table de routage ne valide l’adresse de
  destination d’un paquet => paquet rejeté.
- Commande pour afficher une table de routage dans **packet tracer**

```
R1# show ip route
```

<p align="center">
  <img src="https://www.researchgate.net/profile/Petac-Eugen-2/publication/287208615/figure/fig4/AS:307928004349955@1450427165297/Routing-table-of-R3.png" alt="Routing table" width=500>
</p>

## Routage statique

- Le routage statique est une forme de routage qui se produit lorsqu'un routeur utilise une entrée de routage configurée manuellement.
- Les routes statiques sont communément utilisées lors du routage
  d’un réseau vers un réseau d’extrémité. Un réseau d’extrémité
  est un réseau accessible par une seule route.

### Exemple

Soit la topologie suivante:

[comment]: <> (TODO: include an photo of a network)
![]()

Lors du demarage le routeur X possede dans sa table de routage que les réseaux directement connéctées. Pour acheminer un paquet vers un réseaux distant il suffit d'ajouter une route statique vers ce réseaux.

### Configuration d’une route statique

- Commande `ip route`

```
Router(config)# ip route network-address subnet-mask {ip-address | exit-interface}
```

### Application

- [TP1 Routage Statique](./TP/TP1)

### Avantages du routage statique

- Facile à mettre en œuvre,
- C'est le mode de routage le plus sûr,
- La bande passante n'est pas utilisée pour envoyer les mises à jour de routage,
- Traitement processeur minimal.

### Incovenients du routage statique

- Il ne peut pas être mis à jour dynamiquement si la topologie change
- La complexité de la configuration augmente considérablement lorsque le réseau augmente. La gestion des configurations statiques dans les grands réseaux peut prendre beaucoup de temps.
- Exige une connaissance complète de l’ensemble du réseau pour une implémentation correcte
- ...

## Routage dynamique

le routage dynamique est une technique dans laquelle un routeur apprend aux informations de routage sans l'aide d'un administrateur et ajoute le meilleur itinéraire à sa table de routage. Un routeur exécutant un protocole de routage dynamique ajoute le meilleur itinéraire vers sa table de routage et peut également déterminer une autre voie si la voie principale n'est plus disponible.

### Protocole de routage dynamique

Un protocole de routage est un ensemble de processus, d’algorithmes et de messages qui sont utilisés pour échanger des informations de routage et construire la table de routage en y indiquant les meilleurs chemins choisis par le protocole.

Un protocole de routage permet d’effectuer les opérations suivantes :

- découverte des réseaux distants : 30;
- actualisation des informations de routage;
- choix du meilleur chemin vers des réseaux de destination;
- capacité à trouver un nouveau meilleur chemin si le chemin actuel n’est plus disponible.

#### Composants du protocole de routage

- **Structures des données**– sont des tables et/ou des bases de données qui sont conservées dans la mémoire vive.
- **Algorithme** - Un algorithme est une liste précise d’étapes permettant d’accomplir une tâche.
- **Messages de protocoles de routage** – permettent de découvrir les routeurs voisins, échanger des informations de routage et effectuer d’autres tâches afin de découvrir et de gérer des informations précises sur le réseau.

#### Metrique d'une route

- Le protocole de routage prend la décision du choix du meilleur chemin lors de la transmission des paquets vers une destination
- Une métrique est calculée par des algorithmes de routage lors de la détermination du chemin optimal pour l'envoi d'un paquet. Les métriques sont attribuées à chaque route différente disponible dans la table de routage et sont calculées à l'aide de nombreuses techniques et méthodes différentes basées sur les algorithmes de routage utilisés. Voici quelques paramètres utilisés pour calculer une métrique de routage:
  - Nombre de sauts (hop count)
  - Fiabilité du chemin
  - Bande passante (Bandwidth)
  - Charge (Load)
  - Durée (Delay)
  - Maximum transmission unit (MTU)

#### Distance administrative

La distance administrative (AD) est une valeur que les routeurs utilisent afin de sélectionner le meilleur chemin lorsqu'il existe au moins deux routes différentes vers la même destination à partir de deux protocoles de routage différents. La distance administrative compte la fiabilité d'un protocole de routage. La distance administrative (AD) est une valeur numérique qui peut aller de 0 à 255. Une distance administrative (AD) plus petite est plus fiable par un routeur, donc la meilleure distance administrative (AD) étant 0 et la pire, 255.

<p align=center>

|    Type de route     | Distance administrative |
| :------------------: | :---------------------: |
| Directement connecté |            0            |
|    Route statique    |         0 ou 1          |
|        EIGRP         |           90            |
|         IGRP         |           100           |
|         OSPF         |           110           |
|        IS-IS         |           115           |
|         RIP          |           120           |

</p>

<p align="center">
  <img src="https://603168-1953132-raikfcquaxqncofqfm.stackpathdns.com/wp-content/images/show_ip_route_ad.jpg" alt="famille de protocole">
</p>

#### Classification des protocoles de routage

<p align="center">
  <img src="https://www.ciscopress.com/content/images/chap3_9781587133237/elementLinks/03fig09.jpg" alt="famille de protocole">
</p>

Les protocoles de routage peuvent être classés dans différents groupes selon leurs caractéristiques. Plus précisément, les protocoles de routage peuvent être classés en fonction de leur :

- **Objectif** - Protocole IGP (Interior Gateway Protocol) ou protocole EGP (Exterior Gateway Protocol)
- **Fonctionnement** - Vecteur de distance, protocole d'état de liens ou protocole de vecteur de chemin
- **Comportement** - Par classe (ancien) ou protocole sans classe

Par exemple, les protocoles de routage IPv4 sont classés comme suit :

- RIPv1 (ancien) - IGP, vecteur de distance, protocole par classe
- IGRP (ancien) - IGP, vecteur de distance, le protocole par classe développé par Cisco (abandonné depuis l'IOS 12.2 et versions ultérieures)
- RIPv2 - IGP, vecteur de distance, protocole sans classe
- EIGRP - IGP, vecteur de distance, protocole sans classe développé par Cisco
- OSPF - IGP, état de liens, protocole sans classe
- IS-IS - IGP, état de liens, protocole sans classe
- BGP - EGP, vecteur de distance, protocole sans classe

Les protocoles de routage par classe, RIPv1 et IGRP, sont des protocoles anciens et sont uniquement utilisés dans les réseaux plus anciens. Ces protocoles de routage ont évolué pour devenir respectivement les protocoles de routage sans classe RIPv2 et EIGRP. Les protocoles de routage à état de liens sont sans classe par nature.

## Routage dynamique à vecteur de distance

### Fonctionnement

- Les routeurs qui utilisent le protocole à vecteur de distance déterminent la distance entre eux et une destination
  - La **distance** est définie en termes de mesure, comme le nombre de sauts, et la **direction** est simplement le routeur de tronçon suivant ou l’interface de sortie
  - Le chemin le plus optimal entre deux nœuds est celui avec une distance (nombre de sauts) minimale.
- Pour établir le meilleur chemin, les routeurs échangent régulièrement des informations avec les routeurs voisins, plus précisement leur table de routage
- Les routeurs qui implémentent le protocole à vecteur de distance s'appuient uniquement sur les informations qui leur sont fournies par les routeurs voisins et n'évaluent pas la topologie du réseau.
- Le protocole de routage à vecteur de distance utilise le principe de base de [l'algorithme de Bellman-Ford](https://en.wikipedia.org/wiki/Bellman%E2%80%93Ford_algorithm) pour identifier le chemin le plus court à travers le réseau.

### Etat de convergence

- Quand les routeurs d’un réseau ont la même information, on dit que le réseau est dans un état de convergence

- Le temps de convergence est le temps nécessaire pour que tous les routeurs du réseau développent et stockent dans leurs tables de routage la même image du réseau

### Avantages

- Le protocole de routage à vecteur de distance est facile à mettre en œuvre dans les petits réseaux.
- Le débogage est très simple dans le protocole de routage à vecteur de distance.

### Desavantages

- Si un lien est tombé en panne entre les routeurs, il doit être immédiatement mis à jour vers tous les autres routeurs du réseau. Le routage du vecteur de distance prend un temps considérable pour la mise à jour. Ce problème est également connu sous le nom [count-to-infinity problem](https://www.interviewbit.com/blog/count-to-infinity-problem/).
- Dans un réseau grand et complexe, le temps de convergence est excessif.
- Consomation de la bande passante

### Protocole de routage RIP

RIP est un protocole de vecteur de distance standardisé, conçu pour être utilisé sur des réseaux petits. RIP a été l'un des premiers vrais protocoles de routage à vecteur de distance.

Le protocole RIP présente les principales caractéristiques suivantes

- La seule mesure qu’il utilise pour le choix du chemin d’accès est le nombre de sauts.
- Les routes annoncées dont le nombre de sauts est supérieur à 15 sont inaccessibles.
- Les messages sont diffusés toutes les 30 secondes.
- La distance administrative de RIP est 120.
- RIP utilise l'algorithme de vecteur de distance Bellman-Ford pour déterminer le meilleur « chemin » vers une destination particulière

### Format des messages du protooles RIP

<p align=center>
  <img src="https://techhub.hpe.com/eginfolib/networking/docs/switches/5500hi/5998-5330_l3-ip-rtng_cg/content/images/image8.png" width="auto">
</p>

### RIPv1

#### Commandes pour configurer RIPv1

```
Router> enable
Router# configure terminal
Router(config)# router rip  #activer le protocole RIP
Router(config-router)# network network_id #Annonce le réseau dans les majs de routage RIP
```

- Autres commandes

```
Router# show ip route
Router# show ip protocols
Router# debug ip rip #identifier les problèmes qui affectent les mises à jour RIP
Router(config-router)# passive-interface interface-type interface-number
Router(config-router)#default-information originate #Propagation de la route par défaut dans RIPv1
```

#### Resumé automatique des routes

- RIP est un protocole de routage par classe qui résume automatiquement les réseaux aux frontières de classe des réseaux principaux

#### Règles de traitement des mises à jour RIPv1

1. si une mise à jour de routage et l’interface sur laquelle elle est reçue appartiennent au même réseau principal, le masque de sous-réseau de l’interface est appliqué au réseau dans la mise à jour de routage
2. si une mise à jour de routage et l’interface sur laquelle elle est reçue appartiennent à deux réseaux principaux différents, le masque de sousréseau par classe est appliqué à ce réseau dans la mise à jour de routage

#### Remarques

- Les topologies discontinues ne convergent pas avec RIPv1
- Les topologies en VLSM ne convergent pas avec RIPv1

### RIPv2

- RIPv2 est un protocole de routage classless, ce qui nous permet également d’utiliser des sous-réseau. RIPv2 a la possibilité d’envoyer un masque de réseau dans la mise à jour pour permettre le routage classless
- RIPv2 prend en charge VLSM (Masquage de sous-réseau de longueur variable).

[comment]: <> "TODO: Suite RIPv2"

#### Configuration

```
Router(config)# router rip
Router(config-router)# version 2
Router(config-router)# network network_id network_mask #Annonce le réseau dans les majs de routage RIPv2
```

### Application

- [TP2 Routage RIP](./TP/TP2)

## Routage dynamique à états de liens

- Un protocole de routage complexe qui partage des informations avec d'autres routeurs afin de déterminer le meilleur chemin
- Les protocoles d'état des liens utilisent des caractéristiques du chemin telles que la vitesse et le coût ainsi que la congestion actuelle pour déterminer le meilleur chemin, qui est calculé par l'[algorithme de Dijkstra](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm).
- Les routeurs à état de lien sont mis à jour à partir de tous les routeurs de l'ensemble du réseau en transmettant les informations du routeur au routeur le plus proche
- Rather than continuously broadcast its routing tables as does a distance vector protocol, a link state protocol router only notifies its neighboring routers when it detects a change

### Fonctionnement

1. Chaque routeur prend connaissance de ses propres réseaux directement connectés.
2. Chaque routeur est responsable de l’établissement de la communication (par l’envoie des paquets HELLO) avec ses voisins situés sur les réseaux qui lui sont directement connectés.
3. Chaque routeur crée un paquet LSP (Link-State Packet) contenant l’état de chaque liaison directement connectée.
4. Chaque routeur diffuse son LSP à l’ensemble de ses voisins, qui stockent tous les LSP qu’ils reçoivent dans une base de données.
5. Les voisins diffusent ensuite le LSP à leurs voisins, jusqu’à ce que tous les routeurs de la zone aient reçu le LSP. Chaque routeur stocke une copie de chaque LSP reçu de ses voisins dans une base de données locale
6. Chaque routeur utilise sa base de données pour élaborer une carte complète de la topologie et calcule le meilleur chemin vers chaque réseau de destination.

### Avantages du routage à état des liens

- Élaboration d’une carte topologique
- Convergence rapide
- Mises à jour pilotées par événement
- Conception hiérarchique

Aujourd’hui, deux protocoles de routage à état de liens sont utilisés pour le routage du trafic IP :

- protocole OSPF
- protocole de routage IS-IS

### Le protocole OSPF

- OSPF est un protocole pour le routage des paquets IP au sein d'un système autonome.
- Il rassemble des informations sur l'état des liens à partir des routeurs disponibles et construit une carte topologique du réseau. La topologie est présentée comme une table de routage vers la couche Internet qui achemine les paquets en fonction uniquement de leur adresse IP de destination.
- OSPF détecte les changements dans la topologie, tels que les défaillances de liaison, et converge vers une nouvelle structure de routage sans boucle en quelques secondes. Il calcule l'arbre du chemin le plus court pour chaque route en utilisant une méthode basée sur l'[algorithme de Dijkstra](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm).

#### Notion de zones

- Un système autonome géré par le protocole OSPF est divisé en plusieurs zones de routage qui contiennent des routeurs et des hôtes.
- Cette division du système autonome en plusieurs zones introduit ce que l’on appelle le routage hiérarchique
- Chaque zone possède sa propre topologie et ne connaît pas les topologies des autres zones du système autonome
- La zone appelée « zone backbone » (ou réseau fédérateur) est une zone particulière. Elle est constituée de plusieurs routeurs interconnectés et doit être le centre de toutes les zones. Autreme

<p align=center>
  <img src="https://www.cisco.com/c/dam/en/us/support/docs/ip/open-shortest-path-first-ospf/13703-8-02.gif" width="auto">
</p>

#### Les types de paquets OSPF

|            Type de paquet OSPF             |                              Description                               |
| :----------------------------------------: | :--------------------------------------------------------------------: |
|               Type 1 - HELLO               | Etablit et maintient la contiguité avec d’autres routeurs OSPF voisins |
| Type 2 - Database description packet (DBD) |         Vérifie la synchronisation de la BD entre les routeurs         |
|     Type 3 - Link State Request (LSR)      |          Fait (demande) des requêtes sur les bases de données          |
|      Type 4 - Link State Update (LSU)      |   Envoie les enregistrements d’état de lien spécifiquement demandés    |
| Type 5 – Link Sate Acknowledgement (LSACK) |              Accuse réception des autres types de paquets              |

#### Les étapes des opérations OSPF

- Établir la liste des routeurs voisins.
- Élire le routeur désigné et le routeur désigné de secours
- Découvrir les routes.
- Élire les routes à utiliser.
- Maintenir la base de donnée topologique.

<p align=center> 
  <b>
    Toute modification de la topologie déclenche une nouvelle exécution de l'algorithme du SPF et une nouvelle table de routage est constituée. 
  </b>
</p>

#### Configuration de l’OSPF sur un routeur CISCO

Les principales commandes utilisés pour la configuration de l'OSPF:

- `router ospf <process_id>`: active le processus OSPF. Le _process-id_ n’a qu’une signification locale, ce qui veut dire qu’il n’a pas à correspondre à celui des autres routeurs OSPF pour établir des contiguïtés avec des voisins.
- `network <réseau ou adresse_ip> <masque générique> area <zone_id>`: assigne l’interface à une zone OSPF.
- `ip ospf cost` : permet de modifier les coûts d’état de lien
- `show ip ospf neighbor `: indique les routeurs voisins au routeur sur lequel est exécuté la commande
- `show ip route` : donne la table de routage d’un routeur
- `ping` et `traceroute` : permet de vérifier la connectivité entre les ordinateurs hôtes de sorte que tous les chemins de routage soient vérifiés

#### Exemple

```cisco
Router(conf)# router ospf 1
Router(conf-router)# network 172.16.1.16 0.0.0.15 area 0
```

#### Détermination de l’ID du routeur

L’ID de routeur OSPF permet d’identifier chaque routeur de façon unique dans le domaine de routage OSPF. Un ID de routeur est tout simplement une adresse IP. Les routeurs Cisco définissent leur ID de routeur en utilisant trois critères, selon la priorité ci-dessous :

1. Utilisation de l’adresse IP configurée avec la commande `router-id` du protocole OSPF.
2. Si router-id n’est pas configuré, le routeur choisit l’adresse IP la plus élevée parmi ses interfaces de bouclage IP (loopback).
3. Si aucune interface de bouclage n’est configurée, le routeur choisit l’adresse IP active la plus élevée parmi ses interfaces physiques qui sont activées (_L’interface n’est pas nécessairement configurée pour OSPF, ce qui signifie qu’elle n’est pas nécessairement incluse à l’une des commandes network_)

#### Sélection du DR/BDR

Comment le routeur désigné et le routeur désigné de sauvegarde sont-ils sélectionnés ?
Les critères suivants sont appliqués :

1. DR : Il s’agit du routeur dont la priorité d’interface OSPF est la plus élevée.
2. BDR : Il s’agit du routeur dont la priorité d’interface OSPF est la seconde valeur la plus élevée.
3. Si les priorités d’interface OSPF sont identiques, l’ID de routeur le plus élevé est utilisé.

#### Redistribution du routage OSPF par défaut

- Comme RIP, OSPF nécessite la commande default-information originate pour annoncer la route statique par défaut 0.0.0.0/0 aux autres routeurs de la zone. Si la commande default-information originate n’est pas utilisée, la route par défaut « quatre zéros » ne sera pas diffusée aux autres routeurs de la zone OSPF.

```cisco
Router(config-router)# default-information originate
```

#### Application

- [TP3 Routage OSPF](./TP/TP3)

## Résumé

De nombreux indicateurs en matière de structure et de performances sont utilisés pour étudier les réseaux : topologie, vitesse, coût, sécurité, disponibilité, évolutivité et fiabilité.

Les routeurs Cisco et les commutateurs Cisco ont beaucoup de points communs. Ils prennent en charge le même système d'exploitation de modes, les mêmes structures de commandes et comptent de nombreuses commandes similaires. Une fonction de distinction entre les commutateurs et les routeurs est le type d'interface pris en charge par chacun. Lorsqu'une interface est configurée sur les deux périphériques, les commandes `show` appropriées doivent être utilisées pour vérifier le bon fonctionnement de l'interface.

Le rôle principal d'un routeur est de relier plusieurs réseaux et de transférer des paquets d'un réseau à l'autre. Cela signifie qu'un routeur comporte généralement plusieurs interfaces. Chaque interface est membre d'un réseau IP différent ou en est un hôte.

Les réseaux distants sont ajoutés à la table de routage de deux manières : soit par la configuration manuelle de routes statiques par l'administrateur réseau, soit par l'implémentation d'un protocole de routage dynamique. Les routes statiques n'ont pas autant de surcharge que les protocoles de routage dynamique ; elles peuvent toutefois nécessiter plus de maintenance si la topologie change constamment ou si celle-ci est instable.

Les protocoles de routage dynamique s'adaptent automatiquement aux modifications, sans qu'aucune intervention de l'administrateur réseau ne soit nécessaire. Les protocoles de routage dynamique requièrent un traitement accru par le processeur et ils utilisent un certain nombre de liens pour les mises à jour et les messages de routage. Souvent, une table de routage contient à la fois des routes statiques et des routes dynamiques.

Les routeurs prennent leur décision principale de transfert au niveau de la couche 3, c'est-à-dire la couche réseau. Toutefois, les interfaces du routeur participent aux couches 1, 2 et 3. Les paquets IP de couche 3 sont encapsulés dans une trame liaison de données de couche 2 et codés en bits au niveau de la couche 1. Les interfaces du routeur participent aux processus de couche 2 associés à leur encapsulation. Par exemple, l'interface Ethernet d'un routeur participe au processus ARP comme d'autres hôtes se trouvant sur ce réseau local.

## ICMP

[ICMP petit résumer](https://study-ccna.com/icmp-internet-control-message-protocol/)

## TCP - UDP

TCP et UDP sont les deux protocoles principaux de la couche transport. Les deux supportent la transmission de données de deux manières différentes, TCP est en mode orienté connexion et UDP est en mode non-connexion.

### Transmission Control Protocol (TCP)

- L'un des principaux protocoles du TCP/IP est le protocole TCP (Transmission Control Protocol). Ce protocole fournit une livraison fiable et ordonnée des données entre les applications s'exécutant sur des hôtes sur un réseau TCP/IP. En raison de sa nature fiable, TCP est utilisé par des applications nécessitant une fiabilité élevée, telles que FTP, SSH, SMTP, HTTP, etc.
- TCP est orienté connexion, ce qui signifie qu'avant l'envoi de données, une connexion entre deux hôtes doit être établie. Le processus utilisé pour établir une connexion TCP est connu sous le nom d'établissement de **liaison à trois voies**. Une fois la connexion établie, la phase de transfert de données commence. Une fois les données transmises, la connexion est interrompue.

#### Format du paquet TCP

- Lors de l'envoi de paquets via TCP/IP, la partie données de chaque paquet IP est formatée en tant que segment TCP.

<p align=center style="background:white;">
  <img src="https://cdn.kastatic.org/ka-perseus-images/e5fdf560fdb40a1c0b3c3ce96f570e5f00fff161.svg" width="700">
</p>

- **source port** – the port number of the application on the host sending the data
- **destination port** – the port number of the application on the host receiving the data
- **sequence number** – used to identify each byte of data
- **acknowledgment number** – the next sequence number that the receiver is expecting
- **header length** – the size of the TCP header
- **reserved** – always set to 0
- **flags** – used to set up and terminate a session
- **window** – the window size the sender is willing to accept
- **checksum** – used for error-checking of the header and data
- **urgent** – indicates the offset from the current sequence number, where the segment of non-urgent data begins
- **options** – various TCP options, such as Maximum Segment Size (MSS) or Window Scaling

#### le processus de transmission d'un paquet avec TCP/IP

- **Etape 1** : Etablir une connexion
  - Lorsque deux machines souhaitent s'envoyer des données via TCP, ils doivent d'abord établir une connexion à l'aide d'une méthode qui s'appelle **three-way handshake**.
  - Le premier hôte envoie un paquet avec le bit SYN mis à 111. Le deuxième renvoie un paquet avec le bit ACK défini sur 111 plus le bit SYN défini sur 111. Le premier hôte répond avec un ACK.

<p align=center>
  <img src="https://s3.ap-south-1.amazonaws.com/afteracademy-server-uploads/what-is-a-tcp-3-way-handshake-process-three-way-handshaking-establishing-connection-6a724e77ba96e241.jpg" width="400">
</p>

- **Etape 2** : Envoi des données
  - Lorsqu'un paquet de données est envoyé via TCP, le destinataire doit toujours accuser réception de ce qu'il a reçu.
  - La première machine envoie un paquet avec des données et un numéro de séquence. La deuxième renvoie un accuse réception en définissant le bit ACK et en incrementant le numéro d'accusé de réception de la longueur des données reçues.

<p align=center style="background: white;">
  <img src="https://www.researchgate.net/profile/Adel-Elmaghraby/publication/228909311/figure/fig2/AS:393679769489424@1470871979918/TCP-Data-Transfer-where-Window-Size-is-Reached-Factor-1-Call-Setup-Analysis-for-the.png" width="700">
</p>

- **Etape 3** : Fermeture de la session
  - Chaque ordinateur peut fermer la connexion lorsqu'il ne souhaite plus envoyer ou recevoir de données.
  - Une machine initie la fermeture de la connexion en envoyant un paquet avec le bit FIN défini sur 1. L'autre machine répond avec un ACK et un autre FIN. Après un autre ACK de l'ordinateur initiateur, la connexion est fermée.

<p align=center>
  <img src="https://www.gatevidyalay.com/wp-content/uploads/2018/09/TCP-Connection-Termination-Step-05.png" width="auto" height="500">
</p>

#### Detection des paquets perdus

- Les connexions TCP peuvent détecter les paquets perdus à l'aide d'un délai d'attente.
- Après avoir envoyé un paquet, l'expéditeur démarre un temporisateur et place le paquet dans une file d'attente de retransmission. Si le temporisateur expire et que l'expéditeur n'a pas encore reçu d'ACK du destinataire, il envoie à nouveau le paquet.
- La retransmission peut conduire le destinataire à recevoir des paquets en double, si un paquet n'a pas été réellement perdu mais juste très lent à arriver ou à être reconnu. Si tel est le cas, le destinataire peut simplement supprimer les paquets en double.

#### Traitement des paquets en désordre

- Les connexions TCP peuvent détecter les paquets dans le désordre en utilisant les numéros de séquence et d'accusé de réception
- Grâce aux numéros de séquence et d'acquittement, les systèmes terminaux peuvent remettre les données reçues dans l'ordre à l'application destinataire.

<p align=center style="background: white;">
  <img src="https://cdn.kastatic.org/ka-perseus-images/bdeaf7f92aa9f48d5d103888a63a34704b755104.svg" height="300" width="700">
</p>

### User Datagram Protocol (UDP)

- Le rôle de ce protocole est de permettre la transmission de données (sous forme de datagrammes) de manière très simple entre deux entités, chacune étant définie par une adresse IP et un numéro de port.
- Aucune communication préalable n'est requise pour établir la connexion, au contraire de TCP (qui utilise le procédé de handshaking). UDP utilise un mode de transmission sans connexion.

#### Les avantages et les inconvénients de l'UDP

UDP présente un certain nombre d'avantages pour différents types d'applications, notamment:

- Aucun retard de retransmission
- Vitesse
- Très utile pour les messages diffusions

En revanche, le manque d'exigences de connexion et de vérification des données d'UDP peut créer un certain nombre de problèmes lors de la transmission de paquets. Ceux-ci inclus:

- Aucune garantie d'ordre des paquets.
- Aucune vérification de l'état du message envoyé (reçu ou perdue).
- Aucune protection contre les paquets en double.
- ...

#### Format du message UDP

<p align=center >
  <img src="https://www.imperva.com/learn/wp-content/uploads/sites/13/2019/01/UDP-packet-1024x375.jpg" height="300" width="700">
</p>

- **Source port** : Le port de la machine qui envoie les données. Ce champ peut être mis à zéro si la machine de destination n'a pas besoin de répondre à l'expéditeur.
- **Destination port** : Le port destination. Les numéros de port UDP peuvent être compris entre 0 et 65 535
- **Length** : Spécifie le nombre d'octets comprenant l'en-tête UDP. La limite du champ de longueur UDP est déterminée par le protocole IP sous-jacent utilisé pour transmettre les données.
- **Checksum** : La somme de contrôle permet au périphérique récepteur de vérifier l'intégrité de l'en-tête du paquet et de la charge utile (payload). Il est facultatif dans IPv4 mais a été rendu obligatoire dans IPv6.
