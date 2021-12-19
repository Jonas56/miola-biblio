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

![Routing table](https://www.researchgate.net/profile/Petac-Eugen-2/publication/287208615/figure/fig4/AS:307928004349955@1450427165297/Routing-table-of-R3.png)

## Routage statique

- Le routage statique est une forme de routage qui se produit lorsqu'un routeur utilise une entrée de routage configurée manuellement.
- Les routes statiques sont communément utilisées lors du routage
  d’un réseau vers un réseau d’extrémité. Un réseau d’extrémité
  est un réseau accessible par une seule route.

### Exemple

Soit la topologie suivante:

[comment]: <> (TODO: include an photo of a network)
![]()

Lors du demarage le routeur possede dans sa table de routage que les réseaux directement connécter.
Pour acheminer un paquet vers un réseaux distant il suffit d'ajouter une route statique vers ce réseaux.

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

Un protocole de routage est un ensemble de processus, d’algorithmes et de
messages qui sont utilisés pour échanger des informations de routage et
construire la table de routage en y indiquant les meilleurs chemins choisis
par le protocole.

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

[comment]: <> (TODO: Definition d'une métrique et une photo)

#### Distance administrative

[comment]: <> (TODO: Definition d'une distance administartive et une photo)

#### Classification des protocoles de routage

![](https://www.ciscopress.com/content/images/chap3_9781587133237/elementLinks/03fig09.jpg)

[comment]: <> (TODO: A completer)

## Routage dynamique à vecteur de distance

### Fonctionnement

### RIPv1

### RIPv2

## Routage dynamique à états de liens

### Fonctionnement

### OSPF
