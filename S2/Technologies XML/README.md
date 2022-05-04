# Technologies XML

## Table of contents

- [Introduction XML](#introduction-xml)
- [Document Type Definition (DTD)](#document-type-definition)
- [XML Schema Definition (XSD)](#xml-schema-definition)
- [XSLT (eXtensible Stylesheet Language Transformation)](#xslt-extensible-stylesheet-language-transformation)

## Introduction XML

<p align=center>
	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Extensible_Markup_Language_%28XML%29_logo.svg/1200px-Extensible_Markup_Language_%28XML%29_logo.svg.png">
</p>

- Naissance de XML (1997)
- XML :

  - XML est un méta-langage universel pour le Web
  - Idéal pour l'échange de données documentées
  - XML ne décrit que du contenu pur, pour la présentation, il faux utiliser d’autres technologies comme XSL

- XML - e**X**tensible **M**arkup **L**anguage

  - e**X**tensible : une infinité de balises
  - **M**arkup : identifier les différents éléments d’un document au moyen de balises
  - **L**anguage : respecter un certain nombre de règles

- Permet de décrire les informations de façon à :
  _les documenter, les transformer et les transmettre_

- **XML** **S**chema **D**efinition (**XSD**) est un langage de description de format de document XML.
- **Extensible** **S**tyle **L**anguage (**XSL**) - décrit comment les documents XML peuvent être présentés sur différents périphériques d'affichage
- **F**riend **O**f **A** **F**riend (**FOAF**)

- Les données échangées sont en format XML :

  - **SOAP** (**S**imple **O**bject **A**ccess **P**rotocol) pour l'échange de messages,
  - **WSDL** (**W**eb **S**ervice **D**escription **L**anguage) pour la description des services web,
  - **UDDI** (**U**niversal **D**escription **D**iscovery and **I**ntegration) annuaires de référence.

- Composantes d’un document XML :
  - Prologue: Une déclaration d’un document XML
  - Instructions de traitements: fournissent de l’information à une application XML
    - _Insérer des informations non destinées à un processeur XML dans un document XML_
    - _Une IT peut apparaître n’importe où dans le document XML_
  - Définition optionnelle de type de document
  - Références aux entités
  - Différents éléments du document
  - Commentaires
  - **A part le prologue, tous les autres constituants sont facultatifs.**

<p align=center>
	<img src="https://i.postimg.cc/mZY9bNYQ/Composant-document-XML.png" alt="Composant-document-XML.png">
</p>

- _Les balises XML sont sensibles à la casse, Contrairement à HTML_

### Les 8 règles syntaxiques du langage XML

- Un document bien formé respecte les règles syntaxiques du langage XML :
  - R1 : le document doit commencer par une déclaration XML (Entete ou prologue)
  - R2 : un élément principal doit enfermer tous les autres
  - R3 (Capitalisation): attention à la capitalisation des noms et des attributs
  - R4 : les balises non vides doivent être appariées
  - R5 : les éléments ne doivent pas se chevaucher
  - R6 : les balises vides doivent être fermées
  - R7 (Les attributs): les valeurs des attributs doivent être quottées " "
  - R8 : ne pas utiliser les caractères < et & seuls

## Document Type Definition

- Document bien formé _(Well Formed document)_ :
  - Respecte les règles syntaxiques du langage XML
  - Parsable et manipulable
  - Pas nécessairement valide par rapport à la DTD
- Document valide (_Valid document)_ :

  - Bien formé
  - Conforme à une DTD ou à un schéma

- Les DTD définissent la grammaire (schéma) des document XML
- Dans une DTD, tout ce qui n’est pas expressément autorisé est interdit
- DTD externe: Modèle pour plusieurs documents. Partage de structures

- DTD interne :

```xml
	<!DOCTYPE parc-machine [
	<!– declarations -- >
	]>
```

- DTD externe :

  - DTD Privée

  ```xml
  <!DOCTYPE ElementRacine SYSTEM "URL_DTD">
  ```

  - DTD publique

  ```xml
  <!DOCTYPE ElementRacine PUBLIC "URL_DTD">
  ```

- DTD élément :

  - Elément Simple

  ```xml
  <!ELEMENT livre (titre, isbn)>
  ```

  - Séquence

  ```xml
  <!ELEMENT auteur (nom, prenom, rue, ville)>
  ```

  - Liste de choix

  ```xml
  <!ELEMENT véhicule (voiture | camion)>
  ```

- Elément optionnel (0, 1)

  ```xml
  	<!ELEMENT villa (piscine?)>
  ```

- Elément répétitif (0,N)
  ```xml
  <!ELEMENT voiture (accident*)>
  ```
- Elément répétitif (1,N)
  ```xml
  <!ELEMENT livre (auteur+)>
  ```

### Types de données

1. (#PCDATA) **P**arsed **C**haracter **D**ata : L'élément doit contenir une chaîne de caractères.
2. **Contenu mixte** : Peut contenir à la fois des caractères et d’autres éléments
3. **ANY** : L'élément peut contenir tout type de données
4. **EMPTY** : L'élément ne contient pas de données spécifiques

- _EXEMPLES_ :

<p align=center>
	<img src="https://i.postimg.cc/43cdWswz/Exemples-Des-Types-De-Donnees-XML.png" alt="ExemplesDesTypesDeDonnees_XML.png">
</p>

### Types d’attributs

- Permet de définir la liste d’attributs pour une balise

```xml
	<!ATTLIST tag attribut type [#mode] [valeur]>
```

1. **CDATA** : Données textuelles
2. **NMTOKEN** : Un nom XML valide
3. **NMTOKENS** : Plusieurs noms XML valides séparés par des espaces
4. **ID** : Un identificateur unique d’un élément.
5. **(val1|val2|…)** : Une liste des valeurs possibles pour l’attribut, chaque valeur doit correspondre à un nom XML valide.
6. **IDREF** Lien : L’attribut peut prendre comme valeur la valeur d’un attribut de type ID d’un élément du document (référence).
7. **IDREFS** : L’attribut peut prendre comme valeur une liste de valeurs d’attributs ID de plusieurs éléments du document.
8. **NOTATION (N1|N2|…)** : L’attribut peut prendre comme valeur le nom d’une notation.

```xml
	<!NOTATION GIF SYSTEM "image/gif" >
	<!ATTLIST CD IMAGE NOTATION GIF #REQUIRED>
```

- Il est possible de donner une valeur par défaut à un attribut

```xml
	<!ATTLIST edition type (papier|electronique) "papier" >
```

1. **#REQUIRED** : l’attribut est toujours présent lorsque l’élément est utilisé (pas de valeur par défaut)
2. **#IMPLIED** : l’attribut correspondant est optionnel. Celui ci ne prendra aucune valeur par défaut
3. **#FIXED** _valeur_ : l’attribut correspondant est optionnel. Cela revient à définir une valeur constante.

- L’ordre des déclarations d’attributs n’a pas d’importance
- Si un même attribut est déclaré plusieurs fois, seule la première est prise en compte.

### Quelques règles d'écriture

- **Modularite** : Définir dans des entités séparées les parties réutilisables
- **Precedence** : Regrouper les déclarations d'entités en tête
- **Abstraction** : Utiliser des entités pour les modèles de contenus
- **Spécificité** : Éviter les DTD trop générales
- **Simplicité** : Découper les DTD trop complexes

### Limites des DTDs

- Une syntaxe non XML
- Outils assez anciens
- Typage très faible
- Pas de Sémantique

### Éléments versus Attributs

- Il est préférable de stocker des données dans les éléments.
- Essayez d'utiliser des éléments pour décrire les données.
- Utilisez les attributs seulement pour fournir des informations qui ne sont pas liés aux données.
- Les métadonnées (données sur les données) doivent être stockées sous forme d'attributs, et que les données elles-mêmes doivent être conservés comme éléments.

## Les Entites & Les Espaces de noms

### Les Entités

- Entités se subdivisent en deux catégories :
  - Analysables : contiennent un texte XML bien formé
  - Non-analysables : contiennent du texte non- XML ou des données binaires.
- Ils sont de deux types :

  - Internes : définies dans l’entité document elle-même.
    - La référence se fait par le préfixe & et en rajoutant à la fin du nom un point-virgule : **&nom;**

  ```xml
  	<!ENTITY email "NOM@mit.ac.ma" >
  ```

  - Externes: elles dépendent d’une source de données externe au d’un autre document dXML.
    - ils sont définies à l’intérieur de la DTD au moyen de la déclaration.
    ```xml
    <!DOCTYPE parc-machine [
    	<!ENTYTY lab01 SYSTEM "http://www.ufr.ma/lab01.xml">
    ]>
    ```
    - Attention entete.
    - Une référence à l’entité lab01 inclut le fichierlab01.xml dans le document principal.
    - La référence : **&lab01;**

- les entités parametres sont des entites definies et utilisees a l'interieur de la DTD (Jamais dans le doument XML)

### Entités paramètres

- Ce sont des entités définies et utilisées à l’intEntités paramètres externesérieur de la DTD (jamais dans le document XML)
- Différence :
  - La référence commence par le signe %
  - La définition commence par % suivi d’un espace et du nom de l’entité
  ```xml
  <!--EXEMPLE-->
  <!ENTITY % text '(#PCDATA)'>
  <!ENTITY % TYPE '(CD|DVD)'>
  ```
  ```xml
  <!--USAGE-->
  <!ELEMENT NOM %text;>
  <!ATTLIST disque genre %TYPE; #REQUIRED>
  ```

#### Entités paramètres externes

- Le but : permettre la construction de DTD complexes par la mise en commun de plusieurs DTD.
- Pour relier entre 2 DTDs, la syntaxe est la suivante :

```xml
	<!ENTITY % nom SYSTEM "URI" %nom;> <!-- DTD Privee-->
	<!ENTITY % nom PUBLIC "URI" %nom;> <!-- DTD Publique -->
```

### Espaces de noms

- Dans le cas de XML, il s'agit de désigner (ou d'identifier) les noms d'éléments et d'attributs XML dans le contexte d'un document XML.
- Les espaces de nommage XML offrent une méthode pour éviter les conflits entre les noms des éléments XML.
- Il ne s'agit pas d'identifier un "type de document" au moyen d'une déclaration placée en début de document mais d'identifier, élément par élément et attribut par attribut, le vocabulaire auquel il appartient.
- Quand on utilise un préfixe XML, nommé aussi un espace de noms, il doit être défini.
- L'espace de nom est défini par l'attribut **xmlns** _(XML **N**ame**S**pace)_ de la balise de début d'un élément.
- La déclaration d'espace de noms a la syntaxe suivante :

```xml
	xmlns: prefixe = "URI" <!-- SYNTAXE-->

	<h:table xmlns:h="http://www.w3.org/TR/html4/"> <!-- EXEMPLE -->
	<m:table xmlns:m="http://www.promotion.ma/tables">
```

- Les espaces de noms peuvent être déclarées dans les éléments pour lesquels ils sont utilisés ou dans l'élément racine XML .

```xml
	<root xmlns: h = "http://www.w3.org/TR/html4/" xmlns: m = "http://www.promotion.ma/tables">
```

- _L'utilisation d'une URL pour identifier un espace de noms est équivalent à l'utilisation d'une adresse email pour identifier une personne._
- _Souvent, les entreprises utilisent l'espace de nom comme un pointeur vers une page Web contenant des informations d'espace._
- Deux éléments ayant le même nom et des espaces de noms différents sont considérés comme des éléments totalement différents (deux "Ahmed" ayant
  des noms de famille différents).

### Les espaces de nommage par défaut

- Un espace de noms par défaut est un espace qui pourra être utilisé dans tous les éléments fils.
- Pas de préfixe
- Sa syntaxe est la suivante : **xmlns="namespaceURI"**

### Imbrication

- Certaines applications utilisent plusieurs espaces denoms de manière très imbriquée, ce qui rendrait trèsverbeuse l'utilisation des espaces de noms par défaut.
- Contrairement à ce que l'on pourrait penser, **l'espace de noms par défaut ne s'applique pas au attributs** et la plupart des attributs n'ont tout simplement pas
  d'espace de noms!
- L’espace de noms d’un attribut est son élément.
- _(La raison est que l'on considère que les attributs décrivent des propriétés de l'élément dans lequel ils sont placés et qu'ils n'ont pas besoin d'appartenir à un espace de noms pour y être rattachés, Au contraire lorsque on veut inclure dans un élément un attribut "étranger" appartenant à un autre espace de noms.)_

### Espaces de noms : Résumé

- Problème: des noms d’éléments ou des noms d’attributs identiques ⇒ ambiguïtés
- Les espaces de noms (namespaces) permettent :
  - De mélanger du vocabulaire XML provenant de plusieurs grammaires
  - D’identifier de manière unique les balises XML
  - Recommandation : "www.w3.org/TR/REC-xmlnames"

## XML Schema Definition

- Un Schéma XML est une solution alternative de DTD, basée sur XML
  - Il décrit la structure d'un document XML.
  - Le but est de définir la constitution d'un document XML, comme une DTD
- Les schémas XML sont les successeurs des DTD
- Extension .xsd
- Les schémas XML :

  - Plus riches et plus performants que les DTD.
  - Ecrits en syntaxe XML.
  - Supporte les types de données.
  - Supporte les espaces de noms.
  - Facilement extensibles à des ajouts futurs.

- Le schéma XML définit :
  - Les éléments et les attributs qui peuvent apparaître dans un document XML.
  - Les éléments fils de chaque élément XML, leurs nombre ainsi que leurs ordre.
  - Les attributs de chaque élément XML.
  - Les types de données pour les éléments et attributs.
  - Les valeurs fixes/par défaut pour les éléments et attributs.
  - Le nombre d’occurrences de chaque élément.
  - ...

### XSD Comment ?

- L'élément \<schema> est l'élément racine de tout schéma XML.
  ```xml
  <?xml version="1.0"?>
  	<xs:schema>
  	...
  	</xs:schema>
  ```
- L'élément \<schema> doit contenir certains attributs, il se définit comme :
  ```xml
  <xs:schema
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  targetNameSpace="http://www.w3.com"
  xmlns="http://www.w3.com"
  elementFormDefault="qualified">
  ...
  </xs:schema>
  ```
  - `xmlns: xs = "http://www.w3.org/2001/XMLSchema"`, In Indique que les éléments et les types de données utilisés dans le schéma proviennent de l'espace de noms "http://www.w3.org/2001/XMLSchema".
  - `xmlns = "http://www.w3.com"` La déclaration d’un espace de noms par défaut.
  - `elementFormDefault="qualified"` Tous les éléments utilisés par une instance de document XML doivent être définis dans un espace noms.
- L’attribut `schemaLocation` indique l'emplacement du schéma XML.

### Les Elements Simples

- Un élément simple est un élément contenant seulement du texte.
- Il ne peut pas contenir d'autres éléments ou des attributs.
- Un texte peut être :
  - De différent types _(Booléen, chaine de caractères, date, entier, etc...)_, ou de type personnalisé.
- Vous pouvez aussi :
  - rajouter des restrictions (facets) à un type de données pour limiter son contenu
  - préciser un modèle pour les données (pattern).
- La syntaxe pour définir un élément simple :

```xml
	<xs:element name="xxx" type="yyy"/>
```

- XML Schema définit plusieurs types de données, les plus utilisés sont :

  - `xs:string`
  - `xs:decimal`
  - `xs:integer`
  - `xs:boolean`
  - `xs:date`
  - `xs:time

- **Exemple** :

<p align=center>
	<img src="https://i.postimg.cc/sD0gyvNY/Exemple-Element-Simple-XSD.png" alt="Exemple_ElementSimple_XSD.png">
</p>

- Les éléments simples peuvent avoir des valeurs par défaut ou des valeurs fixes.
- Une valeur par défaut est automatiquement assigner à un élément lorsqu'aucune autre valeur ni précisée.
  - Dans l'exemple suivant le taux TVA a valeur par défaut est "0.2" :
  ```xml
  <xs:element name="TTVA" type="xs:decimal" default="0.2"/>
  ```

````
* Une valeur fixe peut aussi être attribuer à un élément et ne peut pas être modifier.
	* Dans l'exemple suivant, le profil par défaut est "simple" :
	``` xml
	<xs:element name="profil" type="xs:string" fixed="simple"/>
````

### Les attributs XSD

- Tous les attributs sont déclarés de type simple.
- La syntaxe pour définir un attribut : `<xs:attribute name="xxx" type="yyy"/>`
- Les types les plus utilisées sont les memes que les éléments.
- Un élément simple ne peut pas avoir des attributs.
- Si un élément a des attributs, il est considéré comme un élément complexe.
- **Attributs optionnels/obligatoires** :
  - Les attributs sont optionnels par défaut, pour préciser qu’un attribut est obligatoire, on utilise l'attribut "use" :
  ```xml
  <xs:attribute name="lang" type="xs:language" use="required"/>
  ```

### Les Restrictions/Facets

- En XML Schemas, vous pouvez rajouter vos propres restrictions sur les éléments et les attributs (**facets**).

#### Restrictions sur des valeurs

1. L'exemple suivant définit un élément "age" avec restriction.
   - La valeur de l'age ne peut pas être inférieure à 0 ou supérieure à 120 :
   ```xml
   	<xs:element name="age">
   		<xs:simpleType>
   			<xs:restriction base="xs:integer">
   				<xs:minInclusive value="0"/>
   				<xs:macInclusive value="120"/>
   			</xs:restriction>
   		</xs:simpleType>
   	</xs:element>
   ```

- Pour limiter le contenu d'un élément XML à un ensemble de valeurs, on utilise les énumérations.

2. L'exemple suivant définit un élément "voiture" avec restriction.

   ```xml
   <xs:element name="MarqueVoiture">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:enumeration value="Toyota"/>
   			<xs:enumeration value="Mercedes"/>
   			<xs:enumeration value="Koenigsegg"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>

   <!--Il peut aussi être définit de la façon suivante -->

   <xs:simpleType name="MarqueVoiture">
   	<xs:restriction base="xs:string">
   		<xs:enumeration value="Toyota"/>
   		<xs:enumeration value="Mercedes"/>
   		<xs:enumeration value="Koenigsegg"/>
   	</xs:restriction>
   </xs:simpleType>

   <xs:element name="voiture" type="MarqueVoiture"/>
   ```

#### Restrictions sur un modèle

- Pour limiter le contenu d'un élément XML d'une série de nombres ou de lettres, nous pouvons utiliser les modèles (patterns)

1. L'exemple suivant définit un élément _"lettre"_ avec restriction.

   - Les valeurs autorisées sont seulement les lettres minuscules de **a** à **z**:

   ```xml
   <xs:element name="lettre">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="[a-z]"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

2. L'exemple suivant définit un élément nommé _"initials"_ avec restriction.

   - Les valeurs autorisées sont seulement ceux composées de trois lettres majuscules de **A** à **Z** :

   ```xml
   <xs:element name="initils">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="[A-Z][A-Z][A-Z]"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

   - Les valeurs autorisées sont seulement ceux composées de trois lettres minuscules ou majuscules de **a** à **z** et de **A** à **Z** :

   ```xml
   <xs:element name="initils">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="[a-zA-Z][a-zA-Z][a-zA-Z]"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

3. L'exemple suivant définit un élément nommé _"voyelle"_ avec restriction.

   - Les valeurs autorisées sont seulement une des six lettres **a, e, i, o, u** ou **y** :

   ```xml
   <xs:element name="voyelle">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="[aeiouy]"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

4. L'exemple suivant définit un élément nommé _"idprod"_ avec restriction.
   - Les valeurs autorisées sont seulement ceux composées d’une lettre en majuscule suivie de **trois chiffres** entre **0** et **9** :
   ```xml
   <xs:element name="idprod">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="[A-Z][0-9][0-9][0-9]"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

#### Restrictions à une série de valeurs

1. L'exemple suivant définit un élément nommé _"mot"_ avec restriction.

   - Les valeurs autorisées sont zéro ou plusieurs occurrences de lettres minuscules de **a** à **z** :

   ```xml
   <xs:element name="mot">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="([a-z])*"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

2. L'exemple suivant définit aussi un élément nommé _"letter"_ avec restriction.

   - Les valeurs autorisées sont un ou plusieurs paires de lettres.
   - Chaque paire commence par une lettre minuscule suivi d'une lettre majuscule.
   - Par exemple, "sToP" est valide par ce pattern, mais non "Stop" ou "STOP" ou "stop":

   ```xml
   <xs:element name="lettre">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="([a-z][A-Z])+"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

3. L'exemple suivant définit un élément nommé _"sexe"_ avec restriction.

   - Les valeurs autorisées sont seulement male ou female :

   ```xml
   <xs:element name="sexe">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="male|female"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

4. L'exemple suivant définit un élément nommé _"telephone"_ avec restriction.
   - Les valeurs autorisées sont celles composées exactement de dix chiffres.
   ```xml
   <xs:element name="telephone">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:pattern value="0(5|6|7)[0-9]{8}"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

#### Restrictions en longueur

- Pour limiter la longeur de la valeur d'un élément, nous devons utiliser les contraintes **maxLength**, **minLength** ou **length**.

1. L'exemple suivant définit un élément nommé _"CodePIN"_ avec restriction.

   - La valeur doit être exactement de quatre caractères :

   ```xml
   <xs:element name="CodePin">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:length value="4"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

2. Cet exemple définit un autre élément nommé _"password"_ avec restriction.
   - La valeur doit être au **minimum de cinq** caractères et au **maximum de huit** caractères :
   ```xml
   <xs:element name="password">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:minLength value="5"/>
   			<xs:maxLength value="8"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

#### Restrictions sur les caractères d'espacement

- Pour mettre des restrictions sur les caractères d'espacement, on utilise la contrainte **whiteSpace**.

1. Cet exemple définit un élément nommé _"adresse"_ avec restriction.

   - La contrainte whiteSpace permet de préserver les espaces **"preserve",** le processeur XML ne supprimera aucun caractère d'espacement :

   ```xml
   <xs:element name="adresse">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:whiteSpace value="preserve"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

   - La contrainte whiteSpace permet de remplacer **"replace"**, le processeur XML remplacera tout caractères d'espacement par un espace :

   ```xml
   <xs:element name="adresse">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:whiteSpace value="replace"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

   - La contrainte whiteSpace permet d'éliminer **"collapse"**, le processeur XML remplacera tout caractères d'espacement par un seul espace :

   ```xml
   <xs:element name="adresse">
   	<xs:simpleType>
   		<xs:restriction base="xs:string">
   			<xs:whiteSpace value="collapse"/>
   		</xs:restriction>
   	</xs:simpleType>
   </xs:element>
   ```

### Les Elements Complexes

- Un élément complexe est de quatre types :

  1.  les éléments composés que contiennent des sous-éléments.

  ```xml
  <personne>
  	<nom> Hmido </nom>
  	<prenom> Hamid </prenom>
  </personne>
  ```

  2.  les éléments qui contiennent du texte et des attributs

  ```xml
  <titre lang="FR-fr"> XML: un standard de futur </titre>
  ```

  3.  les éléments mixtes que contiennent du texte et des sous-éléments

  ```xml
  <description>
  	L’informatique est le traitement automatique de	l’information
  	<NB>
  		Informatique est l’acronyme des mots information et automatique
  	</NB>
  	....
  </description>
  ```

  4.  les éléments vides :

  ```xml
  <produit pid="P1345"/>
  ```

_Chacun de ces éléments peut avoir des attributs._

#### Élément composé

1. Methode :

```xml
	<xs:element name="personne">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="nom" type="xs:string"/>
				<xs:element name="prenom" type="xs:string"/>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
```

- Avec cette méthode, seulement l'élément "personne" peut utiliser le type complexe spécifié.
- Les éléments fils : _"nom"_ et _"prenom"_, sont entourés par l'indicateur \<sequence>.
- Les éléments fils doivent figurer dans le même ordre de leur déclaration.

2. Methode :

```xml
	<xs:complexType name="infoPersonne">
		<xs:sequence>
			<xs:element name="nom" type="xs:string"/>
			<xs:element name="prenom" type="xs:string"/>
		</xs:sequence>
	</xs:complexType>

	<xs:element name="personne" type="infoPersonne"/>
```

- Avec cette méthode, plusieurs éléments peuvent référencer le même type complexe.

```xml
	<xs:element name="employe" type="infoPersonne"/>
	<xs:element name="etudiant" type="infoPersonne"/>
	<xs:element name="enfant" type="infoPersonne"/>
```

- Vous pouvez aussi baser un élément complexe sur un élément complexe existant et rajouter les éléments manquants :

```xml
	<xs:complexType name="infoCompletePersonne">
		<xs:complexContent>
			<xs:extension base="infoPersonne">
				<xs:sequence>
					<xs:element name="adresse" type="xs:string"/>
					<xs:element name="ville" type="xs:string"/>
					<xs:element name="pays" type="xs:string"/>
				</xs:sequence>
			</xs:extension>
		</xs:complexContent>
	</xs:complexType>

	<xs:element name="employe" type="infoCompletePersonne"/>
```

#### Élément avec attribut

---

- **Exemple :**

```xml
	<Montant devis="dhs">1700.70</Montant>
```

1. Methode Declaration :

```xml
	<xs:element name="Montant">
		<xs:complexType>
			<xs:simpleContent>
				<xs:extension base="xs:decimal">
					<xs:attribute name="devis" type="xs:string"/>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
	</xs:element>
```

2. Methode Declaration :

```xml
	<xs:complexType name="MontantType">
		<xs:simpleContent>
			<xs:extension base="xs:decimal">
				<xs:attribute name="devis" type="xs:string"/>
			</xs:extension>
		</xs:simpleContent>
	</xs:complexType>

	<xs:element name="Montant" type="MontantType"/>
```

#### Élément mixte

- Un éléments de type mixte peut contenir des attributs, des éléments et du texte.
- Un élément XML "Livraison" qui contient à la fois du texte et d'autres éléments :

```xml
	<Livraison>
	A Mr.<nomClient>Ahmed ZELLOU</nomClient>.
	Votre commande <BCnum>1032</BCnum>
	sera livrée le <datelivraison>2015-07-13</datelivraison>.
	</Livraison>
```

- La définition XSD :

```xml
	<xs:element name="Livraison">
		<xs:complexType mixed="true">
			<xs:sequence>
				<xs:element name="nomClient" type="xs:string"/>
				<xs:element name="BCnum" type="xs:positiveInteger"/>
				<xs:element name="datelivraison" type="xs:date"/>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
```

- Définition avec un type **typeLivraison** :

```xml
	<xs:complexType name="typeLivraison" mixed="true">
		<xs:sequence>
			<xs:element nameClient="nom" type="xs:string"/>
			<xs:element name="BCnum" type="xs:positiveInteger"/>
			<xs:element name="datelivraison" type="xs:date"/>
		</xs:sequence>
	</xs:complexType>

	<xs:element name="Livraison" type="typeLivraison"/>
```

#### Élément Vide

- Un élément vide ne peut pas avoir de contenu, mais il a des attributs. `<produit prodid="1345" />`
- Pour définir un type sans contenu, nous définissons un type sans éléments (seulement des attributs) :

1. Methode :

```xml
	<xs:element name="produit">
		<xs:complexType>
			<xs:attribute name="prodid" type="xs:positiveInteger"/>
		</xs:complexType>
	</xs:element>
```

2. Methode :

```xml
	<xs:complexType name="typeProd">
		<xs:attribute name="prodid" type="xs:positiveInteger"/>
	</xs:complexType>

	<xs:element name="produit" type="typeProd"/>
```

- Permet de donner un nom à ce type et l'utiliser par la suite.

## Les indicateurs

- Permet de contrôler comment les éléments doivent être utilisés dans le document.
- Il y en a sept indicateurs :
  - **Indicateurs d'ordre** : ils sont utilisés pour définir un ordre entre les éléments.
    - sequence
    - all
    - choice
  - **Indicateurs d'occurrence** : ils sont utilisés pour définir la fréquence d'apparition d'un élément.
    - maxOccurs
    - minOccurs
  - **Indicateurs de Groupe** : Ils sont utilisés pour définir des groupes d'éléments.
    - Group
    - attributeGroup

1. Indicateurs d'ordre
   - **Sequence** : Permet d'imposer un ordre spécifique entre les éléments fils
   - **all** : ndique que les éléments fils peuvent apparaître dans n'importe quel ordre
   - **choice** : Permet d'imposer un choix entre une liste d'éléments.
2. Indicateur d'occurence
   - **maxOccurs** : Permet de spécifie le nombre maximal de fois qu'un élément apparait.
   - **minOcuurs** : Permet de spécifie le nombre minimal de fois qu'un élément apparait.
     -> **maxOccurs = "unbounded"** indique qu’un élément peut apparaître un nombre illimité de fois.
3. Indicateur de groupe

   - **Group** : Vous devez définir un élément all, choice, ou sequence à l'intérieur de la déclaration group.
     - Après la définition d'un groupe, vous pouvez le référencer dans d'autres définitions.
   - **attributeGroup** : Les attributs de groupes sont définis par la déclaration attributeGroup

     - Après avoir défini un groupe d'attributs, vous pouvez le référencer dans une autre définition

<p align=center>
	<img src="https://i.postimg.cc/C1Fgbg2M/Indicateur-Attribute-Group.png" alt="Indicateur-Attribute-Group.png">
</p>

#### Les Type de données

#### String

- Une chaîne de caractères peut contenir des caractères, des sauts de ligne, des retours chariot et des caractères de tabulation.
- Type de données **NormalizedString** :
  - contient des caractères
  - e processeur XML va supprimer les sauts de ligne, les retours chariot et les caractères de tabulation.
  - `<xs:element name="customer" type="xs:normalizesString"/>`
- Type de données **Token** :
  _ contient des caractères
  _ le processeur XML va supprimer les sauts de ligne, les retours chariot, les tabulations, espaces de début et de fin, et les espaces multiples.
  -> _Same as normalizedString + espaces de début et de fin, et les espaces multiples._ \* `<xs:element name="customer" type="xs:token"/>`

<p align=center>
	<img src="https://i.postimg.cc/PqMGX75g/Type-De-Donnees-String.png" alt="TypeDeDonnees_String.png">
</p>

- Restrictions sur le type de données **String** :
  - enumeration
  - length
  - maxLength
  - minLength
  - pattern _(**NMTOKENS** et **IDREFS** ne peuvent pas utiliser cette contrainte)_
  - whiteSpace

#### Type de données Numérique

- Type de données **Decimal** \* Le type de données décimal est utilisé pour spécifier une valeur numérique.
  -> _Le nombre maximum de chiffres après la virgule est 18._
- Type de données **Integer** \* Utilisé pour spécifier une valeur numérique entière.

<p align=center>
	<img   src="https://i.postimg.cc/nhvg2WBX/Type-De-Donnees-Decimal.png" alt="TypeDeDonnees_Decimal.png">
</p>

- Restrictions sur le type de données **Numerique** :
  - enumeration
  - fractionDigits
  - maxExclusive
  - maxInclusive
  - minExclusive
  - minInclusive
  - pattern
  - totalDigits

#### Type de données Date et Time

- La date est indiquée sous la forme suivante "**YYYY-MM-DD**".
- Pour spécifier un fuseau horaire, vous pouvez spécifiez un décalage de l'heure UTC en ajoutant une période positive ou négative derrière la date :
  > `<start>2001-05-17+01:00</start>`
- Le temps est spécifié selon la formule **"hh:mm:ss"**
- Meme chose que **"Date"** pour le fuseau horaire.
- Type de données **DateTime** :

  - Permet de spécifier une date et une heure à la fois selon la formule
    **"YYYY-MM-DDThh: mm: ss".**
    > `<startdate> 2002-05-30T09:30:10+06:00 </startdate>`

- Type de données **Duration**
  - Utilisé pour spécifier un intervalle de temps selon la formule **"PnYnMnDTnHnMnS" :**
    - **P** indique la période (requis)
    - **nY** indique le nombre d'années
    - ...
    - **T** indique le début d'une section de temps (nécessaire si vous voulez préciser les heures, minutes ou secondes)
    - **nH** indique le nombre d'heures
    - ...
  - `<period> P5Y2M10D </period>`, indique une période de cinq ans, deux mois et 10 jours
  - Pour indiquer une durée négative, rajoutez un signe moins devant P
  - `<period>-P10D </period>`, indique une période de moins de 10 jours.

<p align=center>
	<img src="https://i.postimg.cc/tJKvtdgd/Type-De-Donnees-Date-Time.png" alt="TypeDeDonnees_DateTime.png">
</p>

- Restrictions sur le type de données date et time :
  - enumeration
  - maxExclusive
  - maxInclusive
  - minExclusive
  - minInclusive
  - pattern

#### Type de données Divers

- Types de données **Divers** : boolean, base64Binary, hexBinary, float, double, anyURI et NOTATION.
- Type de données **Boolean**
  - Permet de spécifier une valeur vraie ou fausse.
  - Les valeurs pour Boolean sont **true (1)** et **false (0)**.
- Type de données **Binary**
  _ sont utilisées pour exprimer des données au format binaire.
  _ Nous avons deux types de données binaires :
  _ **base64Binary** (données binaires en Base64)
  _ **hexBinary** (données binaires en hexadécimal)

  > `<xs:element name="blobsrc" type="xs:hexBinary"/>` >`<blobsrc> 3FDD01B7 \</blobsrc>`

- Type de données **AnyURI** \* utilisé pour spécifier un URI.
  > `<xs:attribute name="src" type="xs:anyURI"/>` > `<PIC src="http://www.ensias.ma/images/smiley.gif" />`

## XSLT (eXtensible Stylesheet Language Transformation)

- Utilise XPath pour naviguer / trouver des informations dans des documents XML
- XSLT transforms an XML source-tree into an XML result-tree. (XML -> XHTML)
- Utilisé pour naviguer à travers les éléments et les attributs des documents XML.
- XSLT Permet de :
  - Ajouter/supprimer des éléments et des attributs du fichier résultant.
  - Réorganiser les éléments dans le fichier résultant.
  - Trier les éléments dans le fichier résultant.
  - Effectuer des tests sur le fichier source
  - Décider quel élément afficher ou masquer dans le fichier résultant.
- Pour déclarer une feuille de style XSL conformément à la recommandation W3C XSLT :

  > `<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">` > `<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">`

- Pour accéder aux éléments, attributs et caractéristiques d'un document XML, il faux déclarer l'espace de nommage XSLT en haut du document.

  > `xmlns:xsl="http://www.w3.org/1999/XSL/Transform"`

- Liaison avec le fichier XML : \* Intégrer la référence XSL à votre document XML ("cdcatalog.xml") et afficher le résultat via un navigateur web
  > `<?xml-stylesheet type="text/xsl" href="cdcatalog.xsl"?>`

### <xsl:template>

- Une feuille de style XSL se compose d'un ou de plusieurs règles nommées templates (Modèles).
- L'élément **<xsl:template>** est utilisé pour construire un modèle d’affichage.
- Le template contient des règles qui s'appliquent quand un nœud spécifique est trouvé.
- L'attribut **match** est utilisé pour associer le modèle à un élément XML.
- Cet attribut peut aussi être utilisé pour définir un modèle pour l'ensemble du document XML (**match = "/"**).

<p align=center>
	<img src="https://i.postimg.cc/L6fmdNjp/Fichier-XSL.png" alt="Fichier_XSL.png">
</p>

### <xsl:value-of>

- L'élément **<xsl:value-of>** est utilisé pour extraire la valeur d'un nœud et de l'ajouter dans le flux de sortie de la transformation

### <xsl:for-each>

- L'élément **<xsl:for-each>** permet de faire une boucle en XSLT.
- Il est utilisé pour sélectionner chaque élément XML d'un ensemble de nœuds.
- Filtrer le résultat : \* Nous pouvons filtrer le résultat à partir du fichier XML en ajoutant un critère pour sélectionner l'attribut dans l'élément **<xsl:for- each>**.
  > `<xsl:for-each select="catalogue/cd[artiste='Bob Dylan']">`
- Les opérateurs de filtrage autorisées sont :
  - = (égal)
  - ! = (Différent)
  - `&lt;` inférieur à (Less Than)
  - `&gt;` supérieur à (Greater Than)

### <xsl:sort>

- L'élément **<xsl:sort>** est utilisé pour trier le résultat.
- L'ajouter à l'intérieur de l'élément **<xsl:for-each>**

### <xsl:if>

- L'élément **<xsl:if>** est utilisée pour mettre un test conditionnel sur le contenu du fichier XML.
- Syntaxe :

```xml
	<xsl:if test="expression">
		... résultat si le test est vrai ...
	</xsl:if>
```

- L'ajouter à l'intérieur de l'élément **<xsl:for-each>** dans le fichier XSL
- La valeur de l'attribut test contient l'expression à évaluer.

### <xsl:choose>

- L'élément **<xsl:choose>** est utilisé en conjonction avec **<xsl:when>** et **<xsl:otherwise>** pour exprimer des tests conditionnels multiples.
- Syntaxe :

```xml
	 <xsl:choose>
		<xsl:when test="expression">
			... Éléments de sortie ...
		</xsl:when>
		<xsl:otherwise>
			... Éléments de sortie ....
		</xsl:otherwise>
	</xsl:choose>
```

### <xsl:apply-templates>

- L'élément **<xsl:apply-templates>** applique un modèle à l'élément courant ou à ces fils.
- Si on ajoute l'attribut **select** à l'élément **<xsl:apply- templates>**, il s'appliquera seulement à l'élément fils correspond à la valeur de l'attribut.
- Nous pouvons utiliser l'attribut **select** pour spécifier l'ordre dans lequel les nœuds fils seront traités.

<p align=center>
	<img src="https://i.postimg.cc/G2H1XQb6/Exemple-Xsl-Apply-Templates.png" alt="Exemple_XslApplyTemplates.png">
</p>

### Fonctions XSLT

- Le préfixe d'espace de noms par défaut pour les fonctions XSLT est **fn** :
  - L'URI de l'espace de noms des fonctions est : http://www.w3.org/2005/xpath/functions
  - Les fonctions sont souvent appelés avec le préfixe fn **(fn:string())**.
  - Vue que fn est le préfixe de l'espace de noms par défaut, les fonctions ne doivent pas être préfixées lorsqu'elles sont appelées.
- Quelques fonctions XSLT :

<p align=center>
	<img src="https://i.postimg.cc/HkdDqHpw/Fonctions-XSLT.png" alt="Fonctions_XSLT.png">
</p>

## XQuery

- Interroger des données semi-structurées.
- Un langage de requête XML fortement typé, à base d'expression de chemins, de boucles, de tests et d'éléments de construction de documents XML.
- XQuery XSLT et XPath partagent le même modèle de données et supportent les mêmes fonctions et opérateurs.
- Une requête XQuery est bâtie sur une expression XPath.
- La génération des résultats s’effectue sous forme de fragments XML.
- Une variable XQuery est défini avec $
- Les commentaires XQuery sont délimitées par `(: XQuery Commentaire:)`
- La fonction doc() est utilisée pour accéder au fichier de données à `doc("file.xml")`

### FLOWR

- Une requête est basée sur l’instruction FLOWR
- FLOWR = "For-Let-Order-Where -Return"
- Chaque expression FLOWR est délimitée par { ... }.
- La forme générale d'une requête FLOWR est la suivante :
  - `for $variable in expression_recherche_xpath`
  - `let $variable := expressions_xpath`
  - `where expression_logique`
  - `order by $variable`
  - `return expression`

```xquery
	for $x in doc("books.xml")/bookstore/book
	where $x/price>30
	order by $x/title
	return $x/title
```

- **for** - (facultatif) lie une variable à chaque élément retourné par l'expression
- **let** - (facultatif) pour donner un autre nom à la variable
- **where** - (facultatif) spécifie un critère de sélection
- **order by** - (optionnel) spécifie le type d'ordre du résultat
- **return** - spécifie ce que retourne le résultat

#### La clause FOR

- Permet d’itérer sur une liste de fragments XML.
- Elle associe à chaque **$variable** un fragment de chemin XML défini par Xpath.
- Une seule clause for est insérée dans une expression FLWOR.
- Pour boucler un nombre fini de fois avec FOR, utiliser **to** :
  > `for $x in (1 to 5)` > `return <test>{$x}</test>`
- Permet de mettre plusieurs expressions de chemins dans une clause FOR.
- Utilisez une virgule pour séparer les expressions de chemins :
  > `for $x in (10,20), $y in (100,200)` >`return <test>x={$x} and y={$y}</test>`
- Le mot clé **at** est utilisé pour compter le nombre d'itérations :
  > `for $x at $i in doc("books.xml")/bookstore/book/title` > `return <book>{$i}. {data($x)}</book>`

-> Ce qui donne :

> \<book>1. Concepts Client/Serveur\</book>  
> \<book>2. Services Web\</book>  
> \<book>3. Relationnel DataBases\</book>  
> \<book>4. Learning XML\</book>

#### La clause LET

- La clause **let** est optionnelle, elle permet d’associer le résultat d’une expression Xpath à une variable.
- éviter de répéter la même expression.

```xquery
	let $x := (1 to 5)
	return <test>{$x}</test>
	<!-- RESULT -->
	<test>1 2 3 4 5</test>
```

#### La clause where

- La clause where permet de définir une conditionde sélection pour construire la réponse.
- La sélection se fait par une expression logique de prédicats élémentaires.

```xquery
	where $x/price>30 and $x/price<100

	where contains($x/title,"XML")
```

#### La clause order by

- La clause order permet de trier les résultats (croissant au décroissant).
- Pour ordonner le résultat par category et title :

```xquery
	for $x in doc("books.xml")/bookstore/book
	order by $x/@category, $x/title
	return $x/title
	<!-- RESULT -->
	<title lang="fr"> Concepts Client/Serveur </title>
	<title lang="fr"> Services Web </title>
	<title lang="en"> Relationnel DataBases </title>
	<title lang="en"> Learning XML </title>
```

#### La clause return

- Spécifie ce qui retourne la requête.
- Chaque itération doit retourner un seul fragment XML (pas une collection).

```xquery
	for $x in doc("books.xml")/bookstore/book
	return $x/title
	<!-- RESULT-->
	<title lang="fr"> Concepts Client/Serveur </title>
	<title lang="fr"> Services Web </title>
	<title lang="en"> Relationnel DataBases </title>
	<title lang="en"> Learning XML </title>
```

#### Généralités

- Les expressions de requêtes peuvent être arbitrairement imbriquées.
- Il est possible d'imbriquer des requêtes au niveau de **for**, de **where**, et de **return**.
- Fonctions d'agrégations : **count**, **min**, **max**...
- Recherche textuelle : = , **contains**

### Fonctions XQuery

- XQuery, XPath et XSLT partagent la même bibliothèque de fonctions.
- **Exemple 1** : dans le prédicat d'une expression de chemin :
  `doc("books.xml")/bookstore/book[substring(title,1,3)='XML']`
- **Exemple 2** : dans une clause let
  `let $name := (max($price))`
- **Exemple 3** : dans un élément
  `<name>{upper-case($booktitle)}</name>`

- Définir des fonctions avec **XQuery**.

<p align=center>
	<img src="https://i.postimg.cc/7ZxdBVVX/Definition-Fonction-XQuery.png" alt="DefinitionFonction_XQuery.png">
</p>

- Exemple :

```Xquery
	declare function local:minPrice($a as xs:decimal, $b as xs:decimal)
	as xs:decimal
	{
		if($a > $b) let $res := $b
			else let $res := $a
		return ($res)
	}
	<!-- l'appel de la fonction-->
	<minPrice>{local:minPrice($book/price, $book/discount)}</minPrice>
```

## XPath (XML Path Language)

- XPath (XML Path) est un langage pour chercher des éléments ou des attributs dans un document XML.
- C’est une syntaxe pour définir des parties d'un document XML
- Un élément essentiel dans XSL
- Syntaxe non XML
- Supporte XML Namespaces
- XSL, XPath et XQuery partagent le même modèle de données et supportent les mêmes fonctions et opérateurs.
- Xpath opère sur l'arbre d'un document.
- Un document XML est traité sous forme d'un arbres de nœuds.

### Nœuds XPath

- Sept types de nœuds :
  - Nœuds de document.
  - Éléments.
  - Attributs.
  - Texte.
  - Espace de noms.
  - Instruction de traitement.
  - Commentaire.
- Théorie des Arbres : nœud, arc, chemin et contenu.

#### Relations entre nœuds

- **Parent** : Chaque élément ou attribut a un parent (sauf la racine).
- **Enfant** : l’élément fils d’un nœud. Un nœud peut avoir zéro, un ou plusieurs enfants.
- **Fraternité** : Nœuds qui ont le même parent.
- **Ancêtres** : Le parent d'un nœud, le parent du parent, etc...
- **Descendants** : Enfants d'un nœud, les enfants des enfants, etc...

#### Expression de chemin

- XPath utilise des expressions de chemin pour sélectionner un ensembles de nœuds dans un document XML.
- Un chemin peut être :
  - **Absolu** :
    - Commence à la racine. `/étape1/…/étapeN`
  - **Relatif** :
    - Commence à un nœud courant. `étape1/…/étapeN`
- Une expression de chemins spécifie une traversée de l'arbre du document
  - Depuis un nœud de départ.
  - Vers un ensemble de nœuds cibles.
  - Les cibles constituent la valeur du cheminement.
  - **Exemple** :
    > /livres/livre/chapitre/section/paragraphe

#### Sélection des nœuds

- Les expressions de sélection sont les suivantes :
  <p align=center>
	<img src="https://i.postimg.cc/hj75J3D4/Expression-Selection-XPath.png" alt="ExpressionSelection_XPath.png">
</p>

- Exemples d’expressions de sélection :
  <p align=center>
	<img src="https://i.postimg.cc/4xN2v3fS/Exemples-Expression-Selection-XPath.png" alt="ExemplesExpressionSelection_XPath.png">
</p>

#### Prédicats

- Ils sont utilisés pour trouver un nœud spécifique.
- Toujours entre deux crochets.

<p align=center>
	<img src="https://i.postimg.cc/tCD2gH3t/Predicats-XPath.png" alt="Predicats_XPath.png"> <br/>
	<img src="https://i.postimg.cc/pd5Zkhgq/Predicats-XPath0.png" alt="Predicats_XPath0.png">
</p>

- XPath peut aussi être utiliser pour sélectionner des nœuds inconnus.
<p align=center>
	<img src="https://i.postimg.cc/B6c2wxNc/Selection-Noeuds-XPath.png" alt="SelectionNoeuds_XPath.png">
</p>

- Exemples :
<p align=center>
	<img src="https://i.postimg.cc/sxgG6bMs/Exemples-Selection-Noeuds-XPath.png" alt="ExemplesSelectionNoeuds_XPath.png">
</p>

#### Sélectionner plusieurs chemins

- Par utilisation de l'opérateur.
- Exemples :

<p align=center>
	<img src="https://i.postimg.cc/5ysLfbhX/Selection-Plusieurs-Chemin-XPath.png" alt="SelectionPlusieursChemin_XPath.png">
</p>

### Les Axes XPath

- Un axe défini un ensemble de nœuds.
<p align=center>
	<img src="https://i.postimg.cc/L5kRPs9s/Axes-XPath.png" alt="Axes_XPath.png">
</p>


#### Accès par Axe

- L’accès par axe est une expression de sélection qui se compose de :
  - Un axe qui défini la relation entre le nœud sélectionné et le nœud courant.
  - Un nœud de position.
  - Zéro ou plusieurs prédicats.
- L’expression a la syntaxe suivante :
  > axe::nœud_de_position[prédicat]
  > OR
  > direction::sélecteur[predicat]
- **X::Y** Signifie “_select Y from X_”
- **Axe ou Directions** :
  - parent, ancestor, ancestor-or-self
  - child, descendant, descendant-or-self
  - preceding, preceding-sibling
  - following, following-sibling
  - self, attribute, namespace
- **Sélecteur** :
  - nom de nœud sélectionné (élément ou @attribut)
- **Prédicat** :

  > [Fonction(nœud) = valeur]

- Exemples :

<p align=center>
	<img src="https://i.postimg.cc/hG0GkpWj/Exemple-Acces-Par-Axe-XPath0.png" alt="ExempleAccesParAxe_XPath0.png"> <br/>
	<img src="https://i.postimg.cc/1zSt7bd2/Exemple-Acces-Par-Axe-XPath1.png" alt="ExempleAccesParAxe_XPath1.png">
	<img src="https://i.postimg.cc/3JPWmkFK/Exemple-Acces-Par-Axe-XPath.png" alt="ExempleAccesParAxe_XPath.png"> <br/>
</p>

### Fonctions Xpath

- **Node-set** : `last(), position(), count( node-set ), id( string ), name(node-set), namespace-uri( node-set )`
- **String** : `concat($s1,...,$sn), starts-with($a,$b), contains($a,$b), substring-before($a,$b), substring- after($a,$b), substring($a,$n,$l), string-length($a), normalize-space($a), translate($a,$b,$c)`
- **Boolean et Number** : `not($b), sum($s), floor($n), ceiling($n), round($n)`
