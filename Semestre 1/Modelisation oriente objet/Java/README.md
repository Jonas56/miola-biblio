# JAVA - MIOLA

## Ressources

- [Head First Java](https://www.amazon.com/Head-First-Java-Kathy-Sierra/dp/0596009208)
- [Cours Prof T.RACHAD]()

## Table of contents

1. [Ecosystème Java]()
2. [POO concept de base](#introduction)
   1. [Classes et Objets]()
   2. [Le principe d'encapsulation]()
   3. [Héritage]()
   4. [Polymorphisme]()
   5. [Packages]()
   6. [Classes abstraites et interfaces]()
3. [Les exceptions et lambda expressions]()
4. [Géniricité]()
5. [Collections](#paragraph1)
6. [Gestion des Flux]()
7. [Accès aux Bases de Données](#paragraph2)
8. [Les Threads]()
9. [Les interfaces graphiques]()

## Ecosysteme Java

Les trois parties les plus élémentaires de l'écosystème Java sont la machine virtuelle Java (JVM), l'environnement d'exécution Java (JRE) et le kit de développement Java (JDK).

<p align="center">
  <img src="https://s3.shunyafoundation.com/s3/1578452c3f66d8fd0d04d5d195328ae1359d8caa/jdk-jvm.png" alt="java-ecosystem"  width=400 />
</p>

- Chaque programme Java s'exécute sous le contrôle d'une JVM. Chaque fois que vous exécutez un programme Java, une instance de JVM est créée. Il assure la sécurité et l'isolement du programme Java en cours d'exécution. Il empêche l'exécution du code d'entrer en conflit avec d'autres programmes au sein du système. En termes plus simples, JVM agit comme un ordinateur à l'intérieur d'un ordinateur, spécialement conçu pour exécuter des programmes Java.

[lire encore plus...](https://www.javatpoint.com/jvm-java-virtual-machine)

- Le JRE est un ensemble de programmes qui contient la JVM ainsi que de nombreux fichiers bibliothèques/classes nécessaires à l'exécution de programmes sur la JVM. Il comprend toutes les classes Java de base (le runtime) ainsi que les bibliothèques d'interaction avec le système hôte (telles que la gestion des polices, la communication avec le système graphique, la possibilité de jouer des sons et des plugins pour l'exécution des applets Java dans le navigateur) et des utilitaires (tels que l'interpréteur JavaScript Nashorn et l'outil de manipulation cryptographique keytool).

[lire encore plus...](https://www.ibm.com/cloud/learn/jre)

- Dans la couche supérieur on trouvele JDK. Le JDK contient tous les programmes nécessaires au développement de programmes Java, et sa partie la plus importante est le compilateur Java (javac). Le JDK comprend également de nombreux outils auxiliaires tels qu'un désassembleur Java (javap), un utilitaire pour créer des packages d'applications Java (jar), un système pour générer de la documentation à partir du code source (javadoc), parmi de nombreux autres utilitaires. Le JDK est un sur-ensemble du JRE, ce qui signifie que si vous avez le JDK, vous avez également le JRE (et la JVM).

[lire encore plus...](https://www.geeksforgeeks.org/jdk-in-java/)

<p align="center">
  <img src="https://static.packt-cdn.com/products/9781789801736/graphics/C09581_01_02.jpg" alt="javaFlow"  width=400 />
</p>

## POO concepts de base

### Classes et Objets

- Dans la programmation orientée objet, une classe est un modèle permettant de créer des objets (une structure de données particulière), de fournir des valeurs initiales pour l'état (attributs) et de mettre en œuvre le comportement (méthodes).

Les différences entre objet et classe est donnée ci-dessous:

|                                          Objet                                          |                            Classe                             |
| :-------------------------------------------------------------------------------------: | :-----------------------------------------------------------: |
|                                  Instance d'une classe                                  | La classe est un modèle à partir duquel les objets sont créés |
| Entité du monde réel telle qu'un stylo, un ordinateur portable, un mobile, un lit, etc. |         Une classe est un groupe d'objets similaires          |
|                                    Entité physique.                                     |                        Entité logique                         |
|                          Créé plusieurs fois selon les besoins                          |                    Déclarée une seul fois.                    |
|                     L'objet alloue de la mémoire lorsqu'il est créé                     |    La classe n'alloue pas de mémoire lors de sa création.     |

<p align=center>
  <img src="https://intellipaat.com/mediaFiles/2019/03/python10.png" width="500" alt="Classes and Objects" >
</p>

La syntaxe de base pour définir une classe :

```java
class NomClasse {
  [déclaration dattributs]
  [déclaration de methodes]
}
```

Exemple :

```java
class Car {

  String modele;
  double prix;

  public Car(String modele, double prix){ // Constructeur
    this.modele = modele;  // "this" keyword refers to this class
    this.prix = prix;
  }
}
```

Pour créé un objet:

```java
  Car objet1 = new Car("R4",3500.69);  // Objet 1
  Car objet2 = new Car("ZX",2200.69);  // Objet 2
```

- Les objets sont créés a partir du constructeur.

#### Le principe d'encapsulation

Le principe d'encapsulation en poo est un mécanisme permettant d'envelopper les données (attributs) et le code agissant sur les données (méthodes) en une seule unité. Dans l'encapsulation, les variables d'une classe sont cachées aux autres classes et ne sont accessibles que par les méthodes de leur classe actuelle.

<p align=center>
  <img src="https://androidkennel.org/wp-content/uploads/2015/10/Encapsulation1.png.webp" width="500" alt="Classes and Objects" >
  <br>
  <b>Figure 1.1</b>  Data Encapsulation
</p>

L'encapsulation permet de déclarer des méthodes (services) qui permettent de:

- Modifier les données protégées (mutateurs `setXXX()`)
- Récupérer les données protégées (accesseurs `getXXX()`)

Pour réaliser l'encapsulation en Java:

- Déclarer les attributs comme étant privées.
- Fournir des méthodes publiques setter et getter pour modifier et visualiser les valeurs des variables.

Exemple:

```java
class Car {

  private String modele;
  private double prix;

  public Car(String modele, double prix){ // Constructeur
    this.modele = modele;  // "this" keyword refers to this class
    this.prix = prix;
  }

  public double getPrix(){
    return prix;
  }

  public String getModele(){
    return modele;
  }

  public void setPrix(double prix){
    this.prix = prix;
  }

  public void setModele(String Modele){
    this.modele = modele;
  }
}
```

#### Héritage

- L’héritage permet à une ou plusieurs classes dérivées d’hériter des propriétés et des comportements d’une classe de base (dite classe mère).
- Les classes dérivées partagent donc des données et des comportements communs qui appartiennent à leur classe mère .
- L'héritage représente la relation **IS-A**.

La syntaxe de l'héritage en Java:

```java
class Car extends Vehicule {

   //methods et attributs

}
```

L’héritage permet d’assurer:

- Economie du code (réutilisation)
- Amélioration de la fiabilité
- Amélioration de la lisibilité

En JAVA, chaque classe est autorisée a hériter directement d’une seul classe, et chacune pourra avoir plusieurs classes dérivées.

<p align=center>
  <img src="https://static.javatpoint.com/images/core/typesofinheritance.jpg" width="500" alt="Héritage" >
  <br>
  <b>Figure1.2</b>  Héritage en Java
</p>

### Polymorphisme

Le mot polymorphisme vient du grec et signifie qui peut prendre plusieurs formes. Cette caractéristique est un des concepts essentiels de la programmation orientée objet. Alors que l'héritage concerne les classes (et leur hiérarchie), le polymorphisme est relatif aux méthodes des objets.

On distingue généralement trois types de polymorphisme :

- Le [polymorphisme ad hoc](https://en.wikipedia.org/wiki/Ad_hoc_polymorphism) (également surcharge ou en anglais **overloading**)
- Le [polymorphisme paramétrique](https://en.wikipedia.org/wiki/Parametric_polymorphism) (également généricité ou en anglais **template**)
- Le [polymorphisme d'héritage](https://en.wikipedia.org/wiki/Subtyping) (également redéfinition, spécialisation ou en anglais **overriding**)

<p align=center>
  <img src="https://www.askpython.com/wp-content/uploads/2019/12/Polymorphism-in-Python.png" width="500" " alt="Polymorphisme" >
  <br>
  <b>Figure1.3</b>  Polymorphisme d'héritage
</p>

### Package

- Un pakage est un regroupent de classes et d’interfaces et qui permet de les organiser sous le même espace de nom (namespace). Il permet également de contrôler l’accès aux différentes classes.
- Le langage Java fourni un ensemble de packages (Librairies ou API) qui représentent une boite à outils fournissant des fonctionnalités préétablies.
- Le programmeur peut également définir ses propres packages.
- Les classes n'ayant pas été déclarées public ne sont pas visibles depuis l'extérieur du package qui les contient.

### Classes abstraites et interfaces

#### Abstraction

L'abstraction est un concept de la programmation orientée objet qui ne **montre** que les attributs essentiels et **cache** les informations inutiles. L'objectif principal de l'abstraction est de cacher les détails inutiles aux utilisateurs. L'abstraction consiste à sélectionner des données dans un ensemble plus vaste pour ne montrer à l'utilisateur que les détails pertinents de l'objet. Elle permet de réduire la complexité et les efforts de programmation. C'est l'un des concepts les plus importants de la POO.

#### Classe abstraite et méthode abstraite

- Une classe abstraite est un type de classe dans la POO, qui déclare une ou plusieurs méthodes abstraites. Ces classes peuvent avoir des méthodes abstraites aussi bien que des méthodes concrètes. Une classe normale ne peut pas avoir de méthodes abstraites. Une classe abstraite est une classe qui contient au moins une méthode abstraite.
- Une classe abstraite ne peut pas être instancier

- Une méthode abstraite est une méthode qui ne contient que la définition de la méthode mais pas son implementation.
- Une méthode sans corps est connue comme une méthode abstraite. Elle doit être déclarée dans une classe abstraite.
- La méthode abstraite ne sera jamais finale car la classe abstraite doit implémenter toutes les méthodes abstraites.

Un exemple d'une classe abstraite en JAVA:

```java
abstract class NomClasse {
  abstract methode1(){}
  public void methode2(){
    // Implementation
  }
}
```

#### Interface

- Une interface en Java est une signature d'une classe.
- Elle possède des constantes statiques et des méthodes abstraites.
- Il ne peut y avoir que des méthodes abstraites dans l'interface Java, pas de corps de méthode.
- Elle est utilisée pour réaliser l'abstraction et l'héritage multiple en Java.
- Elle ne peut pas être instanciée tout comme la classe abstraite.

Pour déclarer une interface en JAVA:

```java
interface NomInterface {
  // Corps de l'interface qui contient des variables statiques et/ou methodes abstraites
}
```

#### Les avantages de l'abstraction

- Le principal avantage de l'utilisation d'une abstraction en programmation est qu'elle vous permet de regrouper plusieurs classes apparentées en tant que frères et sœurs.
- L'abstraction dans la programmation orientée objet permet de réduire la complexité du processus de conception et de mise en œuvre des logiciels.

### Les exceptions et lambda expressions
