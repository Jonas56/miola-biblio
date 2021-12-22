# Routage

## Table of content

- [Introduction](#introduction)
  - [Qu’est ce qu’un routeur?]()
  - [Routage définition?]()
  - [Table de routage]()
- [Routage Statique]()
- [Routage Dynamique]()

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

**[Voir solution TP1]()**

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

[comment]: <> (TODO: A completer => https://www.ciscopress.com/articles/article.asp?p=2180210&seqNum=7)

## Routage dynamique à vecteur de distance

### Fonctionnement

- Les routeurs qui utilisent le protocole à vecteur de distance déterminent la distance entre eux et une destination
  - La **distance** est définie en termes de mesure, comme le nombre de sauts, et la **direction** est simplement le routeur de tronçon suivant ou l’interface de sortie
  - Le chemin le plus optimal entre deux nœuds est celui avec une distance (nombre de sauts) minimale.
- Pour établir le meilleur chemin, les routeurs échangent régulièrement des informations avec les routeurs voisins, plus précisement leur table de routage
- Les routeurs qui implémentent le protocole à vecteur de distance s'appuient uniquement sur les informations qui leur sont fournies par les routeurs voisins et n'évaluent pas la topologie du réseau.
- Le protocole de routage à vecteur de distance utilise le principe de base de [l'algorithme de Bellman-Ford](https://en.wikipedia.org/wiki/Bellman%E2%80%93Ford_algorithm) pour identifier le chemin le plus court à travers le réseau.

[comment]: <> (TODO: Example with image)

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
Router(conf)# router rip
Router(conf)# version
```

### Application

[Voir correction TP2](./TP/TP2)

## Routage dynamique à états de liens

### Fonctionnement

### OSPF
