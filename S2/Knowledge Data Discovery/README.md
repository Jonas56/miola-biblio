# Data Mining

## Table of contents

- [Introduction](#introduction)
- [Data Preprocessing](#data-preprocessing)
- [Classification](#classification)
- [Prédiction](#)
- [Clustering](#)
- [Association](#)

## Ressources

- [Cours Prof](#)

## Introduction

<p align=center>
    <img src"https://imageio.forbes.com/specials-images/dam/imageserve/1092999918/0x0.jpg" alt="image">
</p>

Le terme KDD est l'abréviation de Knowledge Data Discovery. Il désigne la procédure générale de découverte de connaissances dans les données et met l'accent sur les applications de haut niveau de techniques spécifiques d'exploration de données. Il s'agit d'un domaine d'intérêt pour les chercheurs dans divers domaines, notamment l'intelligence artificielle, l'apprentissage automatique, la reconnaissance des formes, les bases de données, les statistiques, l'acquisition de connaissances pour les systèmes experts et la visualisation des données.

Le KDD est considéré comme une analyse et une modélisation programmées et exploratoires de vastes dépôts de données. Le KDD est la procédure organisée de reconnaissance de modèles valides, utiles et compréhensibles à partir d'ensembles de données énormes et complexes. L'exploration de données est à la base de la procédure KDD, y compris l'inférence d'algorithmes qui étudient les données, développent le modèle et trouvent des modèles précédemment inconnus. Le modèle est utilisé pour extraire les connaissances des données, analyser les données et prédire les données.

### Le process KDD

<p align=center>
    <img src"https://www.researchgate.net/profile/Ily-Ahmad-Sabri/publication/334784343/figure/fig1/AS:786618394886146@1564555848887/Knowledge-Discovery-Database-KDD-Process.png" alt="KDD">
</p>

Le processus KDD est itératif et interactif, et comprend neuf étapes. Le processus est itératif à chaque étape, ce qui implique qu'il peut être nécessaire de revenir sur les actions précédentes. Le processus comporte de nombreux aspects imaginatifs dans le sens où l'on ne peut pas présenter une formule ou faire une catégorisation scientifique complète pour les décisions correctes pour chaque étape et type d'application. Il est donc nécessaire de comprendre le processus et les différentes exigences et possibilités à chaque étape.

Le processus commence par la détermination des objectifs du KDD et se termine par la mise en œuvre des connaissances découvertes. À ce stade, la boucle est fermée et le Data Mining commence. Par la suite, des changements devront être apportés au domaine d'application. Par exemple, offrir diverses fonctionnalités aux utilisateurs de téléphones portables afin de réduire le taux de désabonnement. La boucle est ainsi fermée, et les impacts sont alors mesurés sur les nouveaux référentiels de données, et le processus KDD reprend. Voici une description concise du processus KDD en neuf étapes, qui commence par une étape de gestion :

- **Comprendre le domaine d'application** : Il s'agit de l'étape préliminaire initiale. Elle permet de comprendre ce qu'il faut faire avec les différentes décisions comme la transformation, les algorithmes, la représentation, etc. Les personnes en charge d'un projet KDD doivent comprendre et caractériser les objectifs de l'utilisateur final et l'environnement dans lequel le processus de découverte de connaissances se déroulera (ce qui implique des connaissances préalables pertinentes).
- **Choix et création d'un ensemble de données sur lequel la découverte sera effectuée** : Une fois les objectifs définis, il faut déterminer les données qui seront utilisées pour le processus de découverte de connaissances. Il s'agit de découvrir quelles sont les données accessibles, d'obtenir les données importantes, et ensuite d'intégrer toutes les données pour la découverte de connaissances sur un ensemble impliquant les qualités qui seront considérées pour le processus. Ce processus est important car le Data Mining apprend et découvre à partir des données accessibles. Il s'agit de la base de preuves pour la construction des modèles. Si certains attributs significatifs sont manquants, à ce moment-là, l'ensemble de l'étude risque d'échouer ; à cet égard, plus le nombre d'attributs pris en compte est important. D'autre part, l'organisation, la collecte et l'exploitation de référentiels de données avancés sont coûteuses, et il existe un arrangement avec la possibilité de mieux comprendre les phénomènes. Cet arrangement fait référence à un aspect où l'aspect interactif et itératif du KDD prend place. Cela commence par les meilleurs ensembles de données disponibles, puis s'étend et observe l'impact en termes de découverte de connaissances et de modélisation.
- **Preprocessing and cleansing** : Cette étape permet d'améliorer la fiabilité des données. Elle intègre l'apurement des données, par exemple, le traitement des quantités manquantes et la suppression du bruit ou des valeurs aberrantes. Elle peut inclure des techniques statistiques complexes ou utiliser un algorithme de Data Mining dans ce contexte. Par exemple, si l'on soupçonne qu'un attribut spécifique manque de fiabilité ou comporte de nombreuses données manquantes, cet attribut peut alors devenir l'objectif de l'algorithme supervisé de Data Mining. Un modèle de prédiction pour ces attributs sera créé, et ensuite, les données manquantes pourront être prédites. Le degré d'attention que l'on porte à ce niveau dépend de nombreux facteurs. Quoi qu'il en soit, l'étude de ces aspects est importante et révèle régulièrement, en soi, les frameworks de données d'entreprise.
- **Data Transformation** : A ce stade, la création de données appropriées pour le Data Mining est préparée et développée. Les techniques utilisées ici comprennent la réduction des dimensions (par exemple, la sélection et l'extraction des caractéristiques et l'échantillonnage des enregistrements), ainsi que la transformation des attributs (par exemple, la discrétisation des attributs numériques et la transformation fonctionnelle). Cette étape peut être essentielle pour le succès de l'ensemble du projet KDD, et elle est généralement très spécifique au projet. Par exemple, dans les évaluations médicales, le quotient des attributs peut souvent être le facteur le plus significatif et non chacun d'entre eux en soi. Dans le domaine des affaires, il se peut que nous devions penser à des impacts hors de notre contrôle ainsi qu'à des efforts et à des questions transitoires. Par exemple, étudier l'impact de l'accumulation de publicité. Cependant, si nous n'utilisons pas la bonne transformation au départ, nous pouvons obtenir un effet étonnant qui nous renseigne sur la transformation nécessaire à l'itération suivante. Ainsi, le processus KDD s'auto-alimente et permet de comprendre la transformation nécessaire.

- **Prédiction et description** : Nous sommes maintenant prêts à décider quel type de Data Mining utiliser, par exemple, classification, régression, clustering, etc. Cette décision repose principalement sur les objectifs du KDD et sur les étapes précédentes. Il y a deux objectifs importants dans le Data Mining, le premier est la prédiction, et le second la description. La prédiction est généralement appelée Data Mining supervisé, tandis que le Data Mining descriptif incorpore les aspects non supervisés et de visualisation du Data Mining. La plupart des techniques de Data Mining dépendent de l'apprentissage inductif, où un modèle est construit explicitement ou implicitement en généralisant à partir d'un nombre adéquat de modèles de préparation. L'hypothèse fondamentale de l'approche inductive est que le modèle préparé s'applique aux cas futurs. La technique prend également en compte le niveau de méta-apprentissage pour l'ensemble spécifique de données accessibles.
- **Sélection de l'algorithme de Data Mining** : Après avoir déterminé la technique, nous décidons maintenant des stratégies. Cette étape comprend le choix d'une technique particulière à utiliser pour la recherche de modèles comprenant plusieurs inducteurs. Par exemple, si l'on considère la précision par rapport à la compréhensibilité, la première est meilleure avec les réseaux neuronaux, tandis que la seconde est meilleure avec les arbres de décision. Pour chaque système de méta-apprentissage, il existe plusieurs possibilités de réussite. Le méta-apprentissage se concentre sur la clarification de ce qui fait qu'un algorithme d'exploration de données est fructueux ou non dans une question spécifique. Ainsi, cette méthodologie tente de comprendre la situation dans laquelle un algorithme de Data Mining est le plus approprié. Chaque algorithme possède des paramètres et des stratégies d'apprentissage, comme la validation croisée à dix plis ou une autre division pour la formation et le test.
- **Utilisation de l'algorithme de Data Mining**
- **Évaluation** : Dans cette étape, nous évaluons et interprétons les modèles, les règles et la fiabilité extraits par rapport à l'objectif caractérisé dans la première étape. Nous considérons ici les étapes de prétraitement pour leur impact sur les résultats de l'algorithme de Data Mining. Par exemple, l'inclusion d'une caractéristique à l'étape 4, et la répétition à partir de là. Cette étape se concentre sur la compréhensibilité et l'utilité du modèle induit. Dans cette étape, les connaissances identifiées sont également enregistrées pour une utilisation ultérieure. La dernière étape est l'utilisation, et le retour global et les résultats de découverte acquis par le Data Mining.
- **Utilisation des connaissances découvertes** : Maintenant, nous sommes prêts à inclure la connaissance dans un autre système pour une activité ultérieure. Les connaissances deviennent effectives dans le sens où nous pouvons apporter des changements au système et en mesurer les impacts. L'accomplissement de cette étape détermine l'efficacité de l'ensemble du processus KDD. Cette étape comporte de nombreux défis, comme la perte des"conditions de laboratoir" dans lesquelles nous avons travaillé. Par exemple, les connaissances ont été découvertes à partir d'une certaine représentation statique, généralement un ensemble de données, mais les données deviennent maintenant dynamiques. Les structures de données peuvent modifier certaines quantités qui deviennent indisponibles, et le domaine de données peut être modifié, par exemple un attribut peut avoir une valeur qui n'était pas prévue auparavant.

## Data Preprocessing

<p align=center>
    <img src"https://assets-global.website-files.com/5d7b77b063a9066d83e1209c/61f7bfab94334458028eec7d_data-preprocessing-cover.png" alt="data-preprocessing" >
</p>

Le prétraitement des données (Data Preprocessing) comprend les étapes que nous devons suivre pour transformer ou coder les données afin qu'elles puissent être facilement analysées par la machine.

Pour qu'un modèle soit exact et précis dans ses prédictions, il faut que l'algorithme soit capable d'interpréter facilement les caractéristiques des données.

La majorité des ensembles de données du monde réel sont très sensibles aux données manquantes, incohérentes et noisy en raison de leur origine hétérogène.

L'application d'algorithmes de data mining sur ces données bruitées ne donnerait pas de résultats de qualité car ils ne parviendraient pas à identifier efficacement les modèles. Le traitement des données est donc important pour améliorer la qualité globale des données.

Maintenant, examinons plus en détail les quatre principales étapes du prétraitement des données.

### Data Cleaning

Le Data Cleaning est particulièrement effectué dans le cadre du prétraitement des données pour nettoyer les données en remplissant les valeurs manquantes, en lissant les données bruyantes, en résolvant les incohérences et en supprimant les valeurs aberrantes (outliers).

- **Missing values** :
  - Des valeurs standard comme"N/" ou"NUL" peuvent être utilisées pour remplacer les valeurs manquantes.
  - Les valeurs manquantes peuvent également être remplies manuellement mais cela n'est pas recommandé lorsque l'ensemble de données est important.
  - La valeur moyenne de l'attribut peut être utilisée pour remplacer la valeur manquante lorsque les données sont normalement distribuées.
  - Dans le cas d'une distribution non-normale, la valeur médiane de l'attribut peut être utilisée.
  - En utilisant les algorithmes de régression ou d'arbre de décision, la valeur manquante peut être remplacée par la valeur la plus probable.
- **Noisy Data** :
  - Le terme"nois" désigne généralement une erreur aléatoire ou la présence de points de données inutiles. Voici quelques méthodes permettant de traiter les données bruyantes.
  - _Binning_ : Cette méthode permet de lisser ou de traiter des données bruyantes. Tout d'abord, les données sont triées, puis les valeurs triées sont séparées et stockées sous forme de bins. Il existe trois méthodes pour lisser les données dans le bin. **Lissage par la méthode de la moyenne des bins** (Smoothing by bin mean method) : Dans cette méthode, les valeurs dans le bin sont remplacées par la valeur moyenne du bin ; **Lissage par la médiane du bin** (Smoothing by bin median) : Dans cette méthode, les valeurs du bin sont remplacées par la valeur médiane ; **Lissage par la limite du bin** (Smoothing by bin boundary): Dans cette méthode, les valeurs minimum et maximum des valeurs du bin sont prises et les valeurs sont remplacées par la valeur limite la plus proche.
  - _Regression_ : Il est utilisé pour lisser les données et aidera à traiter les données lorsque des données inutiles sont présentes. Pour l'analyse, la régression par objectif permet de décider de la variable qui convient à notre analyse.
  - _Clustering_ : Il est utilisé pour trouver les valeurs aberrantes et aussi pour regrouper les données. Le clustering est généralement utilisé dans l'apprentissage non supervisé.

### Data integration

Le processus consistant à combiner plusieurs sources en un seul ensemble de données. Le processus d'intégration des données est l'un des principaux composants de la gestion des données. Certains problèmes doivent être pris en compte lors de l'intégration des données.

- **Schema integration**: Intégration de métadonnées (ensemble de données qui décrivent d'autres données) provenant de différentes sources.
- **Entity identification problem** : Identifier des entités à partir de plusieurs bases de données. Par exemple, le système ou l'utilisation doit savoir que l'étudiant \_id d'une base de données et l'étudiant_name d'une autre base de données appartiennent à la même entité.
- **Detecting and resolving data value concepts**

### Data Transformation

La modification apportée au format ou à la structure des données est appelée transformation des données. Cette étape peut être simple ou complexe en fonction des besoins. Il existe plusieurs méthodes de transformation des données.

- **Smoothing** : Avec l'aide d'algorithmes, nous pouvons éliminer le bruit de l'ensemble de données et aider à connaître les caractéristiques importantes de l'ensemble de données. En lissant, nous pouvons trouver même un simple changement qui aide à la prédiction.
- **Aggregation** : Dans cette méthode, les données sont stockées et présentées sous la forme d'un résumé. Les bases de données provenant de sources multiples sont intégrées dans la description de l'analyse des données. Il s'agit d'une étape importante car la précision des données dépend de leur quantité et de leur qualité. Lorsque la qualité et la quantité des données sont bonnes, les résultats sont plus pertinents.
- **Discretization** : Les données continues sont ici découpées en intervalles. La discrétisation permet de réduire la taille des données. Par exemple, plutôt que de spécifier l'heure de la classe, nous pouvons définir un intervalle comme (15h-17h, 18h-20h).
- **Normalization** :
  - Cette étape a pour but de transformer les données en formes appropriées pour le processus d'extraction.
  - Dans le processus de normalisation, les données d'attribut sont mises à l'échelle de manière à se situer dans un intervalle plus petit, tel que [-1,1] ou [0,1], pour donner à tous les attributs un poids égal.
  - Il existe de nombreuses méthodes de normalisation des données, mais **Min-max** et **Z-score** sont deux des techniques les plus couramment utilisées :

### Data Reduction

Ce processus aide à réduire le volume des données, ce qui facilite l'analyse tout en produisant le même résultat ou presque. Cette réduction permet également de réduire l'espace de stockage.

- **Feature Selection** : c'est le processus par lequel vous sélectionnez automatiquement ou manuellement les features qui contribuent le plus à la variable de prédiction ou au résultat qui vous intéresse. La présence de caractéristiques non pertinentes dans vos données peut diminuer la précision des modèles et faire en sorte que votre modèle apprenne sur la base de caractéristiques non pertinentes. Les techniques de sélection des caractéristiques sont généralement classées comme suit :
  - [Filter](https://www.analyticsvidhya.com/blog/2016/12/introduction-to-feature-selection-methods-with-an-example-or-how-to-select-the-right-variables/)
  - [Wrapper](https://www.analyticsvidhya.com/blog/2016/12/introduction-to-feature-selection-methods-with-an-example-or-how-to-select-the-right-variables/)
  - [Embedded](https://www.analyticsvidhya.com/blog/2016/12/introduction-to-feature-selection-methods-with-an-example-or-how-to-select-the-right-variables/)
- [**Feature Extraction**](https://www.analyticsvidhya.com/blog/2021/04/guide-for-feature-extraction-techniques/#:~:text=The%20feature%20Extraction%20technique%20gives,to%20capture%20the%20same%20information.) : Trouver de nouvelles caractéristiques qui sont calculées en fonction des caractéristiques originales. L'extraction de caractéristiques transforme les données d'un espace à haute dimension en un espace à plus petite dimension en utilisant une combinaison linéaire ou non linéaire des caractéristiques originales.

## Classification

<p>
  <img src"https://miro.medium.com/max/1400/1*PM4dqcAe6N7kWRpXKwgWag.png" alt="classification">
</p>

La classification est une forme d'analyse des données qui permet d'extraire des modèles décrivant des classes de données importantes. Ces modèles, appelés classificateurs, prédisent des étiquettes de classe catégoriques (discrètes, non ordonnées). Par exemple, nous pouvons construire un modèle de classification pour classer les demandes de crédit bancaire comme sûres ou risquées. Une telle analyse peut nous permettre de mieux comprendre les données dans leur ensemble. De nombreuses méthodes de classification ont été proposées par des chercheurs en machine learning, en pattern recognition et en statistiques. La plupart des algorithmes sont résidents en mémoire et supposent généralement une petite taille de données. La recherche récente en fouille de données s'est appuyée sur ces travaux pour développer des techniques de classification et de prédiction évolutives capables de traiter de grandes quantités de données résidant sur disque. La classification a de nombreuses applications, notamment la détection des fraudes, le marketing ciblé, la prédiction des performances, la fabrication et le diagnostic médical.

### C'est quoi la classification

Un responsable des crédits d'une banque a besoin d'une analyse de ses données pour savoir quels demandeurs de prêts sont "sans risques" et lesquels sont "risqués" pour la banque. Un responsable du marketing a besoin d'une analyse des données pour deviner si un client ayant un profil donné va acheter un nouvel ordinateur. Un chercheur médical souhaite analyser les données relatives au cancer du sein pour prédire lequel des trois traitements spécifiques une patiente devrait recevoir. Dans chacun de ces exemples, la tâche d'analyse des données est la **classification**, où un modèle ou un **classificateur** (classifier) est construit pour prédire les étiquettes de classe (catégoriques), telles que "sans risques" ou "risqués" pour les données de demande de prêt ; "oui"ou "non" pour les données de marketing ; ou "traitement A", "traitement B" ou "traitement C" pour les données médicales. Ces catégories peuvent être représentées par des valeurs discrètes, où l'ordre entre les valeurs n'a aucune signification. Par exemple, les valeurs 1, 2 et 3 peuvent être utilisées pour représenter les traitements A, B et C, sans qu'il y ait d'ordre implicite parmi ce groupe de régimes de traitement.

Supposons que le responsable marketing veuille prédire combien un client donné dépensera lors d'une promotion. Cette tâche d'analyse de données est un exemple de **prédiction numérique**, où le modèle construit prédit une fonction à valeur continue, ou une valeur ordonnée, par opposition à une étiquette de classe. Ce modèle est un prédicteur. **L'analyse de régression** est une méthodologie statistique qui est le plus souvent utilisée pour la prédiction numérique; c'est pourquoi les deux termes tendent à être utilisés comme synonymes, bien qu'il existe d'autres méthodes de prédiction numérique. La classification et la prédiction numérique sont les deux principaux types de **problèmes de prédiction**.

### Techniques de classification

- **Techniques brutes (Lazy techniques)** :
  - ne comprennent qu'une seule étape (éventuellement réitérée), au cours de laquelle chaque individu est directement classé (ou objet d'une prédiction) par référence aux autres individus déjà classés
  - `il n'y a pas élaboration d'un modèle`
- **Techniques inductives (Eager techniques)**:
  - une phase d’apprentissage `(phase inductive)` pour élaborer un modèle, qui résume les relations entre les variables et qui peut ensuite être appliquée à de nouvelles données pour en déduire un classement ou une prédiction `(phase déductive)`

### KNN : K-Nearest Neighbors

K-nearest neighbors (KNN) est un type d'algorithme d'apprentissage supervisé utilisé à la fois pour la régression et la classification. KNN essaie de prédire la classe correcte pour les données de test en calculant la distance entre les données de test et tous les points de qualification. Ensuite, on sélectionne le nombre K de points qui sont proches des données de test. L'algorithme KNN calcule la probabilité que les données de test appartiennent aux classes de 'K' données d'apprentissage et la classe qui détient la probabilité la plus élevée sera sélectionnée.

#### Comment fonctionne le K-NN ?

Le fonctionnement de K-NN peut être expliqué sur la base de l'algorithme ci-dessous :

- Étape 1 : Sélectionner le nombre K de voisins.
- Étape 2 : Calculer la distance euclidienne du nombre K de voisins.
- Étape 3 : Prenez les K voisins les plus proches selon la distance euclidienne calculée.
- Étape 4 : Parmi ces K voisins, compter le nombre de points de données dans chaque catégorie.
- Étape 5 : Attribuez les nouveaux points de données à la catégorie pour laquelle le nombre de voisins est maximal.

<p align=center>
<img src="https://miro.medium.com/max/1400/0*34SajbTO2C5Lvigs.png" width=700>
</p>

#### Comment puis-je déterminer une bonne valeur pour k, le nombre de voisins ?

Ceci peut être déterminé expérimentalement. En commençant par k = 1, nous utilisons un ensemble de test pour estimer le taux d'erreur du classificateur. Ce processus peut être répété à chaque fois en incrémentant k pour tenir compte d'un voisin supplémentaire. On peut choisir la valeur de k qui donne le taux d'erreur minimal. En général, plus le nombre de tuples d'apprentissage est important, plus la valeur de k sera grande (de sorte que les décisions de classification et de prédiction numérique puissent être basées sur une plus grande partie des tuples stockés). Lorsque le nombre de tuples d'apprentissage approche de l'infini et que k = 1, le taux d'erreur ne peut être inférieur au double du [taux d'erreur de Bayes](https://en.wikipedia.org/wiki/Bayes_error_rate#:~:text=In%20statistical%20classification%2C%20Bayes%20error,the%20Bayes%20error%20rate%20exist.) (ce dernier étant le minimum théorique). Si k approche également de l'infini, le taux d'erreur se rapproche du [taux d'erreur de Bayes](https://en.wikipedia.org/wiki/Bayes_error_rate#:~:text=In%20statistical%20classification%2C%20Bayes%20error,the%20Bayes%20error%20rate%20exist.).

### Distances

Les classificateurs de type "plus proche voisin" utilisent des comparaisons basées sur la distance qui, intrinsèquement, attribuent un poids égal à chaque attribut. Ils peuvent donc souffrir d'une faible précision lorsqu'ils reçoivent des attributs bruyants ou non pertinents. La méthode a toutefois été modifiée pour intégrer la pondération des attributs et l'élagage des tuples de données bruyants. Le choix d'une métrique de distance peut être critique. La distance de Manhattan (bloc de ville), ou d'autres mesures de distance, peuvent également être utilisées.

Les classificateurs de plus proches voisins peuvent être extrêmement lents lorsqu'ils classent des tuples de test. Si D est une base de données d'apprentissage de |D| tuples et k = 1, O(|D|) comparaisons sont nécessaires pour classer un tuples de test donné. En triant et en organisant les tuples stockés dans des arbres de recherche, le nombre de comparaisons peut être réduit à O(log(|D|)). La mise en œuvre parallèle peut réduire le temps d'exécution à une constante, c'est-à-dire O(1), qui est indépendante de |D|.

D'autres techniques pour accélérer le temps de classification comprennent l'utilisation de calculs de distance partielle et l'édition des tuples stockés. Dans la méthode de la distance partielle, nous calculons la distance sur la base d'un sous-ensemble des n attributs. Si cette distance dépasse un seuil, la poursuite du calcul pour le tuple stocké donné est interrompue et le processus passe au tuple stocké suivant. La méthode d'édition supprime les tuples de formation qui s'avèrent inutiles. Cette méthode est également appelée élagage ou condensation car elle réduit le nombre total de tuples stockés.

### Arbres de décision (Decision Trees)

L'induction d'arbres de décision est l'apprentissage d'arbres de décision à partir de tuples d'apprentissage étiquetés par classe. Un arbre de décision est une structure arborescente, dans laquelle chaque noeud interne (noeud non-feuille) représente un test sur un attribut, chaque branche représente un résultat du test, et chaque noeud feuille (ou noeud terminal) contient une étiquette de classe. Le noeud le plus haut dans un arbre est le noeud racine.

<p>
  <img src="https://venngage-wordpress.s3.amazonaws.com/uploads/2019/08/what-is-a-decision-tree-5.png">
</p>

- _"Comment les arbres de décision sont-ils utilisés pour la classification?"_ Étant donné un tuple, **X**, pour lequel l'étiquette de classe associée est inconnue, les valeurs d'attribut du tuple sont testées par rapport à l'arbre de décision. Un chemin est tracé de la racine à un nœud feuille, qui contient la prédiction de classe pour ce tuple. Les arbres de décision peuvent facilement être convertis en règles de classification.

- _"Pourquoi les classificateurs à arbre de décision sont-ils si populaires ?"_ La construction des classificateurs à arbre de décision ne nécessite aucune connaissance du domaine ni aucun paramétrage, et convient donc à la découverte exploratoire de connaissances. Les arbres de décision peuvent traiter des données multidimensionnelles. Leur représentation des connaissances acquises sous forme d'arbre est intuitive et généralement facile à assimiler par les humains. Les étapes d'apprentissage et de classification de l'induction par arbre de décision sont simples et rapides. En général, les classificateurs à base d'arbres de décision ont une bonne précision. Toutefois, la réussite de leur utilisation peut dépendre des données dont ils disposent. Les algorithmes d'induction d'arbres de décision ont été utilisés pour la classification dans de nombreux domaines d'application tels que la médecine, la fabrication et la production, l'analyse financière, l'astronomie et la biologie moléculaire. Les arbres de décision sont à la base de plusieurs systèmes commerciaux d'induction de règles.
