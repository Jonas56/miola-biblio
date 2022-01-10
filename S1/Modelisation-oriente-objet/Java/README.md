# Java

## Ressources

- [Java SE documentation](https://docs.oracle.com/javase/8/docs/index.html)
- [Head First Java](https://www.amazon.com/Head-First-Java-Kathy-Sierra/dp/0596009208)
- [Cours Prof T.RACHAD]()

## Table des matières

- [Ecosystème Java](#ecosysteme-java)
- [POO concept de base](#introduction)
  - [Classes et Objets](#classes-et-objets)
  - [Le principe d'encapsulation](#le-principe-dencapsulation)
  - [Héritage](#héritage)
  - [Polymorphisme](#polymorphisme)
  - [Packages](#package)
  - [Classes abstraites et interfaces](#classe-abstraite-et-méthode-abstraite)
- [Les Exceptions](#les-exceptions)
- [Généricité](#généricité)
- [Collections](#collections)
- [Gestion des Flux](#gestion-des-flux)
- [Les Threads](#les-threads)
- [Accès aux Bases de Données]()
- [Les interfaces graphiques]()


## Ecosysteme Java

Les trois parties les plus élémentaires de l'écosystème Java sont la machine virtuelle Java (JVM), l'environnement d'exécution Java (JRE) et le kit de développement Java (JDK).

<p align="center">
  <img src="https://s3.shunyafoundation.com/s3/1578452c3f66d8fd0d04d5d195328ae1359d8caa/jdk-jvm.png" alt="java-ecosystem"  width=400 />
</p>

- Chaque programme Java s'exécute sous le contrôle d'une JVM. Chaque fois que vous exécutez un programme Java, une instance de JVM est créée. Il assure la sécurité et l'isolement du programme Java en cours d'exécution. Il empêche l'exécution du code d'entrer en conflit avec d'autres programmes au sein du système. En termes plus simples, JVM agit comme un ordinateur à l'intérieur d'un ordinateur, spécialement conçu pour exécuter des programmes Java.

[Lire encore plus](https://www.javatpoint.com/jvm-java-virtual-machine)

- Le JRE est un ensemble de programmes qui contient la JVM ainsi que de nombreux fichiers bibliothèques/classes nécessaires à l'exécution de programmes sur la JVM. Il comprend toutes les classes Java de base (le runtime) ainsi que les bibliothèques d'interaction avec le système hôte (telles que la gestion des polices, la communication avec le système graphique, la possibilité de jouer des sons et des plugins pour l'exécution des applets Java dans le navigateur) et des utilitaires (tels que l'interpréteur JavaScript Nashorn et l'outil de manipulation cryptographique keytool).

[Lire encore plus](https://www.ibm.com/cloud/learn/jre)

- Dans la couche supérieur on trouvele JDK. Le JDK contient tous les programmes nécessaires au développement de programmes Java, et sa partie la plus importante est le compilateur Java (javac). Le JDK comprend également de nombreux outils auxiliaires tels qu'un désassembleur Java (javap), un utilitaire pour créer des packages d'applications Java (jar), un système pour générer de la documentation à partir du code source (javadoc), parmi de nombreux autres utilitaires. Le JDK est un sur-ensemble du JRE, ce qui signifie que si vous avez le JDK, vous avez également le JRE (et la JVM).

[Lire encore plus](https://www.geeksforgeeks.org/jdk-in-java/)

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

## Les Exceptions

**Définition** : Une exception est un événement qui se produit pendant l'exécution d'un programme et qui perturbe le déroulement normal des instructions, du coup le programme/l'application se termine de manière anormale, ce qui n'est pas recommandé, c'est pourquoi ces exceptions doivent être traitées.

Une exception peut se produire pour de nombreuses raisons différentes. Voici quelques scénarios dans lesquels une exception se produit:

- Un utilisateur a saisi une donnée invalide;
- Un fichier qui doit être ouvert est introuvable;
- Une connexion réseau a été perdue au milieu des communications ou la JVM a manqué de mémoire;
- etc.

Certaines de ces exceptions sont dues à une erreur de l'utilisateur, d'autres à une erreur du programmeur, et d'autres encore à des ressources physiques qui ont connu une défaillance d'une manière ou d'une autre.

On distingue 3 types d' Exceptions:

- **Checked exceptions**: c'est une exception qui est vérifiée (notifiée) par le compilateur au moment de la compilation, ces exceptions sont également appelées exceptions de compilation. Ces exceptions ne peuvent pas être simplement ignorées, le programmeur doit prendre en charge (gérer) ces exceptions.
- **Runtime Exception**: c'est une exception qui se produit au moment de l'exécution. Il s'agit notamment de bogues de programmation, tels que des erreurs de logique ou une utilisation incorrecte d'une API. Les exceptions d'exécution sont ignorées au moment de la compilation.
- **Error** : ces exceptions concernent des problèmes liés à l'environnement. Par exemple, si un débordement de pile (stack overflow) se produit, une Error se produira. Ils sont également ignorés au moment de la compilation.

<p align=center>
  <img src="https://5balloons.info/wp-content/uploads/2017/07/exceptions1.jpg" width="500" " alt="Exceptions" >
  <br>
  <b>Figure2.1</b>  Hierarchy des exceptions
</p>

Lors de la détection d'une erreur, un objet qui hérite de la classe Exception est créé (on dit qu'une exception est levée) et propagé à travers la pile d'exécution jusqu'à ce qu'il soit traité.

Pour traiter ces exceptions on utilise le bloc `try/catch`:

```java
try{
  // instructions susceptibles de produire des erreurs ou des exceptions
} catch(NomExcepion e) {
  // Traiter l'excetion
}
// Reste du code est executé
```

On peut également ajouter autant de block `catch` qu'on souhaite:

```java
try{
  // instructions susceptibles de produire des erreurs ou des exceptions
} catch(NomExcepion1 e1) {
  // Traiter l'excetion
} catch(NomExcepion2 e2) {
  // Traiter l'excetion
} catch(NomExcepion3 e3) {
  // Traiter l'excetion
}
// Reste du code est executé
```

Extension:

```java
try{
  // instructions susceptibles de produire des erreurs ou des exceptions
} catch(NomExcepion e) {
  // Traitement de l'excetion
}finally{
  // après que l'exception est intercépté dans le bloc catch le block finally est executé
}
// Reste du code est executé
```

[Lire encore plus](https://docs.oracle.com/javase/tutorial/essential/exceptions/index.html)

## Généricité

En Programmation Orientée Object (POO), la généricité est un concept permettant de définir des algorithmes (types de données et méthodes) identiques qui peuvent être utilisés sur de multiples types de données. Cela permet donc de réduire les quantités de codes à produire.

Les méthodes génériques et les classes génériques en Java permettent aux programmeurs de spécifier, avec une seule déclaration de méthode, un ensemble de méthodes liés, ou avec une seule déclaration de classe, un ensemble de types liés, respectivement.

La généricité permettra d'avoir un code plus fortement typé ce qui permet aux programmeurs de détecter les erruers (types invalides) au moment de la compilation.

#### Exemples d'utilisation

```java
ArrayList<String> arrStr = new ArrayList<>(); // Créer un tableau de chaine de caractère
```

- On peut par exemple créer une classe permettant de stocker deux objets de même type.

```java
class PairValue<T> {

  //Variable d'instance
  private T valeur1, valeur2;

  //Constructeur avec paramètre inconnu pour l'instant
  public PairValue(T val1, T val2){
    this.valeur1 = val1;
    this.valeur2 = val2;
  }
  public void setValue1(T val){
    this.valeur1 = val;
  }
  public void setValue2(T val){
    this.valeur2 = val;
  }
  public T getValue1(){
    return this.valeur1;
  }
  public T getValue2(){
    return this.valeur2;
  }

}
```

- On peut également créer une classe permettant de stocker deux objets de types differents.

```java
class PairValue<T, S> {

  //Variable d'instance
  private T valeur1,
  private S valeur2;

  //Constructeur avec paramètre inconnu pour l'instant
  public PairValue(T val1, S val2){
    this.valeur1 = val1;
    this.valeur2 = val2;
  }
  public void setValue1(T val){
    this.valeur1 = val;
  }
  public void setValue2(S val){
    this.valeur2 = val;
  }
  public T getValue1(){
    return this.valeur1;
  }
  public S getValue2(){
    return this.valeur2;
  }

}
```

- Héritage et généricité

```java
public static void main(String[] args) {
    List<Voiture> listVoiture = new ArrayList<Voiture>();
    List<VoitureSansPermis> listVoitureSP = new ArrayList<VoitureSansPermis>();

    listVoiture = listVoitureSP;   //Interdit !
}
```

- Utilisation du wildcard `?`

```java
ArrayList<?> list; // list qui accepte n'importe quel objet
```

- Version avancé du wildcard

```java
List<? extends Voiture> listVoitureX; // list qui accepte n'importe quelle classe qui hérite de la classe Voiture
```

[Lire encore plus](https://docs.oracle.com/javase/tutorial/java/generics/)

## Collections

### Definition

En Java une collection est simplement un objet qui regroupe plusieurs éléments en une seule unité. Les collections sont utilisées pour stocker, récupérer, manipuler et communiquer des données. En général, elles représentent des éléments de données qui forment un groupe homogène, comme une main de poker (une collection de cartes) ou un annuaire téléphonique (une correspondance entre des noms et des numéros de téléphone).

### Un Framework de collections

Une architecture unifiée pour représenter et manipuler des collections. Tous les frameworks de collections contiennent les éléments suivants :

- **Interfaces**
- **Implémentations** (classes)
- **Algorithmes**

### L'architecture du framework Collections de java

<p align=center>
  <img src="https://techvidvan.com/tutorials/wp-content/uploads/sites/2/2020/03/collection-framework-hierarchy-in-java.jpg" height=400> <br>
  <b>Figure4.1</b>  Hierarchy du framework Collections
</p>

---

- **Interface Iterable**: est une représentation simple d'une série d'éléments sur lesquels il est possible d'effectuer une itération. Elle possède une seul méthode :

```java
Iterator iterator();
```

- **Iterator** : Interface qui permet de parcourir la collection, d’accéder à l’élément et supprimer les éléments de la collection. Les méthodes de cette interface sont les suivants:

  - hasNext()
  - next()
  - remove()
  - forEachRemaining()

---

- **Interface Collection** : Cette interface étend l'interface itérable et est implémentée par toutes les classes du framework de collection. Cette interface contient toutes les méthodes de base que toute collection doit possèder, comme l'ajout de données dans la collection, la suppression de données, l'effacement de données, etc.

- [Les methodes de l'interface Collection](https://docs.oracle.com/javase/8/docs/api/java/util/Collection.html)

---

- **List Interface** : Une collection ordonnée (également appelée séquence). L'utilisateur de cette interface a un contrôle précis sur l'endroit où dans la liste chaque élément est inséré. L'utilisateur peut accéder aux éléments par leur indice entier (position dans la liste), et rechercher des éléments dans la liste.

- [Les méthodes de cette interface](https://docs.oracle.com/javase/8/docs/api/java/util/List.html)

- Cette interface est implémenté par les classes [ArrayList](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html), [LinkedList](https://docs.oracle.com/javase/8/docs/api/java/util/LinkedList.html), [Vector](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html), et [Stack](https://docs.oracle.com/javase/8/docs/api/java/util/Stack.html).

Exemple d'implementation :

```java
List<String> list = new ArrayList<>();
```

---

- **Queue Interface** : Une collection conçue pour retenir des éléments avant leur traitement. A part les opérations de collecte de base, Queues fournissent des opérations supplémentaires d'insertion, d'extraction et d'inspection.

- [Les méthodes de cette interface](https://docs.oracle.com/javase/7/docs/api/java/util/Queue.html)

- Cette interface est implémenté par la classe [PriorityQueue](https://docs.oracle.com/javase/7/docs/api/java/util/PriorityQueue.html)

---

- **Set Interface** : Une collection qui ne contient aucun élément en double. Plus formellement, les Sets ne contiennent aucune paire d'éléments e1 et e2 telle que e1.equals(e2), et au plus un élément null. Comme son nom l'indique, cette interface modélise l'abstraction mathématique des ensembles.

- [Les méthodes de cette interface](https://docs.oracle.com/javase/7/docs/api/java/util/Set.html)

- Cette interface est implémenté par les classes [HashSet](https://docs.oracle.com/javase/7/docs/api/java/util/HashSet.html) et [TreeSet](https://docs.oracle.com/javase/7/docs/api/java/util/TreeSet.html)

Exemple d'implementation :

```java
Set<String> hash_Set = new HashSet<String>();
```

---

- **Map** : Un objet qui mappe les clés aux valeurs. Une carte ne peut pas contenir de clés en double; chaque clé peut correspondre à au plus une valeur.

- [Les méthodes de cette interface](https://docs.oracle.com/javase/7/docs/api/java/util/Set.html)

- Cette interface est implémenté par les classes [TreeMap](https://docs.oracle.com/javase/7/docs/api/java/util/TreeMap.html) et [HashMap](https://docs.oracle.com/javase/7/docs/api/java/util/HashMap.html)

## Gestion des Flux

Une entrée/sortie en Java consiste en un échange de données entre le programme et une autre source, par exemple la mémoire, un fichier, le programme lui-même... Pour réaliser cela, Java emploie ce qu'on appelle un _stream_ (qui signifie « flux»). Celui-ci joue le rôle de médiateur entre la source des données et sa destination. Java met à notre disposition toute une panoplie d'objets permettant de communiquer de la sorte. Toute opération sur les entrées/sorties doit suivre le schéma suivant : ouverture, lecture/ecriture, fermeture du flux

<p align=center>
  <img src="https://www.logicbig.com/tutorials/core-java-tutorial/java-util-stream/images/java-streams.png" height=400> <br>
  <b>Figure 5.1</b> Java Streams  
</p>

Java a décomposé les objets traitant des flux en deux catégories :

- les objets travaillant avec des fluxd'entrée (in), pour la lecture de flux;
- les objets travaillant avec des fluxde sortie (out), pour l'écriture de flux;

### Types de flux

Selon les données qu'un flux contient, il peut être classé en:

- Flux d'octets : utilisé pour lire et écrire un seul octet (8 bits) de données.
- Flux Textes : utilisé pour lire et écrire un seul caractère de données.
- Flux tampons :

### InputStream

Cette classe abstraite est la superclasse de toutes les classes représentant un flux d'octets d'entrée.

Afin d'utiliser les fonctionnalités de InputStream, nous pouvons utiliser ses sous-classes. Certains d'entre eux sont:

- [FileInputStream](https://docs.oracle.com/javase/7/docs/api/java/io/FileInputStream.html)
- [ByteArrayInputStream](https://docs.oracle.com/javase/7/docs/api/java/io/ByteArrayInputStream.html)
- [ObjectInputStream](https://docs.oracle.com/javase/7/docs/api/java/io/ObjectInputStream.html)

<p align=center>
  <img src="https://cdn.programiz.com/sites/tutorial2program/files/java%20inputstream-subclasses.png" height=auto width=600> <br>
  <b>Figure 5.2</b> Sous-classes de InputStream
</p>

#### Methods of InputStream

La classe InputStream fournit différentes méthodes qui sont implémentées par ses sous-classes. Voici quelques-unes des méthodes couramment utilisées:

- `read()` - lit un octet de données du flux d'entrée
- `read(byte[] array)`
- `available()` - renvoie le nombre d'octets disponibles dans le flux d'entrée
- `mark()` - marque la position dans le flux d'entrée jusqu'à laquelle les données ont été lues
- `close()` - Ferme le flux d'entré

### OutputStream

La classe OutputStream du package java.io est une superclasse abstraite qui représente un flux de sortie d'octets.

Afin d'utiliser les fonctionnalités de OutputStream, nous pouvons utiliser ses sous-classes. Certains d'entre eux sont:

- [FileOutputStream](https://docs.oracle.com/javase/7/docs/api/java/io/FileOutputStream.html)
- [ByteArrayOutputStream](https://docs.oracle.com/javase/7/docs/api/java/io/ByteArrayOutputStream.html)
- [ObjectOutputStream](https://docs.oracle.com/javase/7/docs/api/java/io/ObjectOutputStream.html)

<p align=center>
  <img src="https://cdn.programiz.com/sites/tutorial2program/files/java%20outputstream-subclasses.png" height=auto width=600> <br>
  <b>Figure 5.2</b> Sous-classes de OutputStream
</p>

#### Methods of OutputStream

La classe InputStream fournit différentes méthodes qui sont implémentées par ses sous-classes. Voici quelques-unes des méthodes couramment utilisées:

- `write()` - écrit l'octet spécifié dans le flux de sortie
- `write(byte[] array)` - écrit les octets du tableau spécifié dans le flux de sortie
- `flush()` - force à écrire toutes les données présentes dans le flux de sortie vers la destination
- `close()` - Ferme le flux de sortie

### Sockets

Une socket est un point d'extrémité d'une liaison de communication bidirectionnelle entre deux programmes exécutés sur le réseau. Le package java.net fournit deux classes - Socket et ServerSocket - qui implémentent respectivement le côté client de la connexion et le côté serveur de la connexion.

<p align=center>
  <img src="https://static.javatpoint.com/core/images/socket-programming.png" height=auto width=600> <br>
  <b>Figure 5.3</b> Socket
</p>

- Côté serveur (server-side):

La classe `ServerSocket` est utilisée côté serveur : elle attend simplement les appels du ou des clients. C'est un objet du type Socket qui prend en charge la transmission des données.

Cette classe représente la partie serveur du socket. Un objet de cette classe est associé à un port sur lequel il va attendre les connexions d'un client. Généralement, à l'arrivée d'une demande de connexion, un thread est lancé pour assurer le dialogue avec le client sans bloquer les connexions des autres clients.

Le mise en oeuvre de la classe ServerSocket suit toujours la même logique :

- créer une instance de la classe ServerSocket en précisant le port en paramètre
- définir une boucle sans fin contenant les actions ci-dessous
- appelle de la méthode accept() qui renvoie une socket lors d'une nouvelle connexion
- obtenir un flux en entrée et en sortie à partir de la socket
- écrire les traitements à réaliser

Exemple de `ServerSocket`

```java
import java.io.* ;
import java.net.* ;
public class Serveur {

  public static void main (String args[]) throws IOException {

    int port=1000;
    ServerSocket sersoc = new ServerSocket (port) ;
    System.out.println ("serveur active sur port " + port) ;
    while (true){
      Socket soc = sersoc.accept();
      InputStream flux = soc.getInputStream ();
      BufferedReader entree = new BufferedReader (new InputStreamReader (flux)) ;
      String message = entree.readLine() ;
      System.out.println("message reçu sur le serveur = " + message);

    }
  }
}
```

- Côté client (client-side):

Les sockets implémentent le protocole TCP (Transmission Control Protocol). La classe `Socket` contient les méthodes de création des flux d'entrée et de sortie correspondants. Les sockets constituent la base des communications par le réseau.

Comme les flux Java sont transformés en format TCP/IP, il est possible de communiquer avec l'ensemble des ordinateurs qui utilisent ce même protocole. La seule condition importante au niveau du système d'exploitation est qu'il soit capable de gérer ce protocole.

Cette classe encapsule la connexion à une machine distante par le réseau. Elle gère la connexion, l'envoi de données, la réception de données et la déconnexion.

Le mise en oeuvre de la classe Socket suit toujours la même logique :

- créer une instance de la classe Socket en précisant la machine et le port en paramètres
- obtenir un flux en entrée et/ou en sortie
- écrire les traitements à réaliser

Exemple de `Socket`

```java
import java.net.* ;
import java.io.* ;
public class Client{

  public static void main (String args[]) throws IOException{

    String hote = "127.0.0.1" ;
    int port = 1000 ;
    Socket soc = new Socket (hote, port) ;
    OutputStream flux = soc.getOutputStream() ;
    OutputStreamWriter sortie = new OutputStreamWriter (flux) ;
    sortie.write("message envoye au serveur\n") ;
    sortie.flush(); // pour forcer l'envoi de la ligne

  }
}
```

- [Java Sockets Docs](https://docs.oracle.com/javase/tutorial/networking/sockets/index.html)

## Les Threads
