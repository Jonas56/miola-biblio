# Transmission des données

## Table of contents

- [Systèmes de transmission de données](#systèmes-de-transmission-de-données)
- [Les supports de transmission](#les-supports-de-transmission)
- [Techniques de transmission de données](#techniques-de-transmission-de-données)
- [Techniques de multiplexage]()
- [Codes pour Détection /Correction d'erreurs](#détection-correction-derreurs)

## Systèmes de transmission de données

### Introduction

La transmission des données est le transfert et la réception de données sous la forme d'un flux binaire numérique ou d'un signal analogique numérisé sur un canal de communication **P2P** (point to point) ou **point à multipoint**. Les _fils de cuivre_, les _fibres optiques_, les communications sans fil utilisant le _spectre radioélectrique_, les _supports de stockage_ et les _bus informatiques_ sont des exemples de tels canaux. Les données sont représentées sous la forme d'un signal électromagnétique, tel qu'une tension électrique, une onde radio, une micro-onde ou un signal infrarouge.

Les données transmises peuvent être des messages **numériques** provenant d'une source de données, par exemple un ordinateur ou un clavier. Il peut également s'agir d'un signal **analogique**, tel qu'un appel téléphonique ou un signal vidéo, numérisé en un flux binaire, par exemple à l'aide de la modulation par impulsions et codage (MIC) ou de systèmes plus avancés de codage de la source (conversion analogique-numérique et compression des données). Ce codage et décodage de la source est effectué par un équipement [codec](https://en.wikipedia.org/wiki/Codec).

- Historique :
  - _1865_ : Télégraphe (S.B. Morse)
  - _1876_ : Téléphone (Bell)
  - _1930_ : Télévision (principes)
  - _1963_ : Télex, liaisons spécialisées
  - _1964_ : Transmission de données sur réseau de téléphone
  - _1969_ : Internet

### Elements d'un systèmes de transmission de données

#### Les principaux éléments

Une transmission de données met en œuvre des calculateurs d’extrémité et des éléments d’interconnexion dont les appellations et fonctions sont codifiées comme le montre la figure suivante :

<p align=center>
    <img src="https://www.irisa.fr/armor/lesmembres/cousin/Enseignement/Reseaux-generalites/Cours/2-7.gif">
</p>

- ETCD (équipement terminal de communication de données) - équipement spécifique chargé d'adapter les données à transmettre au support de communication
- ETTD (Equipement Terminal de Traitement de Données) - un élément susceptible d’échanger les données avec le réseau, qui ne se connecte pas directement à la ligne de transmission. Par exemple : un ordinateur, un terminal...
- La ligne de transmission ou support de transmission : l’ensemble des matériels et logiciels nécessaires à l’acheminement des données avec un taux d’erreur garantie

### Types de liaisons

- Il existe deux façons de transmettre une séquence de caractères sur une liaison de données :

  - _Liaison parallèle_ - transfert simultané de tous les bits d’un même mot. Elle nécessite autant de conducteurs qu’il y a de bits à transmettre. Elle autorise une grande vitesse de transmission (débit), mai a un coût élevé (nombre de conducteurs) et la distance entre les hôtes doit être réduite
  - _Liaison série_ - tous les bits d’un mot ou d’un message sont transmis successivement sur une même ligne. La liaison série nécessite une interface de conversion pour sérialiser les bits à l'émission (conversion parallèle/série) et les désérialiser à la réception (conversion série/parallèle)

- Chaque caractère est codé avec un code de longueur n

<p align=center style="background: white">
    <img src="https://web.maths.unsw.edu.au/~lafaye/CCM/transmission/images/parallele.gif">
    <img src="https://img-19.ccm2.net/-cBjiwojICYhzhmHJc6-H5UfTPE=/3a95d03f2fcc4633938ff9f2eebe18c8/ccm-encyclopedia/transmission-images-serie.gif">
</p>

### Modes de transmission - sychronisation

- Transmission synchrone - les données se déplacent de manière complètement appariée, sous la forme de morceaux ou de trames. La synchronisation entre la source et la cible est nécessaire pour que la source sache où commence le nouvel octet puisqu'il n'y a pas d'espace entre les données. La transmission synchrone est efficace, fiable et souvent utilisée pour transmettre une grande quantité de données. Elle offre une communication en temps réel entre des dispositifs liés.

- Transmission asynchrone - les données se déplacent par paires, 1 octet ou 1 caractère à la fois. Elle envoie les données dans un courant constant d'octets. La taille d'un caractère transmis est de 8 bits, avec un bit de parité ajouté au début et à la fin, soit un total de 10 bits. Il n'a pas besoin d'une horloge pour l'intégration, mais utilise les bits de parité pour indiquer au récepteur comment traduire les données.

### Débit binaire

Le débit binaire d’un circuit de donnée est égal au nombre de bit transmis par seconde :

- D = 1/Tb [bit/seconde] (où Tb est le temps d’un bit)
- Le mode asynchrone ne permet pas des débits élevés. Le mode synchrone pour débits > 1200 bit/s

## Les supports de transmission

### Caractéristiques des voies

- **Bande Passante et Capacité**
  - la plage de fréquences sur laquelle la voie est capable de transmettre des signaux sans que leur affaiblissement soit trop important. Elle s'exprime en Hertz.
  - Le rapport d'affaiblissement (RA) est le rapport entre la puissance du signal reçu et la puissance du signal émis.
  - Il est considéré comme nul pour les fréquences hors de la bande passante, et constant pour les fréquences dans la bande passante ( d'où le nom de filtre passe-bande linéaire donné aux voies).
  - Le théorème de [Shannon-Tuller](#) exprime la relation entre la capacité C et la BP W d'une voie: <br> C = W log2(1 + S/N) **bit/s** <br> où S/N est le rapport de la puissance du signal émis sur la puissance du bruit de la voie (S/N pour "Signal/Noise").

### Signaux numériques et série de Fourier

Fourier a démontré que toute fonction périodique g(t) de période T peut être décomposée en une suite théoriquement infinie de fonctions sinusoïdales = série de Fourier

<p align=center>
    <img src="https://s1.studylibfr.com/store/data/003426595_1-8d64efdce4fc7db3f29ada74c4e2a93e-768x994.png" width="500">
</p>

Fourier a également défini un outil mathématique pour passer du signal à son spectre (ensemble des harmoniques)
Transformée de Fourier -> BP du signal

#### Déduction

Ces caractéristiques de voies vont permettre de savoir quelles transformations il faudra effectuer sur les signaux à émettre pour qu'ils soient transportés.

-> Il faut en particulier que la BP utile ( Largeur de bande ou spectre) du signal soit comprise dans la BP de la voie.

- **Longueur élémentaire** - la longueur maximale de support au delà de laquelle le signal doit être amplifié ou répété pour être correctement reçu. En effet le signal s'affaiblit au fur et à mesure de sa propagation dans le support.
- **Défaut et Bruit** - Le bruit est un signal parasite additif au signal utile. Il peut amener à des erreurs d’interprétation du signal reçu
- **Taux d’erreur** - Le taux d'erreur d'une voie est la probabilité de perte ou d'altération d'un bit transmis sur cette voie
  - _TEB_ = rapport de nombre de bits erronés sur le nombre de bits transmis (pendant une période de temps significative).
  - _TER_ Le taux d'erreur résiduel est le taux d'erreur qui reste après la mise en oeuvre des mécanismes de protection contre les erreurs
  - _TER <= TEB_
- **Temps de transfert**
  - _Temps de propagation_ ∆p - Temps nécessaire à un signal pour parcourir un support d'un point à un autre
  - _Temps d’émission_ ∆e - Délai qui s'écoule entre le début et la fin de la transmission d'un message sur une ligne
  - _Temps d'acheminement_ (de transfert) ∆a = ∆p + ∆e
- **Modes d’utilisation d’un circuit de données**
  - Liaison simplexe
  - Liaison Half duplex
  - Liaison Full duplex

### Les supports de transmission

- [La paire de fils](https://fr.wikipedia.org/wiki/Paire_torsad%C3%A9e)
- [Le câble coaxial](https://fr.wikipedia.org/wiki/C%C3%A2ble_coaxial)
- [La fibre optique](https://fr.wikipedia.org/wiki/Fibre_optique)
- [Les ondes radio](https://fr.wikipedia.org/wiki/Onde_radio)

## Techniques de transmission de données

Pour transmettre des informations binaires sur un support de transmission, il est nécessaire de le transformer au préalable en un signal électrique mieux adapté aux contraintes physiques du système de transmission. Les réseaux informatiques présentent la particularité de demander de très hauts débits, de plusieurs mégabits par seconde. Dans ce contexte, deux techniques de transmission sont envisageables : la transmission dite en mode de bade qui n’effectue qu’une simple transformation du signal, et la transmission qui réalise une translation du spectre (modulation)

### Transmission en bande de base

La transmission en bande de base (base band) typique de la plupart des réseaux locaux, consiste à transmettre directement les signaux numériques sur le support de transmission. La figure ci-dessous résume le principe de la transmission en bande de base.

Le Codeur bande de base, à essentiellement pour objet de :

- transformer le signal numérique en un autre, à fin que le spectre du nouveau signal soit mieux adapté aux caractéristiques du support de transmission (de bande passante en particulier)
- maintenir la synchronisation entre l’émetteur et le récepteur.
- Un tel procède est simple et non coûteux, mais demande des supports de transmission à grande bande passante.

On appelle codage, l’opération qui fait correspondre à chaque caractère une représentation binaire on l’appel codage à la source.

Différents codages sont utilisés pour transmettre les données en bande de base :

- **Code NRZ**

  - _1_ -> +a, _0_ -> -a
  - L’horloge n’est pas transportée
  - Composante continue non nulle

- **Code de Manchester**

  - _1_ -> transition montante, _0_ -> transition descendante
  - Composante continue est nulle
  - Interprétation des signaux dépend sens connexion fils

- **Code de Manchester differentiel**

  - Valeur 0 ---> même transition que celle du bit précédent
  - Valeur 1 ---> transition opposée à celle du bit précédent
  - On n'a plus de problème d'interprétation du signal lorsque les fils sont inversés

- **Code bipolaire**
  - Le 0 du signal binaire est codé en 0.
  - Le 1 du signal binaire et codé alternativement en +a ou -a par rapport au 1 précédent.

[Lien utile](https://www.irisa.fr/armor/lesmembres/cousin/Enseignement/Reseaux-generalites/Cours/2-5.htm)

### Transmission par modulation

- On applique la modulation lorsque la bande passante du signal n'est pas incluse dans celle du support. Elle sert donc à la décaler
- On module une onde sinusoïdale dite porteuse
  - On varie l'un de ses paramètre (amplitude, fréquence, phase) en fonction de l'information
- On distingue deux types de modulation :
  - Modulation pour signal analogique **Modulation**
  - Modulation pour signal numérique **Shift**

#### Modulation d'amplitude

Signal : s(t) = A(t) cos(2π f0 \* t - Φ0)

avec A(t) = K + a(t) et a(t) ∈ {-a,+a} ... ou a(t) ∈ [-a,+a] !

#### Modulation de fréquence

Signal : s(t) = A0 cos(2 π f(t) t - Φo)

avec f(t) = f0 + a(t) et a(t) ∈ {-w,+w}... ou a(t) ∈ [-w,+w] !

#### Modulation de phase

Signal : s(t) = A0 cos(2π f0 \* t - Φ(t))

avec Φ(t) = Φ0 + a(t) et a(t) ∈ {Πk/n} pour n symboles ... ou a(t) ∈ [-Π,+Π] !

[Lien utile](https://www.youtube.com/watch?v=qGwUOvErR8Q&ab_channel=SunnyClassroom)

### Rapidité de modulation

- R = nbre de signaux élémentaires/sec

- R = 1/Tm bauds (Tm: durée pendant laquelle le signal ne varie pas -> signal élémentaire)

- On montre : D = R log2(n)

  - avec n = nbre de valeurs que peuvent prendre les signaux élémentaires ( valence du signal)
  - **n = 2** - D = R
  - **n = 4** - D = 2R par exemple dans une modulation de phase à quatre phases **QPSK**

- log2(n) étant le nombre de bits codés avec un état physique

### Combinaison de plusieurs modulations

Il est possible de combiner plusieurs modulations afin d’augmenter la valence;
Exemple : Modulation d’amplitude et de phase **APSK** (n=8)

## Techniques de multiplexage

C'est la technique ou l'opération de grouper les informations de plusieurs sources afin de les transmettre sur le meme support physique sans qu'elles se mélangent mutuellement. À la réception, une opération inverse, un démultiplexage doit nous permettre de reproduire chacune des sources et de l'acheminer à sa destination.

<p align=center style="background: white;">
    <img src="https://img-19.ccm2.net/Nt6IHFJJV1_3lZpszRHxPDUwC-k=/bbc4f32d76394e6c9fa962bbba9080f1/ccm-encyclopedia/transmission-images-mux.gif" width="400">
</p>

On distingue 3 techniques principales de multiplexage de l'information :

### Multiplexage fréquentiel

- **FDM** - Frequency Division Multiplexing
- Cette technique permet à tous les émetteurs ou sources d'information de transmettre simultanément chaque source ayant son propre canal ou bande passante
- Une fréquence porteuse est attribuée à chaque liaison
- La voie haute vitesse est divisée en bandes de fréquences correspondant à chaque client voies basse vitesse
- La voie haute vitesse doit assurer une capacité suffisante pour absorber le trafic
- Utilisation: ligne téléphonique et paires torsadées
- Exemples : ADSL, groupe primaire du RTC

### Multiplexage temporel

- **TDM** : Time Division Multiplexing
- permet à tous les émetteurs ou sources d'information de transmettre périodiquement sur le support
- Allocation d’intervalle de temps IT à chaque voie VB
- Chaque IT est allouée cycliquement à la voie
- Meilleure utilisation de la bande passante que le multiplexage fréquentiel
- Si n clients le débit Di sur la BV = D/n

### Multiplexage Statistique

Dans les multiplexages précedents, la voie haute vitesse est proportionnée par rapport à tous les clients.

- Problème : la transmission de << blancs >> gaspille de la bande passante.
- Principe : la ligne multiplexée est allouée régulièrement à chaque terminal mais seulement s'il a besoin de transmettre, les temps de silence sont évalués statistiquement et définissent l'llocation statique de chaque voie basse vitesse

[Lien utile](https://www.youtube.com/watch?v=fIZhDl35_XY&ab_channel=SunnyClassroom)

### Technique MIC

C’est une numérisation d’un signal analogique qui consiste en trois étapes :

- **L'Echantillonnage** - consiste à prélever un nombre déterminé d'éléments (échantillons) qui seront suffisants pour reconstituer à l'arrivée un signal analogique de qualité.

  - **Th. de Shannon** - Il suffit d'échantillonner à deux fois la fréquence supérieure contenu dans le signal.

- **La Quantification** - Elle consiste à donner à chaque échantillon une valeur prise dans une échelle de valeurs. L'erreur effectuée dans l'approximation est appelée bruit de numérisation. nb de valeurs possible = nb de niveaux

- **Le Codage** - Chaque échantillon sera codé sur un ensemble de bits. Si 2m niveaux de quantification le codage de chaque échantillon se fait sur m bits

Les principaux relations :

- Pas d'echantillonage : p = (Vmax - Vmin) / 2^n
  - (Vmax - Vmin) est la plage de mesure
  - n est le nombre de bits
- Periode d'echantillonnage : Te = 1/fe
  - fe est la frequence d'echantillonage
- fe >= fmax du signal
- Debit binare : D = fe x n = n/Te
- Nombre de niveaux N = 2^n

<p align=center>
    <img src="https://electronicscoach.com/wp-content/uploads/2018/10/Recontruction-of-analog-signal-at-PCM-receiver.jpg" width="400">
</p>

[Lien utile](https://www.youtube.com/watch?v=YJmUkNTBa8s&ab_channel=FiberOpticsForSaleCo.)

## Détection / Correction d’erreurs

- Indépendamment des supports de communication et des techniques de transmission utilisés, des perturbations vont se produire entraînant des erreurs.
- On adapte alors des strategies de protection contre les erreurs de transmission:
  - Correction :
    - Auto-correction (**FEC** : Forward Error Correction)
    - Correction par retransmission (**ARQ** : Automatic Repeat Request)
  - Détection

<p align=center >
    <img src="https://www.tutorialspoint.com/computer_logical_organization/images/error.jpg">
</p>

### Codes à base de parité

- On ajoute à chaque caractère un bit de parité dit parité verticale ou VRC (Vertical Redundancy Check), calculé comme suit : pour chaque caractère, on fait la somme modulo 2 de ses bits. Si le nombre de bits 1 est pair, on ajoute 0 à la fin du caractère, et si le nombre de bits 1 est impair, on ajoute 1.

- _Exemple_: pour le caractère M codé (ASCII) par 1001101, le bit de parité vaut 0.
  - On transmet dans cet ordre **1011001**0 (les 7 bits de données puis le bit de parité).
- Inconvénient général:
  - on ne détecte pas les erreurs doubles !!!

### CRC : Cyclic Redundancy Check

- Dans le contrôle polynomial, on considère la trame à transmettre comme un groupe de bits auquel on fait correspondre un polynôme P(x), tel que le coefficient de degré i correspond à la valeur du ieme bit.
- Les algorithmes de calcul se font modulo 2 sur les polynômes (Z/2Z)
- On choisit un polynôme G(x) de degré r, appelé polynôme générateur, caractéristique du contrôle.
- **À l’émission**, on multiplie P(x) par pow(x,r) et on divise le polynôme obtenu par G(x). Le reste noté R(x), obtenu par division euclidienne, est de degré strictement inférieur à r. Il est ajouté à la fin de la trame comme code de contrôle.
- x^r \* P(x) = G(x) \* Q(x) + R(x).
- On transmet le polynôme T(x), constitué à partir de P(x) et du reste R(x) et défini par:
  T(x) = x^r \* P(x) + R(x)

- ce polynôme vérifie T(x) = G(x)\*Q(x)
- **A la réception**, si le reste de la division de T(x) pat G(x) est nul, l’informationon reçue correspond à celle émise
- Sinon, T(x) = G(x)\*Q1(x) + R1(x). Une ou plusieurs erreurs ont été introduites et l’information reçue doit être ignorée.
