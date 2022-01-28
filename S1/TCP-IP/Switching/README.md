# Technologies de Commutation

## Table of contents

- [Introduction](#introduction)
- [STP](#stp)
- [VLAN](#vlan)
- [WAN interconnexion](#wan-interconnexion)
  - [NAT & PAT]()
  - [DHCP]()
  - [PPP]()
  - [ACLs]()

## Introduction

## STP

[Link](https://www.cisco.com/c/en/us/support/docs/lan-switching/spanning-tree-protocol/5234-5.html)

Il est commun dans une entreprise d’ajouter des switchs en fonction de la taille de l’entreprise pour répondre aux besoins. Par exemple, si vous voulez préparer l’arrivée d’un nouveau venu, installer une nouvelle imprimante ou des caméras de vidéosurveillance...

Ces switchs peuvent être ajoutés à chaque étage ou chaque division. En fait, à chaque fois que cela est nécessaire. Les switchs se retrouvent bien souvent branchés les uns aux autres, ce qui est une bonne pratique. En effet, cela permet de ne pas avoir de goulot d’étranglement et cela permet la redondance des chemins. C’est justement cette redondance qui pose problème ; 3 problèmes exactement :

1. Un problème dit de tempêtes de broadcast.
2. Un problème de duplication de trame.
3. Un problème d’instabilité des tables MAC.

Ces trois problèmes peuvent se résumer en un seul : un problème de boucle.

<p align=center>
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Broadcast_storm.png/300px-Broadcast_storm.png">
</p>

### L'objectif du Spanning Tree

- L’objectif du protocole STP est d’ éviter les boucles dans le réseau tout en autorisant les chemins redondants
- STP permet de déterminer où se trouvent les boucles et bloque les liens redondants
- Cependant, ces liens sont utilisés en cas de problème, ce qui permet une résistance aux modifications de topologie et aux pannes d'équipement.

### Spanning Tree Algorithm (STA)

- Le protocole STP utilise le **Spanning Tree Algorithm** qui est mis en œuvre par les commutateurs du réseau pour créer une topologie logique sans boucle
- L’algorithme permet aux commutateurs du réseau de communiquer entre eux en échangeant des trames spécifiques appelées BPDU _Bridge Protocol Data Unit_.
- STA identifie un point de référence appelé pont racine (Root Bridge) à partir duquel l’arbre est construit
- STA détermine ensuite les chemins disponibles à cette racine. Si plusieurs chemins existent STA choisit le meilleur et bloque les autres en désactivant certains ports
- Chaque pont (non racine) détermine le port racine, celui qui a le moindre coût vers la racine
- Une fois les ports racines identifiés, on détermine sur chaque segment le port désigné, celui qui a le moindre coût vers la racine sur ce segment
- Enfin, tous les ports qui ne sont ni racine ni désignés seront des ports bloqués

<p align=center>
  <img src="https://documentation.meraki.com/@api/deki/files/2415/RSTP1.png?revision=1&size=bestfit&width=540&height=339">
</p>

### Concepts du STP

Deux concepts clés sont largement utilisés lors des calculs effectués par
l’algorithme STA pour la création de la topologie sans boucle :

- **Bridge ID (BID)** qui permet d’identifier les switchs, est utilisé lors du processus d’élection pour déterminer le pont racine
- **Path Cost** utilisé pour déterminer les meilleurs chemins en terme de coût. Le coût est basé sur le débit des liens

Le Bridge ID est composé d’un champ Priorité du pont sur 2 octets et de l’@MAC du pont. Ainsi, le BID est unique

<p align=center>
      <img src="https://www.networkbulls.com/ask/public/uploads/images/16cf4dc70af6a383592338f3f22d6d0e.png" alt="BID" width=400>
</p>

Le switch qui présente la priorité la plus faible est le pont racine. En cas d’égalité, l’adresse MAC la plus faible permet de départager les switchs

Le coût du chemin est utilisé pour identifier le chemin " le moins cher " ou "le plus rapide" vers le pont racine.

Le coût du chemin (ou coût du port) est basé sur le débit du Média

### BPDU (Bridge Protocol Data Unit)

- Tous les switchs (Pont) vont s’échanger des messages appelés trames BPDU, qui permettent la configuration de la topologie STP
- Format d ’une trame BPDU 802.1d (les nombres indiquent le nombre d’octets des champs)

<p align=center>
      <img src="https://www.tech-faq.com/wp-content/uploads/root-bridge.gif" alt="BPDU" width=400>
</p>

- Ces trames sont encapsulées dans des trames Ethernet 802.3 et envoyées en multicast vers toutes les interfaces

- Les principales informations données par cette trame sont :
  - L’identificateur supposé du pont racine par le pont émetteur du message (Root ID)
  - Coût de la liaison entre le pont émetteur et la racine supposée (Root path cost)
  - Identificateur du pont émetteur (Bridge ID)
  - Numéro du port sur lequel le message est émis (Port ID)

### Le " spanning tree " en trois étapes

- **Étape 1**: Désignation d'un COM racine
  - Priorité du commutateur
  - @MAC du commutateur
- **Étape 2** : Désignation des ports racine
  - Coût de la route
  - Coût du chemin racine
- **Étape 3** : Choix des ports bloqués
  - Coût du port par segment

[Annexe](./Annexe/Annexe1-Exemples-STP.pdf)

## VLAN

- Un VLAN est un réseau local virtuel
- L’emplacement géographique des éléments du VLAN peut être quelconque, ce qui implique d’émuler un réseau local, même si l’ensemble des clients est réparti géographiquement sur plusieurs commutateurs
- Un VLAN est doté de mécanismes assurant la diffusion sélective des informations (Le standard 802.1q)

### Notions de base

- VLAN par défaut toujours présent (VLAN1)
- Technologie en standard sur les switchs actuels
- Configuration au niveau de l’équipement

### Differences entre LAN commuté et VLANs

- Les VLANs permettent de controler les broadcast
- Le dialogue inter-VLAN est assurée par les routeurs
- Les VLANs augmentent la securité
- Les VLANS regroupent les utilisateurs de manière logique (workgroup)

<p align=center>
      <img src="https://cyberhoot.com/wp-content/uploads/2020/01/Image12005.gif" alt="BPDU" width=400>
</p>

### Types de VLAN

- VLAN : Par numéro de port
  - Les VLAN basés sur les ports regroupent les réseaux locaux virtuels par port. Dans ce type de réseau local virtuel, un port de commutateur peut être configuré manuellement comme membre d'un VLAN.
  - Les appareils qui sont connectés à ce port appartiendront au même domaine de diffusion, car tous les autres ports sont configurés avec un numéro de VLAN similaire.
- VLAN : Par adresse MAC
  - Le VLAN basé sur l'adresse MAC permet d'attribuer aux paquets entrants un réseau local virtuel et, ainsi, de classer le trafic en fonction de l'adresse source du paquet. Vous définissez un mappage d'adresse Mac vers VLAN en configurant le mappage de l'entrée dans MAC vers la table VLAN.
- VLAN : Par sous-réseaux IP
  - Permet la même souplesse que la solution à base de MAC
- Vlan : par protocol
  - Du fait de l’hégémonie du protocole IP, cette solution tend à disparaître.

### Communication inter-VLAN

- comment propager l’appartenance à un VLAN d’un commutateur vers un autre ?
- Problématique : lorsqu’une trame circule d’un commutateur à un autre, comment identifier son appartenance à un vlan?

<p align=center>
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRutOYlbMaZqTq2KyQrgrFeFCtTfqtJMzd7oc203t6uDY_W167MdmUoP0Dk5bXDT6RStfQ&usqp=CAU" alt="BPDU" width=400>
</p>

- Solution :
  - Filtrage de trames (vieille technologie)
  - ‘Frame tagging’ (nouvelle méthode)

### Identification de trames (Frame tagging : 802.1 Q ) (nouvelle méthode)

- Place un identificateur unique dans l’en-tête de trame
- L’identificateur est retiré par le commutateur lorsqu’il arrive au segment final (horizontal)
- Utilise moins de ressources que le filtrage

<p align=center>
      <img src="https://forum.huawei.com/enterprise/en/data/attachment/forum/202106/06/233745kr0917tra0xwcrcr.png?02.PNG" alt="Frame tagging" width=600>
</p>

- Type : « 0x8100 » pour le protocole 802.1Q
- 802.1Q :
  - Priority (3 bits)
  - CFI (1 bit) : utilisé seulement dans le cas de token ring
  - VID (12 bits) : VLAN ID

# WAN interconnexion

## NAT & PAT

## DHCP

## PPP

## ACLs
