# Java

## Ressources

- [Java SE documentation](https://docs.oracle.com/javase/8/docs/index.html)
- [Développons en Java](https://www.jmdoudoux.fr/java/dej/index.htm)
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
- [Accès aux Bases de Données](#accès-aux-bases-de-données)
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

- Un thread est une unité d'exécution faisant partie d'un programme. Cette unité fonctionne de façon autonome et parallèlement à d'autres threads. Le principal avantage des threads est de pouvoir répartir différents traitements d'un même programme en plusieurs unités distinctes pour permettre leurs exécutions "simultanées".

<p align=center style="background: white;">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Multithreaded_process.svg/1200px-Multithreaded_process.svg.png" width=500>
</p>

- Sur une machine monoprocesseur, c'est le système d'exploitation qui alloue du temps d'utilisation du CPU pour accomplir les traitements de chaque threads, donnant ainsi l'impression que ces traitements sont réalisés en parallèle.

- Sur une machine multiprocesseur, le système d'exploitation peut répartir l'exécution sur plusieurs coeurs, ce qui peut effectivement permettre de réaliser des traitements en parallèle.

- Selon le système d'exploitation et l'implémentation de la JVM, les threads peuvent être gérés de deux manières :
  - correspondre à un thread natif du système
  - correspondre à un thread géré par la machine virtuelle

Dans les deux cas, cela n'a pas d'impact sur le code qui reste le même.

- La JVM crée elle-même pour ses propres besoins plusieurs threads : le thread d'exécution de l'application, un ou plusieurs threads pour le ramasse-miettes (Garbage collection), ...

<p align=center>
  <img src="https://www.baeldung.com/wp-content/uploads/2020/12/OS-Thread-and-Process.jpg" width=500>
</p>

- La classe `java.lang.Thread` et l'interface `java.lang.Runnable` sont les bases pour le développement des threads en java.

- Le système d'exploitation va devoir répartir du temps de traitement pour chaque thread sur le ou les CPU de la machine. Plus il y a de threads, plus le système va devoir switcher. De plus, un thread requiert des ressources pour s'exécuter notamment un espace mémoire nommé pile. Il est donc nécessaire de contrôler le nombre de threads qui sont lancés dans une même JVM.

### Interface Runnable

- Cette interface doit être implémentée par toute classe qui contiendra des traitements à exécuter dans un thread.

- Cette interface ne définit qu'une seule méthode : void run().

- Dans les classes qui implémentent cette interface, la méthode run() doit être redéfinie pour contenir le code des traitements qui seront exécutés dans le thread.

```java
import java.io.*;
import java.lang.*;

public class MonTraitement implements Runnable {
  public void run() {
    int i = 0;
    for (i = 0; i > 10; i++) {
      System.out.println("" + i);
    }
  }
}
```

### Classe Thread

- La classe Thread est définie dans le package java.lang. Elle implémente l'interface Runnable.

- Elle possède plusieurs constructeurs : un constructeur par défaut et plusieurs autres qui peuvent avoir un ou plusieurs des paramètres suivants :

  - le nom du thread
  - l'objet qui implémente l'interface Runnable l'objet contenant les traitements du thread
  - le groupe auquel sera rattaché le thread

- Un thread possède une priorité et un nom. Si aucun nom particulier n'est donné dans le constructeur du thread, un nom par défaut composé du préfixe "Thread-" suivi d'un numéro séquentiel incrémenté automatiquement lui est attribué.

### Le cycle de vie d'un thread

Un thread, encapsulé dans une instance de type classe Thread, suit un cycle de vie qui peut prendre différents états.

Le statut du thread est encapsulé dans l'énumération `Thread.State`

| Valeur        | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| NEW           | Le thread n'est pas encore démarré. Aucune ressource système ne lui est encore affectée. Seules les méthodes de changement de statut du thread `start()` et `stop()` peuvent être invoquées                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| RUNNABLE      | Le thread est en cours d'exécution : sa méthode `start()` a été invoquée                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| BLOCKED       | Le thread est en attente de l'obtention d'un moniteur qui est déjà détenu par un autre thread                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| WAITING       | Le thread est en attente d'une action d'un autre thread ou que la durée précisée en paramètre de la méthode `sleep()` soit atteinte.<br><br>Chaque situation d'attente ne possède qu'une seule condition pour retourner au statut Runnable :<br>- si la méthode `sleep()` a été invoquée alors le thread ne retournera à l'état Runnable que lorsque le délai précisé en paramètre de la méthode a été atteint<br>- si la méthode `suspend()` a été invoquée alors le thread ne retournera à l'état Runnable que lorsque la méthode resume sera invoquée<br>- si la méthode `wait()` d'un objet a été invoquée alors le thread ne retournera à l'état Runnable que lorsque la méthode `notify()` ou `notifyAll()` de l'objet sera invoquée<br>- si le thread est en attente à cause d'un accès I/O alors le thread ne retournera à l'état Runnable que lorsque cet accès sera terminé |
| TIMED_WAITING | Le thread est en attente pendent un certain temps d'une action d'un autre thread. Le thread retournera à l'état Runnable lorsque cette action survient ou lorsque le délai d'attente est atteint                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| TERMINATED    | Le thread a terminé son exécution. La fin d'un thread peut survenir de deux manières :<br>- la fin des traitements est atteinte<br>- une exception est levée durant l'exécution de ses traitements                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

<p align=center>
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/threadLifeCycle.jpg" width=500>
</p>

- Le statut du thread correspond à celui géré par la JVM : il ne correspond pas au statut du thread sous-jacent dans le système d'exploitation.

- Une fois lancé, plusieurs actions peuvent suspendre l'exécution d'un thread :

  - invocation de la méthode` sleep()`, join() ou suspend()
  - attente de la fin d'une opération de type I/O

- L'invocation de certaines méthodes de la classe Thread peut lever une exception de type IllegalThreadStateException si cette invocation n'est pas permise à cause de l'état courant du thread.

### La création d'un thread

Il existe plusieurs façons de créer un thread :

- créer une instance d'une classe anonyme de type Thread et implémenter sa méthode `run()`. Il suffit alors d'invoquer sa méthode `start()` pour démarrer le thread
- Exemple :

```java
public class TestThread {

  public static void main(String[] args) {
    Thread t = new Thread() {
      public void run() {
        System.out.println("Mon traitement");
      }
    };
    t.start();
  }
}
```

- créer une classe fille qui hérite de la classe Thread. Il suffit alors de créer une instance de la classe fille et d'invoquer sa méthode `start()` pour démarrer le thread
- Exemple :

```java
public class MonThread extends Thread {

  @Override
  public void run() {
    System.out.println("Mon traitement");
  }
}

public class TestThread {

  public static void main(String[] args) {
    MonThread t = new MonThread();
    t.start();
 }
}

```

- créer une classe qui implémente l'interface Runnable. Pour lancer l'exécution, il faut créer un nouveau Thread en lui passant en paramètre une instance de la classe et invoquer sa méthode `start()`
- Exemple :

```java
public class MonTraitement implements Runnable {

  @Override
  public void run(){
    System.out.println("Mon traitement");
  }
}

public class TestThread {

  public static void main(String[] args){
    Thread thread = new Thread(new MonTraitement());
    thread.start();
  }
}
```

- à partir de Java 8, il est possible d'utiliser une expression lambda pour définir l'implémentation de l'interface Runnable

Il est préférable d'utiliser l'implémentation de Runnable car :

- elle permet à la classe d'hériter au besoin d'une classe mère
- elle permet une meilleure séparation des rôles
- elle évite des erreurs car il suffit simplement d'implémenter la méthode `run()`

Il ne faut surtout pas invoquer la méthode `run()` d'un thread. Dans ce cas, les traitements seront exécutés dans le thread courant mais ne seront pas exécutés dans un thread dédié.

### L'arrêt d'un thread

Par défaut, l'exécution d'un thread s'arrête pour deux raisons :

- la fin des traitements de la méthode `run()` est atteinte
- une exception est levée durant les traitements de la méthode `run()`

Historiquement la classe Thread possède une méthode `stop()` qui est déclarée **deprecated** depuis Java 1.1 et est conservée pour des raisons de compatibilité mais elle ne doit pas être utilisée car son comportement peut être aléatoire et inattendu.

La méthode `stop()` lève une exception de type ThreadDeath se qui interrompt brutalement les traitements du thread. C'est notamment le cas si un moniteur est posé : celui-ci sera libéré mais l'état des données pourrait être inconsistant.

Pour permettre une interruption des traitements d'un thread, il faut écrire du code qui utilise une boucle tant qu'une condition est remplie : le plus simple est d'utiliser un booléen.

Exemple :

```java
public class MonThread extends Thread {

  private volatile boolean running = true;

  public void arreter() {
    this.running = false;
  }

  @Override
  public void run() {
    while (running) {
      // traitement du thread
      try {
        Thread.sleep(500);
      } catch (InterruptedException ex) {
        ex.printStackTrace();
      }
    }
  }
}
```

Le Java Memory Model permet à un thread de conserver une copie local de ses champs : pour une exécution correcte, il faut utiliser le mot clé volatile sur le booléen pour garantir que l'accès à la valeur se fera de et vers la mémoire.

Une fois un thread terminé, il passe à l'état terminated. Il ne peut plus être relancé sans lever une exception de type IllegalStateException. Pour le relancer, il faut créer une nouvelle instance.

### Threads démons

- Généralement, l'activité d'un objet actif se termine au bout d'un temps fini.
- Ce type de thread s'appelle un thread utilisateur
- Un programme Java ne peut se terminer que quand tous les threads utilisateurs sont eux- mêmes terminés.
- Cependant pour certaines activités il peut être très difficile de trouver une condition d'arrêt.
- Exemple : capteur déclenchant une alarme dès qu'un seuil de tolérance est dépassé : on ne veut pas qu'une activité aussi critique puisse se terminer prématurément par erreur!
- Pour gérer ce genre d'activité, Java introduit la notion de threads **démons**.
- Un thread démon est un thread qui propose un service général en tâche de fond aussi longtemps que le programme tourne, mais il n'est pas l'essence du programme.
- Il ne sert qu’à lancer d’autres threads.
- Un programme se termine lorsqu'il ne reste plus que des threads démons.
- La méthode `main()` est un Thread utilisateur.
- Par défaut, un thread est créé dans la catégorie du thread qui l’a créé.
- Pour rendre un thread Démon, il faut utiliser la méthode `setDaemon(true)` avant d’appeler la méthode `start()`

```java
public class TestThreaddemon {

  public static void main(String[] args) {
    Thread daemonThread = new Thread(new Runnable() {
      @Override
      public void run() {
        try {
          while (true) {
            System.out.println("Execution demon");
          }
        } finally {
          System.out.println("Fin demon");
        }
      }
    }, "Demon");

    daemonThread.setDaemon(true);
    daemonThread.start();
  }
}
```

Le nombre de messages affichés varie de un à quelques uns avant l'arrêt de la JVM. Le message du bloc finally n'est jamais affiché.

### Suspendre un Thread

La méthode static `sleep()` de la classe Thread permet de mettre en sommeil le thread courant pour le délai en millisecondes dont la valeur est fournie en paramètre.

Elle est bloquante, elle lève une exception de type `InterruptedException` au cours de son exécution si un autre thread demande l'interruption de l'exécution du thread.

```java
try {
  Thread.sleep(5000);
} catch (InterruptedException e) {
  e.printStackTrace();
}
```

La méthode ` sleep()` est static : elle ne s'applique que sur le thread courant et il n'est pas possible de désigner le thread concerné.

Une surcharge de la méthode ` sleep()` attend en paramètre la durée en millisecondes et une durée supplémentaire en nanosecondes qui peut varier entre 0 et 999999. La précision de cette attente supplémentaire est dépendante de la machine et du système d'exploitation.

Contrairement à la méthode `wait()` de la classe Object, la méthode `sleep()` ne libère pas les verrous qui sont posés par le thread.

### L'attente de la fin de l'exécution d'un thread

La méthode `join()` de la classe Thread permet d'attendre la fin de l'exécution du thread. Elle peut lever une exception de type `InterruptedException`.

Une surcharge de la méthode `join()` attend en paramètre un entier long qui définit la valeur en millisecondes d'un délai d'attente maximum.

### La modification de la priorité d'un thread

Un thread possède une propriété qui précise sa priorité d'exécution. Pour déterminer ou modifier la priorité d'un thread, la classe `Thread` contient les méthodes suivantes:

| Méthode                  | Description                                 |
| ------------------------ | ------------------------------------------- |
| `int getPriorty() `      | retourner la priorité d'exécution du thread |
| `int setPriority(int i)` | modifier la priorité d'exécution du thread  |

Généralement, la priorité varie de 1 à 10 mais cela dépend de l'implémentation de la JVM. Plusieurs constantes permettent de connaître les valeurs de la plage de priorités utilisables et la valeur de la priorité par défaut :

- `Thread.MAX_PRIORITY` : la valeur de la priorité maximale
- `Thread.MIN_PRIORITY` : la valeur de la priorité minimale
- `Thread.NORM_PRIORITY` : la valeur de la priorité normale

La valeur par défaut de la priorité lors de la création d'un nouveau thread est celle du thread courant.

La méthode `setPriority()` lève une exception de type `IllegalStateException` si la valeur fournie en paramètre n'est pas incluse dans la plage `Thread.MIN_PRIORITY` et `Thread.MAX_PRIORITY`.

```java
Thread thread = new Thread();
thread.setPriority(Thread.MAX_PRIORITY);
```

### Laisser aux autres threads plus de chance de s'exécuter

La méthode static `yield()` de la classe Thread tente de mettre en pause le thread courant pour laisser une chance aux autres threads de s'exécuter.

Attention : il n'y a aucune garantie sur le résultat de l'invocation de la méthode `yield()` car elle est dépendante de l'implémentation de la JVM.

### Synchronisation

- L’avantage des threads sur les processus est qu’ils appartiennent à un même programme

- On peut donc être confronté à deux types de problèmes :

  - Des fois, ils ont besoin d’accéder à un même objet.
  - Des fois encore un thread doit attendre le résultat d’un autre thread qui n’as pas encore fini.

- Pour régler le premier problème on utilise des méthodes synchronisées ou parfois juste des blocs synchronisés

- Pour régler le deuxième problème, on utilise des mécanisme d’attente et de notification.

- Soit deux threads répétant indéfiniment les actions suivantes:

  - Incrémentation d’un nombre et calcul de son carré (premier thread)
  - Affichage du nombre et de son carré (deuxième thread)

- Si le premier thread est interrompu entre l’incrémentation et le calcul du carré, le second risque d’afficher le nouveau nombre et l’ancien carré.

- Solution **java** : déclarer une méthode avec le mot clé synchronized.

- A un instant donné, une seule méthode d’un objet donnée peut être appelée.

```java
class Nombres{

  private int n=0, carre ;

  /* les méthodes calcul et affiche sont mutuellement
  exclusives */

  public synchronized void calcul(){
    n++ ;
    carre = n*n ;
  }
  public synchronized void affiche (){
    System.out.println (n + " a pour carre " + carre) ;
  }
}


class ThrCalc extends Thread{
  // Classe Thread calculé
  private Nombres nomb ;
  public ThrCalc (Nombres nomb) { this.nomb = nomb ;}

  public void run () {
    try{
    while (!interrupted()) {
      nomb.calcul () ;
      sleep (50) ;
    }
    }
    catch (InterruptedException e) {}
  }
}

class ThrAff extends Thread {
  // Classe Thread affiché

  private Nombres nomb ;

  public ThrAff (Nombres nomb){
    this.nomb = nomb ;
  }

  public void run () {
    try {
    while (!interrupted()) { nomb.affiche() ; sleep (75) ; }
    }
    catch (InterruptedException e) {}
  }
}

public class Synchro1{
  public static void main (String args[])
  {
    Scanner s= new Scanner(System.in);
    Nombres nomb = new Nombres() ;
    Thread calc = new ThrCalc (nomb) ;
    Thread aff = new ThrAff (nomb) ;
    System.out.println ("Suite de carres - tapez retour pour
    arreter") ;
    calc.start() ; aff.start() ;
    s.next() ;
    calc.interrupt() ; aff.interrupt();
  }
}
```

- Lorsqu’une méthode synchronisée est appelée sur un objet, un verrou lui est attribué sur l’objet de telle façon qu’aucune autre méthode synchronisée ne peut être appelée.
- L’objet est déverrouillé à la sortie de la méthode.
- Si une méthode synchronisée appelle une autre méthode non synchronisée, l’objet se trouve déverrouillé pendant cet appel.

### Interblocage

- Il arrive que deux ou plusieurs threads s’interbloquent mutuellement.
- Exemple de situation d’interblocage :
  - Un thread T1 possède le verrou d’un objet O1 et attend le verrou d’un autre objet O2
  - Un thread T2 possède le verrou d’un objet O2 et attend le verrou d’un autre objet O1
- Cette situation s’appelle **étreinte mortelle**
- Pour sortir d’une telle situation il faut coordonner l’exécution des threads.
- En effet, une méthode synchronisée peut appeler la méthode `wait()` de l’objet dont elle possède le verrou permettant de :
  - Rendre le verrou à l’environnement (qui peut l’attribuer à une autre méthode synchronisée)
  - Mettre en attente le thread correspondant.

### L’attente et la notification

- Plusieurs threads peuvent être en attente sur le même objet.
- Tant qu’un thread est en attente l’environnement ne lui donne pas la main.
- La méthode `notifyAll()` prévient tous les threads en attente sur un objet et leur donne la possibilité de s’exécuter.
- La méthode `notify()` prévient un seul thread.

[Lien utile](https://www.youtube.com/playlist?list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4)

## Accès aux Bases de Données
