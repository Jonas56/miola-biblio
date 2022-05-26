# JAVA EE

## Table des matières

- [Introduction](#introduction)
- [Conception des applications selon le pattern MVC](#)
- [HTTP Protocol](#http-protocol)
- [Servlet](#servlet)
- [JavaServer Pages (JSP)](#javaserver-pages-jsp)
- [JSP Standard Tag Library (JSTL)](#jsp-standard-tag-library-jstl)
- [JAVA JDBC API](#java-jdbc-api)
- [Java Server Faces (JSF)](#java-server-faces)
- [Primefaces](#primefaces)

## Introduction

Les applications d'entreprise modernes ont leurs responsabilités réparties sur un certain nombre de de couches. Une architecture commune est le modèle à 3 couches comprenant la présentation, métier et de base de données. La couche de présentation est responsable de la présentation d'une interface utilisateur et de gérer les interactions avec l'utilisateur final. La couche métier est responsable de l'exécution de la logique métier. La couche base de données est responsable du stockage des données d'entreprise; généralement, un système de gestion de base de données est utilisé pour cette couche. La structuration en couches est utilisée dans toute la discipline informatique pour gérer la complexité, chaque couche servant un objectif distinct.

<p align=center>
    <img src="https://www.ecanarys.com/sites/default/files/anant.patil-50/3lyrs2.jpg">
</p>

La technologie Java Platform Enterprise Edition (Java EE) fournit des services aux applications d'entreprise en utilisant une architecture multicouche. Les applications Java EE sont compatibles avec le Web et basées sur Java, ce qui signifie qu'elles peuvent être écrites une fois et déployées sur tout conteneur prenant en charge la norme Java EE. Un serveur d'application est l'environnement dans lequel réside le conteneur. Toutefois, dans la pratique, il n'est pas nécessaire de faire la distinction entre un serveur d'application et un conteneur. La spécification Java EE est prise en charge par des fournisseurs commerciaux tels que Sun, IBM, Oracle, BEA Systems ainsi que par des entreprises open-source telles que JBoss.

Les technologies de la couche de présentation de Java EE comprennent les servlets, les pages JSP et les composants JSF. Elles sont développées pour une application métier, puis déployées et exécutées dans un conteneur Web. Un client interagit avec le conteneur web soit à partir d'un navigateur, soit à partir d'une applet. Dans les deux cas, le protocole Internet http ou https est utilisé pour la communication.

Enterprise JavaBeans version 3 (EJB 3) est la technologie que Java EE version 5 (Java EE 5) fournit pour la couche métier. Dans Java EE 5, nous subdivisons la couche métier en une couche qui s'occupe du traitement métier et une deuxième couche qui s'occupe de la persistance. Dans EJB 3, les artefacts de traitement de l'activité sont des beans orientés session et message. Ils sont développés pour une application métier et déployés et exécutés dans un conteneur EJB. L'artefact de la couche de persistance est une entité, celle-ci est persistée dans la couche de base de données à l'aide d'un fournisseur de persistance ou d'un moteur de persistance. Le moteur de persistance met en œuvre une autre spécification, l'API de persistance Java (JPA). EJB 3 et JPA sont toutes deux des spécifications pour lesquelles un certain nombre d'organisations fournissent des implémentations.

<p align=center>
    <img src="https://i.postimg.cc/5tbf47z4/Jee-architechture.png" width=900>
</p>

Notez que notre modèle à 3 couches est devenu à 5 couches. La distinction entre les couches client/web et logique métier/persistance n'est pas toujours faite. Par conséquent, nous faisons référence à l'architecture Java EE simplement comme n-couche ou multicouche. Un conteneur Java EE offre de nombreux autres services tels que les services Web, le service de messagerie Java (JMS) et les adaptateurs de ressources.

Notez sur le diagramme que nous pouvons accéder à un EJB directement à partir d'une application Java SE, telle que Swing, sans passer par un conteneur web. L'application Java peut être stand-alone ou s'exécuter à partir d'un conteneur d'application client (ACC). Un ACC permet à un client s'exécutant dans sa propre machine virtuelle Java (JVM) en dehors du conteneur EJB d'accéder à un nombre limité de services Java EE.

## Conception des applications selon le pattern MVC

`Model-View-Controller (MVC)` est un modèle utilisé en développement logiciel pour séparer la logique d’application de l’interface utilisateur. Comme son nom l’indique, le modèle MVC a trois couches.

- **Contrôleur**
  - Le **contrôleur** sert d’interface entre la vue et le modèle. Le contrôleur intercepte toutes les demandes entrantes.
  - Le contrôleur (**Servlet**) sert d’interface entre les vues et le modèle.
  - Cette couche gère les requêtes HTTP et les envoie à la couche modèle appropriée pour le traitement des données, et une fois que les données sont traitées et renvoyées au contrôleur, puis affichées sur la couche présentation (**Vue**)
- **Model**
  - Le modèle représente l’état de l’application, c’est-à-dire les données. Il peut également avoir une logique métier.
- **Vue**
  - La **vue** représente la couche présentation, c’est-à-dire l’interface utilisateur (interface utilisateur).
  - Une **vue** (`JSP`) peut être n’importe quelle représentation de sortie de données, comme un graphique ou un diagramme, généralement une page HTML ou JSP.

<p align=center>
    <img src="https://apcpedagogie.com/wp-content/uploads/2019/12/Exemple-darchitecture-MVC-avec-servlets-JSP-et-MySQL-6.jpg" width=900>
</p>

### Caractéristiques du modèle

- Il sépare la couche de présentation de la couche métier
- Le contrôleur effectue l’action d’invoquer le modèle et d’envoyer des données à View
- Le modèle ne sait même pas qu’il est utilisé par une application Web ou une application de desktop

## HTTP Protocol

HTTP est un [protocole](https://en.wikipedia.org/wiki/Communication_protocol) permettant de récupérer des ressources telles que des documents HTML. C'est la base de tout échange de données sur le Web et c'est un protocole client-serveur, ce qui signifie que les demandes sont initiées par le destinataire, généralement le navigateur Web. Un document complet est reconstruit à partir des différents sous-documents récupérés, par exemple le texte, la description de la mise en page, les images, les vidéos, les scripts, etc.

<p align=center>
  <img src="https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/fetching_a_page.png">
</p>

Les clients et les serveurs communiquent en échangeant des messages individuels (par opposition à un flux de données). Les messages envoyés par le client, généralement un navigateur Web, sont appelés requêtes et les messages envoyés par le serveur en réponse sont appelés réponses.

### Le flux HTTP

Lorsqu'un client souhaite communiquer avec un serveur, qu'il s'agisse du serveur final ou d'un proxy intermédiaire, il effectue les étapes suivantes :

1. Ouvrir une connexion TCP : La connexion TCP est utilisée pour envoyer une ou plusieurs requêtes et recevoir une réponse. Le client peut ouvrir une nouvelle connexion, réutiliser une connexion existante, ou ouvrir plusieurs connexions TCP vers les serveurs.
2. Envoyer un message HTTP : Les messages HTTP (avant HTTP/2) sont directement lisibles par les utilisateurs. Avec HTTP/2, ces messages simples sont encapsulés dans des trames, ce qui les rend impossibles à lire directement, mais le principe reste le même. Par exemple :

```http
GET / HTTP/1.1
Host: ensias.miola.ma
Accept-Language: fr
```

3. Lire la réponse envoyée par le serveur, par exemple:

```https
HTTP/1.1 200 OK
Date: Sat, 09 Oct 2010 14:28:02 GMT
Server: Apache
Last-Modified: Tue, 01 Dec 2009 20:18:22 GMT
ETag: "51142bc1-7449-479b075b2891b"
Accept-Ranges: bytes
Content-Length: 29769
Content-Type: text/html

<!DOCTYPE html... (ici viennent les 29769 octets de la page web demandée)
```

4. Fermez ou réutilisez la connexion pour d'autres demandes.

### Messages HTTP

Les messages HTTP, tels que définis dans HTTP/1.1 et les versions antérieures, sont directement lisibles par les humains. Dans HTTP/2, ces messages sont intégrés dans une structure binaire, une trame, ce qui permet des optimisations comme la compression des en-têtes et le multiplexage. Même si seule une partie du message HTTP original est envoyée dans cette version de HTTP, la sémantique de chaque message est inchangée et le client reconstitue (virtuellement) la requête HTTP/1.1 originale. Il est donc utile de comprendre les messages HTTP/2 dans le format HTTP/1.1.

Il existe deux types de messages HTTP, les requête et les réponses, chacun ayant son propre format.

#### Requête HTTP

<p align=center>
  <img src="https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/http_request.png">
</p>

Les requêtes se composent des éléments suivants :

- Une méthode HTTP, généralement un verbe comme **GET**, **POST**, ou un nom comme **OPTIONS** ou **HEAD** qui définit l'opération que le client veut effectuer. En général, un client veut récupérer une ressource (en utilisant `GET`) ou afficher la valeur d'un formulaire HTML (en utilisant `POST`), bien que d'autres opérations puissent être nécessaires dans d'autres cas.
- Le chemin de la ressource à récupérer ; l'URL de la ressource dépouillée des éléments évidents à partir du contexte, par exemple sans le **protocole** (http://), le **domaine** (ici, ensias.miola.ma), ou le port TCP (ici, `80`).
- La version du protocole HTTP.
- Des en-têtes (headers) facultatifs qui transmettent des informations supplémentaires aux serveurs.
- Un corps, pour certaines méthodes comme POST, similaire à celui des réponses, qui contient la ressource envoyée.

#### Réponse HTTP

<p align=center>
  <img src="https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview/http_response.png">
</p>

Les réponses sont constituées des éléments suivants :

- La **version** du protocole HTTP qu'elles suivent.
- Un [**code de statut**](https://www.loggly.com/blog/http-status-code-diagram/), indiquant si la requête a abouti ou non, et pourquoi.
- Un **message de statut**, une brève description non officielle du code de statut.
- Des **en-têtes** HTTP, comme ceux des requêtes.
- Facultativement, un **corps** contenant la ressource récupérée.

## Servlet

Les Java Servlet sont des programmes qui s'exécutent sur un serveur Web ou un serveur d'application (Application Server) et constituent une couche intermédiaire entre une demande provenant d'un navigateur Web ou d'un autre client HTTP (Client) et de bases de données ou des applications sur le serveur HTTP (HTTP Server).

À l'aide de Servlets, vous pouvez collecter les entrées des utilisateurs via des formulaires de pages Web, présenter des enregistrements à partir d'une base de données ou une autre source, et créer dynamiquement des pages Web.

### Le cycle de vie de Servlet

La figure suivante illustre le cycle de vie d'une Servlet. Depuis sa création, les demandes sont traitées par les utilisateurs, jusqu'à ce qu'elles soient détruites.

<p align=center>
  <img src="https://s1.o7planning.com/fr/10169/images/12877.png">
</p>

Il y a 5 étapes:

1. Charger la classe Servlet dans la mémoire.
2. Créer l'instance de la Servlet.
3. Appeler la méthode init() de Servlet.
4. Appeler la méthode service() de Servlet.
5. Appeler la méthode destroy() de Servlet.

Les étapes **1**, **2** et **3** sont exécutées une seule fois, lorsque la Servlet est initialement chargée. Par défaut, la Servlet n'est pas chargée (load) jusqu'à ce que la première requête soit reçue par l'utilisateur. Vous pouvez forcer le Servlet Container (conteneur à charger la Servlet) lorsque le conteneur démarre.

L'étape **4** est exécutée plusieurs fois - chaque requête HTTP vers la Servlet.
L'étape **5** est exécutée lorsque le conteneur de servlet (Servlet Container) décharge (unloaded) la Servlet.

<p align=center>
  <img src="https://s1.o7planning.com/fr/10169/images/788727.png">
</p>

Lors de la requête (request) des utilisateurs à Servlet, la Servlet appellera la méthode de `service()` pour répondre aux requêtes des utilisateurs, le `service()` appellera une des deux méthodes, soit `doGet()` soit `doPost()`. Dans votre Servlet, vous devez implémenter ces méthodes.

Ainsi, lorsque les utilisateurs demandent une Servlet, la Servlet sera créée au moment de la première requête et appellera simultanément la méthode `init()` de servlet pour l'initialiser, la méthode `init()` est appelée une seule fois. La méthode `destroy()` est utilisée pour détruire la servlet, elle ne sera appelée qu'une fois lors de la suppression du déploiement (undeloy) de l'application Web ou de l'arrêt (shutdown) du serveur Web.

### Forward (Transmettre)

**Transmettre (Forward)**: Quand une requête (request) est envoyé à une Servlet, elle peut rediriger cette requête vers une autre ressource désignée comme une autre page (ou une autre servlet). L'adresse sur le navigateur de l'utilisateur est toujours le même lien de la première page mais le contenu est créé par la page désignée.  
La page désignée est obligatoire une page ou une servlet qui se trouve dans votre application web.
Avec l'action de transfert, vous pouvez utiliser request.setAttribute() pour transférer des données de la page 1 vers la page 2.

<p align=center>
  <img src="https://s1.o7planning.com/fr/10169/images/35899.png">
</p>

**Forward** (Transmission) est souvent utilisé dans les cas où l'utilisateur demande servlet A. Mais cette page exige d'entrer dans le système en avant, le servlet A vérifie l'identifiant de connexion de l'utilisateur et s'il ne fait pas, ce servlet va rediriger vers le servlet Login.
Retournant à `RequestDispatcher`, nous avons deux méthodes d'obtenir l' objet `RequestDispatcher`.

### Redirect (Rediriger)

**Réorientation (Redirect)**: Redirect se passe en deux étapes depuis le serveur doit charger le navigateur Web (Page A) sur le côté client pour aller chercher une autre adresse qu'il est redirigé vers (Page B) et termine sa mission. La page désignée soit la page dans l'application web, soit une page extérieure. En conséquence, l'URL dans la barre d'adresse va changer après la redirection.
Au contraire à l'action de transfert, l'action **Redirect** ne vous permet pas d'utiliser `request.setAttribute()` pour échanger des données de A vers B.

<p align=center>
  <img src="https://s1.o7planning.com/fr/10169/images/35622.png">
</p>

### Session

En termes géneral, une session indique une période de temps pendant laquelle un utilisateur unique visite un site Web. Une session commence lorsque l'utilisateur demande la première page. Au cours d'une session, l'utilisateur peut consulter autant de pages qu'il le souhaite. La session se termine si l'utilisateur n'a demandé aucune page pendant un certain temps (timeout). Le délai d'expiration de la session varie, en fonction de la configuration du serveur - généralement de 15 à 30 minutes.

Le protocole HTTP étant stateless, le serveur peut assurer le suivi de la session par le biais de cookies, de la réécriture d'URL ou de champs de formulaire cachés, afin d'identifier un même utilisateur à travers différentes requêtes. Le suivi de session à l'aide de cookies est le principal mécanisme. Si le navigateur web de l'utilisateur ne prend pas en charge les cookies, la réécriture d'URL ou les champs de formulaire cachés peuvent être utilisés.

Dans le développement web, les développeurs utilisent le mécanisme de session pour gérer les informations de l'utilisateur qui ne persistent que dans une session particulière, comme l'état d'authentification, le nom d'utilisateur ou toute donnée qui doit être partagée entre les requêtes.

#### Gestion des sessions

Un objet [`HttpSession`](https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpSession.html) représente la **session** d'un utilisateur particulier. Notez que `HttpSession` est une interface définie dans le paquet `javax.servlet`, alors que l'implémentation réelle est injectée dans `HttpServletRequest` par le conteneur de servlet (c'est-à-dire le serveur comme Tomcat).

Vous pouvez stocker des informations relatives à l'utilisateur dans une session sous la forme de paires de clés-valeurs. L'interface `HttpSession` définit la méthode `setAttribute(key, value)` pour stocker une entrée clé-valeur et la méthode `getAttribute(key)` pour obtenir la valeur d'une clé spécifiée.

Par défaut, on utilise des **cookies** pour le suivi des sessions. Un cookie portant le nom de **JSESSIONID** est stocké temporairement dans le navigateur Web. Il est utilisé pour identifier le même utilisateur à travers différentes requêtes.

#### Obtenir ou créer une session

Par défaut, une **session** est automatiquement créée lorsque l'utilisateur visite le site Web. Pour obtenir l'objet `HttpSession` représentant la session de l'utilisateur, invoquez la méthode `getSession()` de l'interface `HttpServletRequest` dans la méthode `doGet()` ou `doPost()` d'une servlet Java. Par exemple :

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();

    // work with the session...
}
```

Notez que la méthode `HttpServletRequest.getSession()` renvoie la session actuelle associée à la demande, ou en crée une nouvelle si la demande n'a pas de session. Cela signifie que l'objet HttpSession renvoyé n'est jamais `null`.

Pour obtenir une session sans en créer une nouvelle si elle n'existe pas, vous pouvez utiliser l'invoke `getSession(false)` sur le `HttpServletRequest` :

```java
HttpSession session = request.getSession(false);
if (session != null) {
    // a session exists

} else {
    // no session
}
```

Dans ce cas, la valeur retournée peut être `null` si aucune session n'existe - d'où la nécessité d'une vérification if-else de la nullité. Cela signifie également que `getSession()` est équivalent à `getSession(true)`.

La Servlet suivante imprime l'ID de la session, l'heure de création et la dernière heure d'accès de la session en cours :

```java
package net.codejava;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
@WebServlet("/test_session")
public class TestSessionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public TestSessionServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        PrintWriter writer = response.getWriter();
        writer.println("Session ID: " + session.getId());
        writer.println("Creation Time: " + new Date(session.getCreationTime()));
        writer. println("Last Accessed Time: " + new Date(session.getLastAccessedTime()));
    }
}
```

#### Lier des données à une session

Pour stocker une valeur dans une session, utilisez la méthode `setAttribute(key, value)` de l'objet `HttpSession`. Par exemple, l'instruction suivante stocke le nom d'utilisateur de l'utilisateur

```java
session.setAttribute("username", "Jonas56");
```

Ici, la clé est le nom d'utilisateur et la valeur est Jonas56. Les données stockées dans une session sont gérées par le serveur et seront supprimées à la fin de la session.

Vous pouvez stocker tout type d'objet dans la session. Par exemple, le code suivant stocke une liste d'objets Étudiant dans la session :

```java
List<Student> students = studentDao.getStudents();
session.setAttribute("listStudent", students);
```

### Filter

Java Servlet Filter est utilisé pour intercepter la requête du client et effectuer un prétraitement. Il peut également intercepter la réponse et effectuer un post-traitement avant de l'envoyer au client dans une application Web.

<p align=center>
  <img src="https://s1.o7planning.com/fr/10395/images/776754.png">
</p>

Les Filter Servlet sont des composants Java enfichables que nous pouvons utiliser pour intercepter et traiter les requêtes avant qu'elles ne soient envoyées aux servlets et la réponse après que le code du servlet soit terminé et avant que le conteneur ne renvoie la réponse au client.

Ils permettent d'effectuer certaines tâches courantes :

- Enregistrement des paramètres de la requête dans des fichiers.
- Authentification et autorisation des requêts pour les ressources.
- Formatage du corps de la requête ou de l'en-tête avant de l'envoyer à la servlet.
- Compression des données de réponse envoyées au client.
- Modification de la réponse en ajoutant des cookies, des informations d'en-tête, etc.

Nous pouvons avoir plusieurs filtres pour une seule ressource et nous pouvons créer une chaîne de filtres pour une seule ressource dans web.xml. Nous pouvons créer un Servlet Filter en implémentant l'interface `javax.servlet.Filter`.

#### Interface Filter

L'interface Servlet `Filter` est similaire à l'interface `Servlet` et nous devons l'implémenter pour créer notre propre filtre de servlet. L'interface Servlet `Filter` contient les méthodes de cycle de vie d'un filtre et elle est gérée par le conteneur de servlets.

- `void init(FilterConfig paramFilterConfig)` - Lorsque le conteneur initialise le filtre, c'est cette méthode qui est invoquée. Cette méthode est appelée une seule fois dans le cycle de vie du filtre et nous devons initialiser toutes les ressources dans cette méthode. `FilterConfig` est utilisé par le conteneur pour fournir les paramètres **init** et l'objet de contexte de servlet au filtre. Nous pouvons lancer une `ServletException` dans cette méthode.
- `doFilter(ServletRequest paramServletRequest, ServletResponse paramServletResponse, FilterChain paramFilterChain)` - C'est la méthode invoquée à chaque fois par le conteneur lorsqu'il doit appliquer un filtre à une ressource. Le conteneur fournit les références des objets de la demande et de la réponse au filtre comme argument. `FilterChain` est utilisé pour invoquer le filtre suivant dans la chaîne. Il s'agit d'un excellent exemple du modèle de la chaîne de responsabilité.
- `void destroy()` - Lorsque le conteneur décharge l'instance du filtre, il invoque la méthode `destroy()`. C'est la méthode qui permet de fermer toutes les ressources ouvertes par le filtre. Cette méthode n'est appelée qu'une seule fois pendant la durée de vie du filtre.

## JavaServer Pages (JSP)

JavaServer Pages (JSP) est une technologie standard de Java qui vous permet d'écrire des pages dynamiques. JSP s'appuie sur la spécification Java Servlet. Les deux technologies fonctionnent généralement ensemble. Du point de vue du codage, la différence la plus évidente entre elles est qu'avec les servlets, vous écrivez du code Java et intégrez ensuite des balises côté client (comme le HTML) dans ce code, alors qu'avec JSP, vous commencez par le script ou les balises côté client, puis intégrez des balises JSP pour connecter votre page au backend Java.

### Cycle de vie de JSP

<p align=center>
  <img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/jsplifecycle.png">
</p>

Les pages JSP suivent ces phases:

- Traduction de la page **JSP**
- Compilation de la page **JSP**
- Chargement de classe
- Initialisation (le conteneur appelle la
  méthode `jspInit()`).
- Traitement de la demande (le conteneur appelle la méthode `_jspService(`)).
- Destroy (le conteneur appelle la méthode `jspDestroy()`).

### JSP vs Servlet

Les servlets et les JSP ont de nombreux points communs puisqu'une JSP est finalement convertie en une servlet. Le choix d'utiliser l'une ou l'autre de ces technologies ou les deux doit être fait pour tirer le meilleur parti de leurs avantages.

Dans une servlet, les traitements et la présentation sont regroupés. L'aspect présentation est dans ce cas pénible à développer et à maintenir à cause de l'utilisation répétitive de méthodes pour insérer le code HTML dans le flux de sortie. De plus, une simple petite modification dans le code HTML nécessite la recompilation de la servlet. Avec une JSP, la séparation des traitements et de la présentation rend ceci très facile et automatique.

Il est préférable d'utiliser les JSP pour générer des pages web dynamiques.

L'usage des servlets est obligatoire si celles-ci doivent communiquer directement avec une applet ou une application et non plus avec un serveur web.

### Les Tags JSP

Il existe trois types de tags :

- **tags de directives** : ils permettent de contrôler la structure de la servlet générée
- **tags de scripting** : ils permettent d'insérer du code Java dans la servlet
- **tags d'actions** : ils facilitent l'utilisation de composants

#### Les tags de directives `<%@ ... %>`

Les directives permettent de préciser des informations globales sur la page JSP. Les spécifications des JSP définissent trois directives :

- _page_ : permet de définir des options de configuration
- _include_ : permet d'inclure des fichiers statiques dans la JSP avant la génération de la servlet
- _taglib_ : permet de définir des tags personnalisés

Leur syntaxe est la suivante :

```jsp
<%@ directive attribut="valeur" ... %>
```

#### Les tags de scripting

Ces tags permettent d'insérer du code Java qui sera inclus dans la servlet générée à partir de la JSP. Il existe trois tags pour insérer du code Java :

- **Tag de déclaration** : le code Java est inclus dans le corps de la servlet générée. Ce code peut être la déclaration de variables d'instances ou de classes ou la déclaration de méthodes.
- **Tag d'expression** : évalue une expression et insère le résultat sous forme de chaîne de caractères dans la page web générée.
- **Tag de scriptlets** : par défaut, le code Java est inclus dans la méthode `service()` de la servlet.

Syntaxe :

```jsp
<%! declarations %> // tag de déclaration
<%= expression %> // tag d'expression
<% code Java %> // tag de scriptlets
```

#### Les tags d'actions

Les tags d'actions permettent de réaliser des traitements couramment utilisés.

- Le tag `<jsp:useBean>` permet de localiser une instance ou d'instancier un bean pour l'utiliser dans la JSP.

L'utilisation d'un bean dans une JSP est très pratique car il peut encapsuler des traitements complexes et être réutilisable par d'autre JSP ou composants. Le bean peut par exemple assurer l'accès à une base de données. L'utilisation des beans permet de simplifier les traitements inclus dans la JSP.

La syntaxe est la suivante :

```jsp
<jsp:useBean
  id="beanInstanceName"
  scope="page|request|session|application"
  { class="package.class" |
  type="package.class" |
  class="package.class" type="package.class" |
  beanName="{package.class | <%= expression %>}" type="package.class"
  }
  { /> |
  > ...
</jsp:useBean>
  }
```

Exemple :

```jsp
<jsp:useBean id="monBean" scope="session" class="test.MonBean" />
```

- Le tag `<jsp:setProperty>` permet de mettre à jour la valeur d'un ou plusieurs attributs d'un Bean. Le tag utilise le setter (méthode setXXX() où XXX est le nom de la propriété avec la première lettre en majuscule) pour mettre à jour la valeur. Le bean doit exister grâce à un appel au tag `<jsp:useBean>`.

Il existe trois façons de mettre à jour les propriétés soit à partir des paramètres de la requête soit avec une valeur :

- alimenter automatiquement toutes les propriétés avec les paramètres correspondants de la requête
- alimenter automatiquement une propriété avec le paramètre de la requête correspondant
- alimenter une propriété avec la valeur précisée

La syntaxe est la suivante :

```jsp
<jsp:setProperty name="beanInstanceName"
{ property="*" |
property="propertyName" [ param=" parameterName" ] |
property="propertyName" value="{string | <%= expression%>}"
}
/>
```

Exemple :

```jsp
<jsp:setProperty name="monBean" property="nom" value="toto" />
```

- Le tag `<jsp:getProperty>` permet d'obtenir la valeur d'un attribut d'un Bean. Le tag utilise le getter (méthode getXXX() où XXX est le nom de la propriété avec la première lettre en majuscule) pour obtenir la valeur et l'insérer dans la page HTML générée. Le bean doit exister grâce à un appel au tag `<jsp:useBean>`.

La syntaxe est la suivante :

```jsp
<jsp:getProperty name="beanInstanceName" property=" propertyName" />
```

- Le tag `<jsp:forward>` permet de rediriger la requête vers une autre URL pointant vers un fichier HTML, JSP ou une servlet.

Dès que le moteur de JSP rencontre ce tag, il redirige le requête vers l'URL précisée et ignore le reste de la JSP courante. Tout ce qui a été généré par la JSP est perdu.

## JSP Standard Tag Library (JSTL)

JSTL est l'acronyme de Java server page Standard Tag Library. C'est un ensemble de tags personnalisés développé sous la JSR 052 qui propose des fonctionnalités souvent rencontrées dans les JSP :

- Tag de structure (itération, conditionnement ...)
- Internationalisation
- Exécution de requêtes SQL
- Utilisation de documents XML

JSTL nécessite un conteneur d'applications web qui implémente l'API servlet 2.3 et l'API JSP 1.2. L'implémentation de référence (JSTL-RI) de cette spécification est développée par le projet Taglibs du groupe Apache sous le nom " Standard ".

### Le langage EL (Expression Language)

JSTL propose un langage particulier constitué d'expressions qui permettent d'utiliser et de faire référence à des objets Java accessibles dans les différents contextes de la page JSP. Le but est de fournir un moyen simple d'accéder aux données nécessaires à une JSP.

La syntaxe de base est ${xxx} où xxx est le nom d'une variable d'un objet Java défini dans un contexte particulier. La définition dans un contexte permet de définir la portée de la variable (page, requête, session ou application).

**EL** permet facilement de s'affranchir de la syntaxe de Java pour obtenir une variable.

```jsp
<%= session.getAttribute("personne").getNom() %>
```

```jsp
${sessionScope.personne.nom}
```

EL possède par défaut les variables suivantes :

|     Variable     |                                Role                                 |
| :--------------: | :-----------------------------------------------------------------: |
|    PageScope     |      variable contenue dans la portée de la page (PageContext)      |
|   RequestScope   | variable contenue dans la portée de la requête (HttpServletRequest) |
|   SessionScope   |    variable contenue dans la portée de la session (HttpSession)     |
| ApplicationScope | variable contenue dans la portée de l'application (ServletContext)  |
|      Param       |                    paramètre de la requête http                     |
|   ParamValues    |       paramètres de la requête sous la forme d'une collection       |
|      Header      |                        en-tête de la requête                        |
|   HeaderValues   |        en-têtes de la requête sous la forme d'une collection        |
|    InitParam     |                     paramètre d'initialisation                      |
|      Cookie      |                               cookie                                |
|   PageContext    |                    objet PageContext de la page                     |

Pour chaque JSP qui utilise un ou plusieurs tags, la bibliothèque doit être déclarée avec une directive taglib

```jsp
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
```

### Le tag set

Le tag set permet de stocker une variable dans une portée particulière (page, requête, session ou application).

Exemple :

```jsp
<c:set var="maVariable1" value="valeur1" scope="page" />
<c:set var="maVariable2" value="valeur2" scope="request" />
<c:set var="maVariable3" value="valeur3" scope="session" />
<c:set var="maVariable4" value="valeur4" scope="application" />
```

### Le tag out

Le tag out permet d'envoyer dans le flux de sortie de la JSP le résultat de l'évaluation de l'expression fournie dans le paramètre " value ". Ce tag est équivalent au tag d'expression <%= ... %> de JSP.

```jsp
<c:out value='${pageScope.maVariable1}' />
<c:out value='${requestScope.maVariable2}' />
<c:out value='${sessionScope.maVariable 3}' />
<c:out value='${applicationScope.maVariable 4}' />
```

### Le tag remove

Le tag remove permet de supprimer une variable d'une portée particulière.

Exemple :

```jsp
<c:remove var="maVariable1" scope="page" />
<c:remove var="maVariable2" scope="request" />
<c:remove var="maVariable3" scope="session" />
<c:remove var="maVariable4" scope="application" />
```

### Le tag if

Ce tag permet d'évaluer le contenu de son corps si la condition qui lui est fournie est vraie.

Exmple :

```jsp
<c:if test="${empty personne.nom}" >Inconnu</c:if>
```

### Le tag catch

Ce tag permet de capturer des exceptions qui sont levées lors de l'exécution du code inclus dans son corps.

```jsp
<c:set var="valeur" value="abc" />
<c:catch var="erreur">
   <fmt:parseNumber var="valeurInt" value="${valeur}"/>
</c:catch>
<c:if test="${not empty erreur}">
   la valeur n'est pas numerique
</c:if>
```

### Le tag choose

Ce tag permet de traiter différents cas mutuellement exclusifs dans un même tag. Le tag choose ne possède pas d'attribut. Il doit cependant posséder un ou plusieurs tags fils « **when** ».

Le tag **when** possède l'attribut test qui permet de préciser la condition à évaluer. Si la condition est vraie alors le corps du tag when est évalué et le résultat est envoyé dans le flux de sortie de la JSP

```jsp
<c:choose>
  <c:when test="${personne.civilite == 'Mr'}">
    Bonjour Monsieur
  </c:when>
  <c:when test="${personne.civilite == 'Mme'}">
    Bonjour Madame
  </c:when>
  <c:when test="${personne.civilite == 'Mlle'}">
    Bonjour Mademoiselle
  </c:when>
  <c:otherwise>
    Bonjour
  </c:otherwise>
</c:choose>
```

### Le tag forEach

Ce tag permet de parcourir les différents éléments d'une collection et ainsi d'exécuter de façon répétitive le contenu de son corps.

```jsp
<c:forEach begin="1" end="4" var="i">
  <c:out value="${i}"/><br>
</c:forEach>
```

## JAVA JDBC API

- **JDBC** signifie Java Database Connectivity, qui est une API Java qui gère la connectivité indépendante de la BD entre le langage de programmation Java et un large éventail de bases de données (Oracle, Microsoft SQL Server, DB2…).
- Apps Java et les serveurs de bases de données relationnelles (bases de données relationnelles, feuilles de calcul et fichiers plats).

<p align=center>
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20200229213833/Architecture-of-JDBC2.jpg">
</p>

- L'API JDBC à utiliser par les programmeurs d'application (`java.sql`) pour accéder et traiter les données stockées dans une source de données à l'aide du langage de programmation Java.
- La deuxième partie est l'API de bas niveau pour se connecter à un SGBD (pilote JDBC driver) un ensemble de classes Java qui implémentent les interfaces JDBC, pour une base de données spécifique.
- L'installation d'un pilote JDBC consiste généralement à télécharger le pilote, puis
  ajouter l'emplacement de celui-ci à votre ClassPath .
- Pour connecter une application Java à la BD (exemple: MySQL):
  - Importer des packages **JDBC**
  - Ouvrir une connexion à la **BD**.
  - Créer un **statement object** pour lancer une requête.
  - Exécuter **statement object** et renvoyer result.
  - Traiter les `Resultset`.

Exemple:

```java
import java.sql.*;
public class FirstExample {

   static final String DB_URL = "jdbc:mysql://localhost/my_database";
   static final String USER = "root";
   static final String PASS = "";
   static final String QUERY = "SELECT id, first, last, age FROM Employees";

   public static void main(String[] args) {
      // Open a connection
      try{
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(QUERY);
         // Extract data from result set
         while (rs.next()) {
            // Retrieve by column name
            System.out.print("ID: " + rs.getInt("id"));
            System.out.print(", Age: " + rs.getInt("age"));
            System.out.print(", First: " + rs.getString("first"));
            System.out.println(", Last: " + rs.getString("last"));
         }
      }
      } catch (SQLException e) {
         e.printStackTrace();
   }
}
```

### Modèle DAO

Le modèle Data Access Object ou modèle DAO est utilisé pour séparer les API ou les opérations d'accès aux données de bas niveau des services métier de haut niveau.

#### Composants du modèles

<p align=center>
  <img src="https://i.ytimg.com/vi/bigYRPn8VMg/maxresdefault.jpg">
</p>
Voici les composants du modèle DAO (Data Access Object Pattern).

- **BusinessObject** : représente les données client . Il s'agit de l'objet qui doit accéder à la source de données pour obtenir et stocker des données. Un **BusinessObject** peut être implémenté sous la forme d'un bean de session, d'un bean d'entité ou d'un autre objet Java.
- **DataAccessObject** : est l'objet principal de ce modèle. Le **DataAccessObject** fait abstraction de la mise en œuvre sous-jacente de l'accès aux données pour le **BusinessObject** afin de permettre un accès transparent à la source de données.
- **DataSource** : Ceci représente la mise en œuvre d'une source de données. Une source de données peut être une base de données telle qu'un SGBDR, un SGBDO, un référentiel XML, etc. Une source de données peut également être un autre service système ou un repository.
- **TransferObject** : Ceci représente un **Transfer Object** utilisé comme support de données. Le DataAccessObject peut utiliser un Transfer Object pour renvoyer des données au client. Le **DataAccessObject** peut également recevoir les données du client dans un Transfer Object pour mettre à jour les données de la source de données.

Exemple :

```java

// Java program to illustrate Data Access Object Pattern

// Importing required classes
import java.util.ArrayList;
import java.util.List;

// Class 1
// Helper class
class Developer {

    private String name;
    private int DeveloperId;

    // Constructor of Developer class
    Developer(String name, int DeveloperId)
    {

        // This keyword refers to current instance itself
        this.name = name;
        this.DeveloperId = DeveloperId;
    }

    // Method 1
    public String getName() { return name; }

    // Method 2
    public void setName(String name) { this.name = name; }

    // Method 3
    public int getDeveloperId() { return DeveloperId; }

    // Method 4
    public void setDeveloperId(int DeveloperId)
    {
        this.DeveloperId = DeveloperId;
    }
}

// Interface
interface DeveloperDao {
    public List<Developer> getAllDevelopers();
    public Developer getDeveloper(int DeveloperId);
    public void updateDeveloper(Developer Developer);
    public void deleteDeveloper(Developer Developer);
}

// Class 2
// Implementing above defined interface
class DeveloperDaoImpl implements DeveloperDao {

    List<Developer> Developers;

    // Method 1
    public DeveloperDaoImpl()
    {
        Developers = new ArrayList<Developer>();
        Developer Developer1 = new Developer("Kushagra", 0);
        Developer Developer2 = new Developer("Vikram", 1);
        Developers.add(Developer1);
        Developers.add(Developer2);
    }

    // Method 2
    @Override
    public void deleteDeveloper(Developer Developer)
    {
        Developers.remove(Developer.getDeveloperId());
        System.out.println("DeveloperId "
                           + Developer.getDeveloperId()
                           + ", deleted from database");
    }

    // Method 3
    @Override public List<Developer> getAllDevelopers()
    {
        return Developers;
    }

    // Method 4
    @Override public Developer getDeveloper(int DeveloperId)
    {
        return Developers.get(DeveloperId);
    }

    // Method 5
    @Override
    public void updateDeveloper(Developer Developer)
    {
        Developers.get(Developer.getDeveloperId())
            .setName(Developer.getName());
        System.out.println("DeveloperId "
                           + Developer.getDeveloperId()
                           + ", updated in the database");
    }
}
```

#### Avantages

- L'avantage de l'utilisation le modèle DAO est la séparation relativement simple et rigoureuse entre deux parties importantes d'une application qui peuvent mais ne doivent rien savoir l'une de l'autre, et dont on peut s'attendre à ce qu'elles évoluent fréquemment et indépendamment.
- Si nous devons modifier le mécanisme de persistance sous-jacent, nous devons uniquement modifier la couche DAO et non pas tous les endroits de la logique du domaine où la couche DAO est utilisée.

## Java Server Faces

<p align=center>
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Jakarta_Server_Faces_logo.tiff/lossless-page1-640px-Jakarta_Server_Faces_logo.tiff.png">
</p>

Java Server Faces (JSF) est une technologie dont le but est de proposer un framework qui facilite et standardise le développement d'applications web avec Java. Son développement a tenu compte des différentes expériences acquises lors de l'utilisation des technologies standard pour le développement d'applications web (servlet, JSP, JSTL) et de différents frameworks (Struts, ...).

Le grand intérêt de JSF est de proposer un framework qui puisse être mis en oeuvre par des outils pour permettre un développement de type RAD pour les applications web et ainsi faciliter le développement des applications de ce type. Ce type de développement était déjà courant pour des applications standalone ou clients/serveurs lourds avec des outils tels que Delphi de Borland, Visual Basic de Microsoft ou Swing avec Java.

[learn More](https://www.oracle.com/java/technologies/javaserverfaces.html)

## Primefaces

<p align=center>
  <img src="https://i2.wp.com/primefaces.org/wp-content/uploads/2011/05/logo.png">
</p>

- [Official website](https://www.primefaces.org/)
