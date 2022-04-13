# Mobile Development (Android)

## Table of contents

- [Introduction](#introduction)
- [DevOps](#devops)
- [Design](#ux-design)
- [Android](#)
- [UI Layout View](#)
- [Activities](#)
- [Intent](#)

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

<!-- [UX design](https://www.usabilis.com/ux-designer/)

[Metriques](https://www.userzoom.com/ux-library/what-metrics-and-kpis-do-the-experts-use-to-measure/)


[Processus](https://xd.adobe.com/ideas/guides/ux-design-process-steps/) -->
