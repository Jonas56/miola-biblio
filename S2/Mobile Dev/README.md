# Mobile Development (Android)

## Table of contents

- [Introduction](#introduction)
- [DevOps](#devops)
- [Design](#ux-design)
- [Android](#android)
- [UI Layout View](#ui-layout-view)
- [Activities](#activities)
- [Intent](#intent)

## Ressources

- [Cour Prof](#)
- [Book](#)

## Introduction

<p align=center>
    <img src="https://1.bp.blogspot.com/-1fuLFiJuxIM/YKLms6qO9kI/AAAAAAAAAHc/f-5vyCClU_YxRB1wywMOYQdO1bDcsxL9ACLcBGAsYHQ/s0/image2.png" width="1000">
</p>

Le développement d'applications mobiles connaît une croissance rapide. Qu'il s'agisse de télécommunications, de commerce électronique, d'assurance, de soins de santé ou d'administration, les organisations de tous les secteurs doivent répondre aux attentes des utilisateurs, qui souhaitent disposer de moyens pratiques et en temps réel pour effectuer des transactions et accéder aux informations. Aujourd'hui, les appareils mobiles - et les applications mobiles qui les mettent en valeur - sont le moyen le plus populaire pour les particuliers et les entreprises de se connecter à Internet. Pour rester pertinentes, réactives et performantes, les entreprises doivent développer les applications mobiles que leurs clients, partenaires et employés exigent.

Pourtant, le développement d'applications mobiles peut sembler décourageant. Une fois que vous avez choisi la ou les plates-formes du système d'exploitation, vous devez surmonter les limites des appareils mobiles et faire en sorte que votre application franchisse tous les obstacles potentiels de la distribution. Heureusement, en suivant quelques lignes directrices de base et les meilleures pratiques, vous pouvez rationaliser votre parcours de développement d'applications.

### Applications mobiles et plateformes

Il existe deux plateformes dominantes sur le marché moderne des smartphones. La première est la plateforme iOS d'Apple. La seconde est Android de Google. Le système d'exploitation Android est utilisé non seulement par les appareils Google, mais aussi par de nombreux autres équipementiers pour construire leurs propres smartphones et autres appareils intelligents.

Bien qu'il existe certaines similitudes entre ces deux plates-formes lors de la création d'applications, le développement pour iOS et le développement pour Android impliquent l'utilisation de kits de développement logiciel (SDK) et de chaînes d'outils de développement différents. Alors qu'Apple utilise iOS exclusivement pour ses propres appareils, Google met Android à la disposition d'autres entreprises à condition qu'elles répondent à des exigences spécifiques, comme l'inclusion de certaines applications Google sur les appareils qu'elles livrent. Les développeurs peuvent créer des applications pour des centaines de millions d'appareils en ciblant ces deux plateformes.

### Alternatives pour la création d'applications mobiles

Il existe quatre grandes approches de développement pour la création d'applications mobiles.

- Applications mobiles natives
- Applications mobiles natives multiplateformes (cross-platform)
- Applications mobiles hybrides
- Progressive web app (**PWA**)

Chacune de ces approches de développement d'applications mobiles présente ses propres avantages et inconvénients. Lorsqu'ils choisissent la bonne approche de développement pour leurs projets, les développeurs prennent en compte l'expérience utilisateur souhaitée, les ressources informatiques et les fonctionnalités natives requises par l'application, le budget de développement, les délais et les ressources disponibles pour la maintenance de l'application.

|       | Applications mobiles natives                                                                                                                                                                                                                                               | Applications mobiles natives multiplateformes                                                                                                                                                                                               | Applications mobiles hybrides                                                                                                                                                                                                                                                                                                                                                                     | Progressive web app                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ----- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       | Les applications mobiles natives multiplateformes peuvent être écrites dans une variété de langages de programmation et de frameworks différents, mais elles sont compilées en une application native s'exécutant directement sur le système d'exploitation de l'appareil. | Les applications mobiles natives sont écrites dans le langage de programmation et les frameworks fournis par le propriétaire de la plateforme et s'exécutent directement sur le système d'exploitation de l'appareil, comme iOS et Android. | Les applications mobiles hybrides sont construites à l'aide de technologies web standard, telles que JavaScript, CSS et HTML5, et sont regroupées dans des paquets d'installation d'applications. Contrairement aux applications natives, les applications hybrides fonctionnent sur un "conteneur web" qui fournit un moteur de navigation et une passerelle pour les APsI des appareils natifs. | Les PWA offrent une approche alternative au développement traditionnel d'applications mobiles en évitant la livraison dans les marchés d'applications (par exemple play store) et les installations d'applications. Les PWA sont des applications web qui utilisent un ensemble de fonctionnalités du navigateur - comme le travail hors ligne, l'exécution d'un processus en arrière-plan et l'ajout d'un lien à l'écran d'accueil de l'appareil - pour offrir une expérience utilisateur "similaire à celle d'une application". |
| Plus  | + Meilleures performances d'exécution<br>+ Accès direct aux API des appareils                                                                                                                                                                                              | + Une base de code unique pour de multiples plateformes<br>+ Facilité de création et de maintenance de votre application                                                                                                                    | + Base de code partagée entre les applications web et mobiles<br>+ Utiliser les compétences en matière de développement web pour créer des applications mobiles.                                                                                                                                                                                                                                  | + La même application est disponible à la fois pour le web et le mobile<br>+ Aucune installation requise, accessible par une URL                                                                                                                                                                                                                                                                                                                                                                                                  |
| Moins | - Coûts plus élevés lors de la création et de la maintenance de votre application<br>- Plusieurs bases de code pour chaque plate-forme                                                                                                                                     | - Dépend de ponts et de bibliothèques pour les fonctionnalités des dispositifs natifs. <br>- Limitations des performances dues au bridging                                                                                                  | - Performances inférieures à celles des applications natives<br>- Prise en charge limitée des fonctionnalités des appareils natifs                                                                                                                                                                                                                                                                | - Les capacités de l'application dépendent du navigateur utilisé<br>- Prise en charge limitée des fonctionnalités des appareils natifs                                                                                                                                                                                                                                                                                                                                                                                            |

### Défis du Développement Mobile

- Marché dynamique et très concurrentiel.
- Diversité et complexité des besoins des clients.
  - Interfaces graphique conviviales
  - Satisfaction au maximum de l’utilisateur
  - Assurer la sécurité
  - Assurer la privacy
- Utilisateurs mobiles hétérogènes
  - Utilisateurs novices
  - Utilisateurs expérimentés
  - Contexte et profiles variables
- Changement rapide dans les technologies mobiles.
- Ressources mobiles limitées :
  - CPU,
  - RAM,
  - Mémoire de stockage,
  - batterie,
  - taille de l’écran,
  - Dépendance à la connectivité Internet.
- Besoins de compétences qualifiées.
- Besoin de collaboration entre les équipes de développement mobile et les équipes de développement back-end

## DevOps

DevOps est la combinaison de philosophies, de pratiques et d'outils culturels qui augmentent la capacité d'une organisation à fournir des applications et des services à grande vitesse : évolution et amélioration des produits à un rythme plus rapide que les organisations utilisant les processus traditionnels de développement de logiciels et de gestion de l'infrastructure. Cette rapidité permet aux organisations de mieux servir leurs clients et d'être plus compétitives sur le marché.

<p align=center>
    <img src="https://dt-cdn.net/wp-content/uploads/2021/07/13429_ILL_DevOpsLoop.png" width=700>
</p>

### Comment fonctionne le DevOps

Dans un modèle DevOps, les équipes de développement et d'exploitation ne sont plus "cloisonnées". Parfois, ces deux équipes sont fusionnées en une seule équipe où les ingénieurs travaillent sur l'ensemble du cycle de vie des applications, du développement et des tests au déploiement et aux opérations, et développent un éventail de compétences non limitées à une seule fonction.

Dans certains modèles DevOps, les équipes chargées de la qualité et de la sécurité peuvent également être plus étroitement intégrées au développement et aux opérations, et ce tout au long du cycle de vie de l'application. Lorsque la sécurité est au centre des préoccupations de tous les membres d'une équipe DevOps, on parle parfois de [**DevSecOps**](https://snyk.io/series/devsecops/).

<p align=center>
    <img src="https://marvel-b1-cdn.bc0a.com/f00000000236551/dt-cdn.net/images/devsecops-image-2000-6557ba1b00.png" width=700>
</p>

Ces équipes utilisent des pratiques pour automatiser des processus qui, historiquement, étaient manuels et lents. Elles utilisent une pile technologique et des outils qui les aident à exploiter et à faire évoluer les applications de manière rapide et fiable. Ces outils aident également les ingénieurs à accomplir de manière indépendante des tâches (par exemple, le déploiement du code ou le provisionnement de l'infrastructure) qui auraient normalement nécessité l'aide d'autres équipes, ce qui accroît encore la vélocité d'une équipe.

### Avantages de DevOps

#### Vitesse

Progressez à grande vitesse afin d'innover plus rapidement pour vos clients, de mieux vous adapter à l'évolution des marchés et de devenir plus efficace dans l'obtention de résultats commerciaux. Le modèle DevOps permet à vos équipes de développement et d'exploitation d'atteindre ces résultats. Par exemple, les [microservices](https://en.wikipedia.org/wiki/Microservices) et la [livraison continue](https://en.wikipedia.org/wiki/Continuous_delivery) permettent aux équipes de s'approprier les services et d'en diffuser les mises à jour plus rapidement.

#### Livraison rapide

Augmentez la fréquence et le rythme des livraisons afin de pouvoir innover et améliorer votre produit plus rapidement. Plus vite vous pouvez déployer de nouvelles fonctionnalités et corriger les bugs, plus vite vous pouvez répondre aux besoins de vos clients et créer un avantage concurrentiel. [L'intégration continue](https://en.wikipedia.org/wiki/Continuous_integration) et la [livraison continue](https://en.wikipedia.org/wiki/Continuous_delivery) sont des pratiques qui permettent d'automatiser le processus de publication des logiciels, de la construction au déploiement.

#### Fiabilité

Assurez la qualité des mises à jour d'applications et des changements d'infrastructure afin de pouvoir livrer de manière fiable à un rythme plus rapide tout en maintenant une expérience positive pour les utilisateurs finaux. Utilisez des pratiques telles que [l'intégration continue](https://en.wikipedia.org/wiki/Continuous_integration) et la [livraison continue](https://en.wikipedia.org/wiki/Continuous_delivery) pour vérifier que chaque changement est fonctionnel et sûr. Les pratiques de [Monitorring](https://www.humio.com/glossary/application-monitoring/) et de [Logging](https://beapython.dev/2020/10/26/logging-best-practices-in-software-development/) vous aident à rester informé des performances en temps réel.

#### Scale

Exploitez et gérez votre infrastructure et vos processus de développement à l'échelle. L'automatisation et la cohérence vous aident à gérer efficacement et avec moins de risques des systèmes complexes ou fluctuants. Par exemple, [Infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code) vous aide à gérer vos environnements de développement, de test et de production de manière répétitive et plus efficace.

#### Amélioration de la collaboration

Constituez des équipes plus efficaces dans le cadre d'un modèle culturel **DevOps**, qui met l'accent sur des valeurs telles que la propriété et la responsabilité. Les équipes de développeurs et d'exploitation collaborent étroitement, partagent de nombreuses responsabilités et combinent leurs workflows. Cela permet de réduire les inefficacités et de gagner du temps (par exemple, réduction des périodes de transfert entre les développeurs et les exploitants, écriture de code qui tient compte de l'environnement dans lequel il est exécuté).

#### La sécurité

Progressez rapidement tout en gardant le contrôle et en préservant la conformité. Vous pouvez adopter un modèle DevOps sans sacrifier la sécurité en utilisant des politiques de conformité automatisées, des contrôles à grain fin et des techniques de gestion de la configuration. Par exemple, en utilisant [Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_code) et [Policy as Code](https://www.paloaltonetworks.com/cyberpedia/what-is-policy-as-code), vous pouvez définir et suivre la conformité à l'échelle.

### Pourquoi DevOps est important

Les logiciels et l'Internet ont transformé le monde et ses industries, du shopping au divertissement en passant par la banque. Les logiciels ne se contentent plus de soutenir une entreprise, ils deviennent un élément à part entière de chaque partie de l'entreprise. Les entreprises interagissent avec leurs clients par le biais de logiciels fournis sous forme de services ou d'applications en ligne et sur toutes sortes d'appareils. Elles utilisent également des logiciels pour accroître leur efficacité opérationnelle en transformant chaque partie de la chaîne de valeur, comme la logistique, les communications et les opérations. De la même manière que les entreprises de biens physiques ont transformé leur façon de concevoir, de fabriquer et de livrer des produits grâce à l'automatisation industrielle tout au long du XXe siècle, les entreprises du monde actuel doivent transformer leur façon de fabriquer et de livrer des logiciels.

<h3 align=center> Comment adopter un modèle DevOps</h3>

### La philosophie de la culture DevOps

La transition vers DevOps exige un changement de culture et d'état d'esprit. Dans sa forme la plus simple, DevOps consiste à supprimer les barrières entre deux équipes traditionnellement cloisonnées, le développement et les opérations. Dans certaines organisations, il peut même ne pas y avoir d'équipes de développement et d'exploitation distinctes ; les ingénieurs peuvent faire les deux. Avec DevOps, les deux équipes travaillent ensemble pour optimiser à la fois la productivité des développeurs et la fiabilité des opérations. Elles s'efforcent de communiquer fréquemment, d'accroître leur efficacité et d'améliorer la qualité des services qu'elles fournissent aux clients. Elles s'approprient pleinement leurs services, souvent au-delà de la portée de leurs rôles ou titres traditionnels, en réfléchissant aux besoins du client final et à la manière dont elles peuvent contribuer à les satisfaire. Les équipes d'assurance qualité et de sécurité peuvent également être étroitement intégrées à ces équipes. Les organisations qui utilisent un modèle DevOps, quelle que soit leur structure organisationnelle, ont des équipes qui considèrent l'ensemble du cycle de développement et d'infrastructure comme faisant partie de leurs responsabilités.

### Pratiques DevOps

- [Intégration continue](https://en.wikipedia.org/wiki/Continuous_integration)
- [Livraison continue](https://en.wikipedia.org/wiki/Continuous_delivery)
- [Microservices](https://en.wikipedia.org/wiki/Microservices)
- [Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_code)
- [Monitoring et Logging](#)
- [Communication et collaboration](https://www.accenture.com/us-en/blogs/software-engineering-blog/hegde-singh-team-collaboration-in-devops)

[**Useful link...**](https://www.bitrise.io/why/features/mobile-devops)

## Design

En 2020, les revenus mondiaux des applications mobiles ont augmenté à plus de [318 milliards de dollars](https://www.statista.com/forecasts/1262892/mobile-app-revenue-worldwide-by-segment) américains, et le secteur continue de se développer en raison de l'évolution des smartphones et des technologies. Cependant, 24% des applications ne sont utilisées qu'une seule fois et 57% des applications sont supprimées dans le mois qui suit.

Les statistiques montrent que :

- **71 %** des utilisateurs désinstallent des applications en raison de notifications gênantes.
- **41,3 %** notent des publicités intrusives (ce chiffre passe à **65,6 %** avec les applications de jeux!).
- **29,6 %** d'entre eux évoquent des préoccupations en matière de respect de la vie privée, qui peuvent inclure des opt-ins forcés et des connexions sociales.
- **15,6 %** d'entre eux sont plus précis dans leurs préoccupations, citant un enregistrement trop complexe.
- **26,8%** accusent une expérience utilisateur globale sous-optimale, en particulier pour les applications professionnelles.

Comme vous pouvez le constater, la conception des applications mobiles contribue fortement au taux de rétention des applications.

### UX design

- User experience, ou UX décrit l’expérience acquise par un utilisateur en interaction avec un produit ou un service donné.
- Cette expérience dépend étroitement de la façon avec laquelle le produit ou le service était conçu.
- La satisfaction de l’utilisateur est le paramètre clé permettant de mesurer l’expérience utilisateur.

### Processus UX Design

1. Definidtion du probleme.
2. Collecte des information sur le probleme en servant des interviews, enquetes...
3. Analyse du probleme.
4. Prototypage
5. Realiser des tests permettant de mesurer le degre de facilite d'utilisation du produit ou du service

## Android

- Android est un eplateforme mobile open source et gratuire qui fournit un ensemble complet de logiciels pour les appareil mobiles.
- **Les froces** :
  - Base sur noyau Linux
  - Open source
  - Personnalisable
  - Supporte par plus de 80% des martphones
  - Supporte les ecran tactiles...
- L'architecture Android est organise sous forme d'un ensemble de composantes logicielles rassemblees sous forme de cinq couches et six sections :
  - **Section** :
    - Application
    - Applications Framework
    - Android Runtie
    - Native Libraries
    - HAL (Hardware Abstraction Layer)
    - Linux kernel

<p align=center>
  <img src="https://developer.android.com/guide/platform/images/android-stack_2x.png" alt="Android architecture" height="900">
</p>

### Linux Kernel

- Le noyan Linux fonctionne comme une couche d'abstraction entre le materiel et les differentes composantes logicielles

### HAL

- le HAL offre des interfaces logicielles standards qui permettent aux applications (couches hautes de la plateforme Android)
- Il s'agit d'un ensemble de modules (.so), chacun offre une implementation d'une interface a un composant materiel specifique dans l'appareil mobile tel que la camera, le Bluetooth, USB, WIFI ...

### Native C/C++ Libraries

- Plusieurs services e la plateforme Android (Java framework APIs) sont batis sur la base de la bibliotheques qui sont ecrites en C et C++

### Android Runtime

- Cette section offre :
  - Un environnement de developpement Java
  - Une variante de la machine virtuel Java appelee ART, concue et optimisee specialement pour Android pour supporter les appareils mobiles sa faibles memoires.
- Les services de ART comportent :
  - une compilation AOT (Ahead Of Time) qui accelere l'execution d'applications
  - Une gestion optimisee de la memoires et du GC
  - une reduction considerable de la consommation d'energie
  - Un meilleur support de debogage
  - ...

### Application Framework

- Cette couche offre un ensemble d'APIs ecrites en languages Java et qui peuvent etre utilisees dans le developpement d'applications Android
  - **View system** pour la creation d'interfaces graphiques
  - **Content provider** qui permet la communication entre les applications
  - **Notification manager** qui permet d'afficher des alertes personnalisees dans la barre d'etat
  - **Activity Manager** qui permet de gerer le cycle de vie d'une application
  - **Resource Manager** qui permet d'acceder aux ressources d'une application

### Applications

- Android encapsule un certain nombre d'aaplications system pret a etre utilisees : email, SMS messaging, Calendars, internet browsing, Contacts...
- Les applications systeme peuvent etres accedees par les applications des developpeurs pour exploiter leurs fonctionnalites sans avoir besoins de les redefinir.

## Outils de Developpement

### Android Software Developer Kit (SDK)

- Outils pour la gestion des projets de developpement mobile (code, buid, test, debug, run, monitor ...)
  - Un ensemble de libraries
  - Un environnement debugueur DDMS utilisant ADB (Android Debug Bridge)
  - Un emulateur rapide et tres riche AVD (Android Virtual Device)
  - Un environnement de constructions d'application Android AAPT (Android Asset Packing Tool)

### Structure d'un Projet Android

<p align=center>
  <img src="https://i.postimg.cc/MKJmmthg/Structure-Projet-Android-Studio.png" alt="Android project structure">
</p>

1. Fichier pour la description de l'application mobile
2. Code source de l'application
3. Les ressources (fichiers xml) de l'application : layout, strings, images, dimensions, colors...
4. Fichier de gestion des dependances

- La structure d'un projet Android est beaucoup plus complexe et comporte d'autre elements tels que :
  - **app/src/androidTest/** Contient du code pour les tests d'instrumentation executes sur un appareil Android
  - **app/src/main/jni** Contient un code natif utilisant l'interface Java Native (JNI)
  - **app/src/main/gen** Contient les fichiers Java generes par Android Studio, tel que votre fichier R.java

### Le Manifest

- Chaque application Android doit contenir dans la racine de son projet un fichier qui porte le nom _AndroidManifest.xml_ et qui offre des informations sur les elements de l'application
  - Definition des elements de l'application
  - Definition des classes qui les implementent
  - Description de leurs capabilites (qui sont exploites dans la gestion des intent)
  - Description des conditions dans lesquelles ils peuvent etre demarres
  - Declration des permissions que les element d'autres applications doivent avoir pour interagir avec les element dde l'application.
  - ...

### Le Gradle

- _Gradle_ est un systeme de gestion automatique du processus de developpement logiciel qui couvre les etapes de : compilation, paquetage, test, deploiement et publication...
- _Gradle_ permet d'ecrire des taches de construction (builds) dans un fichier de construction en utilisant le langage Groovy

## UI Layout View

### Activity

- Une activite est un element de base d'une base application Android qui offre un seul ecran avec une interface graphique (gerer en XML)
- En plus de l'interface graphique, une activite offre le traitement (Code Java) necessaire pour gerer les interfactions avec les utilisateurs
- Toutes les interfaces Android sont realisees sur la base des objets heritant de **View** et **ViewGroup**
- Un objet de type **View** dessine un element graphique (Texte, Image, Button...) quelconque sur un ecran avec lequel l'utilisateur peut interagir
- Un objet de type **ViewGroup** est un conteneur d'objet de type **View** (et **ViewGroup**) qui permet de definir la structure de l'interface
- Une application se compose souvent de plusieurs activites qui sont reliees les unes aux autres et qui sont executees dans un enchainement qui depend des interactions avec l'utilisateur
- Chaque activite peut demarer une autre activite dans la meme application ou dans une autre application
- La communication entre les activites se fait via l'envoi de messages (**Intents**)
- L'activite presentee a l'utilisateur au demarrage est l'activite principale de l'applications **Main Activity **
- Chaque fois qu'une nouvelle activite est lancee, elle sera stockee dans une pile LIFO et conduit les interactions avec l'utilisateur. L'activite precedente sera suspendue.
- Si l'utilisateur fait un retour en arriere alors l'activite courante sera detruite et l'activite precedente sera reprise

<p align=center>
  <img src="https://miro.medium.com/max/582/1*irHLQ4HFY3m6-HXPR6nC5g.png" height="700" alt="Activity Lifecycle">
</p>

- Toutes les activites collaborent pour offrir a l'utilisateur un comportement coherent de l'application tout en gardant leur independance les une aux autres

### Service

- Dans une application, un service est un element qui s'execute en arriere plan (pas d'interface graphique) pour accomplir des taches qui durent dans le temps (Importer des donnees via un reseau, faire jouer un morceau de music en background...)
- De la meme facon que les activites, un service peut communiquer avec n'importe quel element dans une application, et il continue son execution en background meme si l'utilisateur passe a une autre application.

### Fragment

- Un fragment peut etre considere comme une section dans une activite et qui occupe une zone bien precise et qui possede son propre comportement
- Une activite peut comporter plusieurs fragments qui peuvent etre encore reutilises dans l'autre activites

### Intents

- Un **Intent** est un objet de messagerie utilise par un element de l'aaplication (Activity, service,...) pour solliciter l'execution d'une **action** aupres d'un autre element.
- Un **Intent** est utiliser principalement aux cas suivants :
  - Au demarrage d'une activite
  - Au demarrage d'un service
  - Pour fournin un broadcast
- Il existe deux type d'intents :
  1.  **Les Intents explicites** qui recoivent en parametre le nom de la classe de l'activite ou du service a demarrer dans la meme application.
  2.  **Les Intents implicites** qui sollicitent a une autre application d'executer une action sans savoir au prealable le nom de la classe, de l'activite ou du service a demarrer.

<p align=center>
  <img src="https://i.postimg.cc/Qt4445Zv/Intent-Structure.png" alt="Intent Structure">
</p>

- Le nom de l'element est optionnel, son existence dans l'intent le rend implicite
- Sans le nom de l'element, l'Intent sera explicite et le systeme decide quel element doit recevoir l'Intent en se basant sur les autres informations (action, data and category...)

### ContentProvider & ContentResolver

- Dans une application le **ContentProvider** fait la gestions d'acces a un ensemble structure de donnees :
  - Encapsulation des donnees
  - Definition de la securite des donnees
  - Offre une interface d'acces aux donnees
- Pour acceder aux donnees dans un **ContentProvider** a partir d'une application, il faut utiiser un **ContentResolver**

## Definition des interfaces graphiques Android

- Une activity, objet heritant de la classe **AppCompatActivity** ou de la classe **Activity**

### Layout

- Un **Layout** (objet heritant de **ViewGroup**) definit l'aspect visuel d'un GUI. Il peut etre declare de deux manieres :
  1.  Fichiers XML place dans le repertoire **res/layout** du projet
  2.  Instanciation des objets de leurs manipulation (dans le code Java de l'activite)

#### Activite + Layout

- Le code Java minimal d'une activite peut comme suit :

```java
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

  protected void onCreate(Bundle savedInstanceState){
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main_layout);
  }
}
```

- La methode `onCreate()` permet de realiser le chargement du layout de l'activite au moment de son execution.
- la classe `R.layout` designe le repertoire **res/layout**

#### Elements graphique d'un Layout

- Toutes les UI (User Interface) Android sont realisees sur la base des objets heritant de **View** et **ViewGroup** (_Definis en haut dans le document_)
- Les objets Heritant de la classe View constituent les elements de la couche **View** du modele MVC

#### Hierarchie d'un Layout

- Une interface n'est donc qu'une hierarchie de **ViewGroup** et de **View**

#### Types de Layouts

<p align=center>
  <img src="https://i.postimg.cc/8PM85KS5/Types-Layouts.png" alt="Types Layouts">
</p>

##### Layouts Standards

- **ConstrainLayout** : Connecte les elements graphiques (**View** et **ViewGroup**) avec des contraintes
- **LinearLayout** : Agence les elements graphiques d'une maniere vericale ou horizontale
- **RelativeLayout** : Agence les elements, les uns par rapport aux autres
- **TablesLayout** : Structuration a base de lignes et de colonnes
- **FrameLayout** : Fait la mise en places des elements chacun en dessus de l'autre sous forme d'une pile d'elements

##### LinearLayout

- Un **LinearLayout** est un objet heritant de **ViewGroup** permettant ainsi d'organiser les elements d'une interface graphique d'une maniere lineaire et dans une seule direction, verticalement ou horizontalement.
- Les elements d'un LinearLayout peuvent etre de type **View** et/ou **ViewGroup**
- **TableLayout** herite **LinearLayout**
- [https://developer.android.com/reference/android/widget/LinearLayout](https://developer.android.com/reference/android/widget/LinearLayout)
- **Exemple** :

<p align=center>
  <img src="https://2.bp.blogspot.com/-CUuCLDxs63U/XCCMLZ3YNuI/AAAAAAAAFiA/NQYGVUEojYo8mHGwj59ZCTi58e8bDpntwCEwYBhgL/s1600/LinearLayout.gif" alt="LinearLayout example">
</p>

##### RelativeLayout

- **RelativeLayout** est un objet heritant de **ViewGroup** permettant ainsi d'organiser les positions des elements d'une interfaces graphique d'une maniere relative.
- La position de chaque elements est specifiee soit une relation avec l'element parent l'encapsulant, soit par rapport un autre element voisin cible (en faisant reference a son ID)
- Par defaut, tous les elements sont empiles en haut et a gauche de l'interface faisant usage d'un **RelativeLayout**
- [https://developer.android.com/reference/android/widget/RelativeLayout](https://developer.android.com/reference/android/widget/RelativeLayout)
- **Exemple** :

<p align=center>
  <img src="https://i.postimg.cc/g2xZ8Zgn/Exemple-Relative-Layout.png" alt="RelativeLayout example">
</p>

##### TableLayout

- **TableLayout** est un **ViewGroup** qui fait la mise en places de ses elements dans une structure a base de lignes et de colonnes
- Chaque ligne **TableRow** va contenir un certain nombre d'elements de type **View** qui seront places dans des cellules
- Les cellules peuvent etre vides et peuvent couvrirent plusieurs colonnes de la meme facon que HTML
- Le nombre de colonnes de la **TableLayout** sera le nombre maximal des elements dans les **TablesRow**
- La taille de chaque colonne sera la taille de son **View** le plus large, mais, on peut intervenir sur le comportement de chaque colonne
- **TableLayout** n'affiche pas les bordures des cellules, des ligne ou des colonnes
- La numeration des colonnes commence par 0
- Un element d'une ligne quelconque peut occuper plusieurs colonnes en utilisant comme attribut **android:layout_span** en lui precisant le nombre des colonnes sur lesquelles doit s'etendre l'element concerne
- Pour placer un element dans une colonne precise nous utilisant l'attribut **android:layout_column** qui doit recevoir le numero de la colonne concerne
- L'attribut **android:stretchColumns** de l'element **TableLayout** recoit un numero ou une liste de numeros de colonnes separes par une virgule. ces colonnes seront etirer pour occuper tout l'espace encore disponible dans les lignes
- Inversement l'attribut **android:shrinkColumns** permet de reduire la largeur des colonnes qui contiennent des elements de grandes largeurs en partageant leur contenues sur plusieurs lignes
- **Exemples** :

<p align=center>
  <img src="https://i.postimg.cc/k5rBShVp/Exemple-Table-Layout0.png" alt="TableLayout example 1">
</p>

<p align=center>
  <img src="https://i.postimg.cc/j2Gr1BrV/Exemple-Table-Layout1.png" alt="TableLayout example 2">
</p>

##### FrameLayout

- **FrameLayout** est un **ViewGroup** qui fait la mise en places des elements chacun en dessus de l'autre sous forme d'une pile d'elements
- On controle les positions des views en utilisant l'attribut **android:layout_gravity**
- La taille d'un **FrameLayout** est la taille de l'element le plus large que ce soit visible ou non
- [https://developer.android.com/reference/android/widget/FrameLayout](https://developer.android.com/reference/android/widget/FrameLayout)
- **Exemple** :

<p align=center>
  <img src="https://i.postimg.cc/zBvZGqzZ/Exemple-Frame-Layout.png" alt="FrameLayout-example">
</p>

##### ConstraintLayout

- Le layout par defaut dans un projet Android Studio
- C'est le layout le plus flexible parmi tous les layout possibles
- Il se base sur les contraintes definissant le positionnement de chaque elements graphiques par rapport aux autres elements
- **match_constraint** : Expands element to fill its parent
- **wrap_content** : Shrinks element to enclose content
- fixed number of dp (_density-independent pixels_)

##### Elements graphiques standards

<p align=center>
  <img src="https://i.postimg.cc/zGpqztCh/Elements-Graphiques-Standards.png" alt="Elements-Graphiques-Standards">
</p>

### Views

- Android offre un certain nombre d'elements heritant de **View** et qui sont consideres comme les briques de base de la constriction d'une interface graphique Android. On site a titre d'exemple:

  - **TextView** : Affiche une chaine
  - **EditText** : Permet la saisie d'une chaine (_propriete inputType pour le type d'entree attendu_)
  - **Button** : bouton cliquable, variante de type interrupteur avec **ToggleButton**
  - **CheckBox** : case a cocher
  - **RadioButton** : bouton radio regroupable dans un **RadioGroup**
  - **CheckedTextView** : Chaine cochable (Implemente **Checkable**)
  - **ProgressBar** : barre de progression variante avec etoiles de notation avec **ratingBar**
  - **SeekBar** : barre de reglage
  - **SearchView** : champ de recherche avec proposition de suggestions
  - **ImageView** : affichage d'une ressource image
  - **ImageButton** : bouton avec image
  - **VideoView** : affichage controlable de video

- Les **Layouts** ainsi que les **Views** offrent un certain nombre d'attributs permettant de personaliser leur comportement et leur apparence dans un GUI
- Les attributs les plus communs concernent principalement :
  - Taille
  - Gravite
  - Poinds
  - Dspacement
  - ...
- D'autres attributs dependent du type du **View** et du conteneur (**Layout**) englobant

##### Taille

- Pour definir la taille d'un element alors on doit determiner les valeurs les deux proprietes suivantes :
  - **android:layout_width**
  - **android:layout_height**
- Ces attributs peuvent prendre 3 types de valeur :
  - **une taille fixe** : par exemple 50px
  - **une taille adaptative** : par exemple 50dp
  - **match_parent** : Dans ce cas on demande au composant d'occuper tout l'espace disponible chez son conteneur parent (apres le placement des autres **View**)
  - **wrap_content** : pour demander au **View** d'occuper une taille naturelle (la taille de son contenu pour le texte par exemple), S'il est trop gros par rapport a la taille disponible, Android s'occupera par exemple de couper le texte s'il n'ya plus de place

##### Gravite

- Dans un **LinearLayout** les elements sont alignes de gauche a droite et de haut en bas
- La definition de l'attribut **android:layout_gravity** permettra de placer element tout en bas ou a droite
- Les gravites les plus couramment utilisees sont :
  - **left** : aligner les elements a gauche
  - **center_horizontal** : au centre
  - **top** : en haut
  - **bottom** : en bas
  - **right** : a droite
- On peut aussi utiliser **center_vertical** pour centrer verticalement l'element

##### Poids

- Imaginez que vous avez 2 boutons en colonne et que vous voulez que chacun occupe tout l'espace disponible
- Si on leur affecte la meme valeur du poids (**android:layout_weight**), l'espace libre sera partage equitablement entre les deux
- Si l'on met une valeur 1 au premier et 2 au second, le deuxieme prendra deux fois plus d'espace libre que le premier (_par defaut la valeur du poids est de 0_)
- Vous pouvez aussi utiliser des pourcentages, mais dans ce cas assurez vous bien que la somme des pourcentages ne depasse pas 100%

##### Espacements

- Les differents elements que vous creez sont par defaut serres les uns contre les autres
- On peut augmenter l'espacement a l'aide de la propriete **android:padding** (_padding top, left, right et bottom_)
- La valeur precise l'espace situe entre le contour de l'element et son contenu reel.

### Les Menus Android

- Android offre la possibilite de gerer les menu en utilisant un format XML standard
- Pour definir un menu, on doit creer un fichier XML dans le repertoire **res/menu/** du projet
- La definition du fichier se compose des elements suivants `<menu> <item>`
- L'element `<item>` possede les attributs suivants :
  - **android:id**- Attribut un id unique a un item
  - **android:icon** - Permet de faire reference (_dans le reprtoire drawable_) a l'icone qui doit representer l'item dans le menu en cours de definition
  - **android:title** - Represente titre e l'item qui apparait dans le menu
  - **android:showAsAction** - Permet de specifier le nom de la fonction (_dans le code de l'activite qui comporte le menu_) qui permet de specifier ou et quand l'item doit apparaitre dans le menu
  - **android:onClick** - Permet de specifier le nom de la fonction (dans le code de l'activite qui comporte le menu) qui permet de repondre au click sur l'item
- Il existe trois types de menss sous Android :
  1.  Le menu **Option**
  2.  Le menu **Contextuel**
  3.  Le menu **Popup**

#### Le Menu Option

- Le menu d'option est une collection d'elements qui permettent de placer les actions qui possedent un impact global sur l'application comme :
  - la recherche
  - l'envoi d'email
  - le help
  - la configuration de l'application ...
- Pour definir un menu option pour une activite il faut implementer la methode `onCreateOptionsMenu()`

```java
public boolean onCreateOptionsMenu(Menu menu){
  MenuInflater inflater = getMenuInflater();
  inflater.inflate(R.menu.MyOptionMenu, menu);
  return true;
}
```

- On peut utiliser l'objet menu pour ajouter, supprimer ou mettre a jour des items dans le menu (_Voir le chapitre Interaction avec GUI_)
- Si l'utilisateur clique sur un item dans le menu, le systeme sait appel a la methode `onOptionsItemSelected(MenuItem item)`

#### Le Menu Contextuel

- Le menu contextuel est un menu flottant qu'on obtient lorsqu'on clique longtemps sur un element
- Il permet souvent d'appliquer un action sur l'element concerne par le clique
- On peut offrir un menu contextuel pour n'importe quel objet de type **View**, mais, ils sont utilises souvent pour les items dans un **ListView** ou dans un **GridView**
- Pour utiliser un menu contextuel, il faut implementer la methode `onCreateContextMenu()`

```java
public void onCreateContextMenu(ContextMenu menu, ContextMenuInfo menu
  info){
    super.onCreateContextMenu(menu, v, menuInfo);
    MenuInflater inflater = getMenuInflater();
    inflater.inflate(R.menu.MyContextMenu, menu);
  }
```

- On peut utiliser l'objet menu pour ajouter, supprimer ou mettre a jour des items dans le menu (_Voir le chapitre Interaction avec GUI_)
- Si l'utilisateur clique sur un item dans le menu, le systeme fait appel a la methode `onContextItemSelected(MenuItem item)`

#### Le Menu Popup

- Un menu popup est un menu qu'on attache a un **View** (souvent un bouton), qui apparait en dessous ou au dessus du **View** en reponse a n clique
- Un menu Popup est utile surtout dans le cas ou le clique sur un bouton ramene a plusieurs options
- Il suffit de definir l'attribut `onClick` du **View** concerne qui doit recevoir le nom de la fonction qui doit attacher le View au menu popup dans le repertoire menu du projet

## Activities

- Une activite est une classe qui herite de la classe **android.app.Activity**
- Elle doit implementer les differentes methodes (_Callback methods_) auxquelles le systeme fait appel pendant la transition entre les etats de son cycle de vie

### Etats d'une activite

1. **Created** : L'activite est cree mais n'est pas encore demarree
2. **Started** : l'activite est demarree et devient visible et passe automatiquement et rapidement a l'etat **Resumed**
3. **Resumed** : L'activite est visisble en premier plan et c'est la seule qui est exposee a l'utilisateur
4. **Paused** : L'activite est toujours visible mais une autre activite est exposee a l'utilisateur en premier plan (_cette derniere est transparente ou n'occupe pas la totalite de l'ecran_)
5. **Stopped** : L'activite est completement interrompue par une autre activite qui occupe la totalite de l'ecran. Elle est toujours en memoire mais elle peut etre detruite a tout moment par le systeme dans le cas de besoin de l'espace memoire
6. **Destroyed** : L'activite est detruite et est effacee de la memoire

### Cycle de vie d'une Activite

<p align=center>
  <img src="https://i.postimg.cc/MHt9MQd9/Cycle-De-Vie-Activity.png">
</p>

```java
public classe MainActivity extends Activity{
  @Override
  public void onCreate(Bundle savedInstanceState){
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    // The activity is being created
  }
  @Override
  protected void onStart(){
    super.onStart();
    // The activity is about to become visible
  }
  @Override
  protected void onResume(){
    super.onResume();
    // The activity has become visible
  }
  @Override
  protected void onPause(){
    super.onPause();
    // Another activity is taking focus
  }
  @Override
  protected void onStop(){
    super.onStop();
    // The activity is no longer visible
  }
  @Override
  protected void onDestroy(){
    super.onDestroy();
    // the activity is about to be destroyed
  }
}
```

- Il n'est pas obligatoire de manipuler toutes les methodes permettant de gerer de transition entre le etats d'une activite. Leur implementation depend de la complexite de l'application
- Les methode doivent etre implementees proprement de telle sorte qu'elles assurent le bon fonctionnement de l'application
- L'implementation doit permettre d'eviter les suivants :
  - L'application ne se bloque pas si l'utilisateur recoit un appel telephonique ou pass une autre application lors de l'utilisation de l'application
  - Ne consomme pas de ressources systeme precieuses lorsque l'utilisateur ne l'utilise pas activement
  - Ne perd pas l'historique de l'utilisateur si elle quitte votre application et y retourne plus tard
  - Ne se bloque pas ou ne perde pas l'historique de l'utilisateur lorsque l'ecran tourne entre l'orientation paysage et portrait.

#### onCreate()

- La methode `onCreate()` doit etre implementee obligatoirement dans une activite, car c'est la premiere methode a laquelle le systeme fait appel a la creation d'une activite
- A son implementation on doit faire appel essentiellement a la methode `setContentView()` pour definir le layout de l'interface de l'activite
- On peut egalement initialiser les composantes essentielles de l'activite

```java
public void onCreate(Bundle savedInstanceState){
  super.onCreate(savedInstanceState);
  setContentView(R.layout.activity_main);
  // The activity is being created
}
```

#### onStart()

- Les etats **Created** et **Started** sont transitoires et le systeme passe rapidement d'eux a l'etat suivant (**Resumed**)
- Donc apres que le Systeme appelle `onCreate()`, il appelle rapidement `onStart()`, qui est rapidement suivi par `onResume()`
- La methode `onStart()` est un bon endroit pour verifier que les fonctionnalites systeme requises sont activee :
  - Demnder a l'utilisateur d'activer le GPS (s'il est desactive)
  - Demander a l'utilisateur d'activer Internet (s'il est desactive)
  - Recuperer des donnees indispensables pour un bon fonctionnement de l'activite
  - ...

#### onResume()

- Permets de realiser les initialisations qui doivent etre faites a chaque fois que l'application passe a l'etat **Resumed** :
  - Commencer une animation
  - Initialiser les composantes qui doivent etre initialisees uniquement si l'activite est exposee entierement a l'utilisateur en premier plan

#### onPause()

- Le systeme fait appel a le methode `onPause()` au moment ou l'utilisateur quitte l'activite en passant par exemple a une autre application
- Generalement, c'est la methode dans laquelle on doit realiser la persistance des Informations qui doivent etre stockees en permanence dans le as ou l'utilisateur quitte l'appication definitivement
- Dans le cas ou l'utilisateur returne a l'activite, le systeme fait appel a la methode `onResume()`

#### onStop()

- Apres l'appel de la fonction `onStop()` l'application passe a l'etat **Stopped** et devient invisible
- Elle doit liberer toutes les ressources qui ne sont pad requises pendant que l'utilisateur n'utilise pas l'activite
- Apres qu'une activite passe a l'etat **Stopped** le systeme peut eventuellement la detruire en faisant appel a `onDestroy()` pour liberer de l'espace memoire
- Meme si la methode `onPause()` est sollicitee par le systeme pour realiser les persistances des informations avant de faire appel a `onStop()`, cette derniere doit etre utilisee pour realiser des operations de persistances plus importantes telles que l'ecriture des informations dans une base de donnees

#### onRestart()

- A chaque fois que l'activite passe de l'etat **Stopped** a l'etat visible la methode `onRestart()` est appelee
- Le systeme fait aussi appel a la methode `onStart()`
- L'implementation de `onRestart()` peut consister a u travail de restauration de l'etat de l'activite

### Sauvegarder l'etat d'une activite (Persistance)

<p align=center>
  <img src="https://i.postimg.cc/kMZ694JC/Persistance.png">
</p>

- Au cas ou l'utilisateur retourne a une activite deja detruite, le systeme doit etre capable de restaurer l'etat de l'activite sans que l'utilisateur remarque aucun probleme
- L'implementation de methode `onSaveInstanceState()` permet d'assurer la perservation des informations de l'activite a tout moment de son cycle de vie. Elle doit etre invoquer de preference dans `onPause()` ou `onStop()`
- `onSaveInstanceState()` permet de stocker les infomrations dans un objet de type **Bundle** qui est une sorte de dictionnaire (des pairs (cle, valeur))
- Cette objet est passe aux methodes `onCreate()` et `onRestoreInstanceState()`

### Recuperer les elements Graphiques

- Tous les elements graphiques d'une activite heritent de la classe **android.view.View**
- Tout objet de type **View** occupe une zone rectangulaire a l'ecran, possede des proprietes qui representent son etat courant et gere ses propres evenement qui sont declenches en interaction avec un utilisateur
- Tout objet de type **View** doit etre indentifi par un identifiant unique dans l'activite (valeur entiere generer automatiquement et stockee dans l'attribut **R.id.non_identifiant**)
- Le nom de l'identifiant est defini dans le fichier XML du Layout de l'activite
- Pour recuperer n'importe quelle composante graphique d'une activite fait apple a la methode `findViewById()`

### Gerer les Evenement des elements Graphiques

- Une fois qu'un element graphique est recupere alors on peut par la suite definir ses evenement qui seront declenches en reponse a une nteraction avec les utilisateur
- Les evenement qu'on peut definir pour un element heritant de la classe **View**

<p align=center>
  <img src="https://i.postimg.cc/ryYWmj9v/Events.png">
</p>

- **Methode 1** :

```java
public class ExampleActivity extends Activity implements OnClickListener{

  protected void onCreate(Bundle savedValues){
    ...
    Button bttOk = (Button) findViewById(R.id.BttOk);
    bttOk.setOnClickListener(this);
    ...
  }

  // Implémentation de la méthode de OnClickListener
  public void onClick(View v){
    // le traitement à réaliser si on click sur le bouton
  }
}
```

- **Methode 2** :

```java
public class ExampleActivity extends Activity {

  protected void onCreate(Bundle savedValues){
    ...
    Button bttOk = (Button) findViewById(R.id.BttOk);
    bttOk.setOnClickListener(myOKListener);
    ...
  }

  // Create an anonymous implementation of OnClickListener
  private OnClickListener myOKListener = new OnClickListener(){
    public void onClick(View v){
      // le traitement à réaliser si on click sur le bouton
    }
  }
}
```

### Modifier l'état d'un element graphique en reponse aux évenements

- **Modifier ses proprietes**: le texte, la couleur, l'arriere plan, la taille, l'emplacement ...
- **Modifier sa visibilite** : on peut cacher ou afficher un element en faisant appel a la methode `setVisibility(int)`
- **Modifier le focus** : pour donner le focus a un element specifique on fait appel a la methode `requestFocus()`
- ...

## Intent
