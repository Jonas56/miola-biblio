# JAVA - MIOLA

## Ressources

- [Head First Java](https://www.amazon.com/Head-First-Java-Kathy-Sierra/dp/0596009208)
- [Cours Prof T.RACHAD]()

## Table of contents

1. [Ecosystème Java]()
2. [POO concept de base](#introduction)
   1. [Classes et Objets]()
   2. [Héritage]()
   3. [Packages]()
   4. [Classes abstraites et interfaces]()
3. [Les exceptions]()
4. [Collections](#paragraph1)
5. [Géniricité]()
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
