### Flutter `flutter.dev`

- Pour l'installer on.. `git` puis on téléchage le `sdk` qui.. le langage `Dart` et les outils de compilation via `docs.flutter.dev/install` l'archive `flutter_windows_<version>-stable.zip` extraire le zip et l'ajouter au `Path`
    > On.. l'installer dans `Vscode` via les extensions et `CTRL + Shift + p` .. `>flutter` pour utiliser les commandes
    > !! sur `Android` on installe `Android Studio` qui a un émulateur `Virtual Device Manager` et va automatiquement télécharger les `Sdk` puis l'ajouter au `Path`
        > Si on fais une installation `Custom` il faudra ajouter le `Sdk` d'android au `Path` avec le nom `ANDROID_HOME`
        > !! certaines licences android n'ont pas été acceptées on.. `flutter doctor --android-licenses`
        > On.. installé les `Command-line Tools` dans les paramètres de `Android Studio` - `Languages & Frameworks` - `Android SDK` - `SDK Tools` - `Android SDK Command-line Tools`
    > !! installer `flutter` avec `Android Studio` directement en.. le plugin `Flutter` et on pourra créer de nouveu projet
- !! voir les ressources d'apprentissage `docs.flutter.dev/reference/learning-resources`
- !! en apprendre plus sur le `codelabs.developers.google.com`
- !! le lien des composants `api.flutter.dev`
- !! un émulateur `Android` ou simulateur `Ios` pour tester ou un téléphone en mode développeur
- On.. des `snippets` pour créér des stateful et stateles widget
    > `stful` raccourci pour créer un stateful widget

- **Command**
    > flutter doctor : Pour vérifier que tout est bien configuré sur la machine
    > flutter create .. : !! créer un projet
    > flutter run : !! démarrer le serveur
    > flutter devices : !! trouver les mobile disponible
- 

- Le principe.. de pouvoir compiler une seule base de code pour plusieurs plateformes `Android`, `Web`, `Windows`, `MacOS` et `Linux`
    > N'utilise pas de composants natifs comme `React Native` mais dessine chaque pixel de l'interface à l'écran du genre un jeu vidéo lui même grâce à son propre moteur de rendu `Skia` puis maintenant `Impeller` ce qui donne une apparence identique sur toutes les plateformes
    > Les performances sont très bonnes, autour de 60 à 120 images par seconde vu qu'il n'y a pas de `pont` à traverser entre le code et les composants natifs

- Struc..
    > `lib/..` le point d'entrée de l'application
    > `android/` le projet natif `Android` généré
    > `test/` pour les tests

- La configuration `pubspec.yaml` pour gérer les dépendances et configuration du genre `package.json`
    > `uses-material-design: true` pour indiquer qu'on utilise le `Material Design`

- Dans le `main.dart` on a `MaterialApp()` qui permet d'envelopper en racine pour appliquer le thème visuel `Material Design` de `Google`, là dedans on..
    > Un `title`
    > !! `theme`
    > !! `home` qui contient un `Scaffold()` qui est une structure de base d'un écran du genre barre du haut, corps.. une page blanche si vide dans lequel on a..
        > !! `appBar` la bare de navigation
        > !! `body` puis une constante `Center` qui centre du texte

- Le `hot reload` et on.. `r` dans la console
    > `hot restart` pour redémarrer l'application en cours d'exécution et réinitialiser son état via `R` dans la console
    > Pour le rendre automatique dans `VsCode` on.. via 2 réglages dans `settings.json` le `"files.autoSave": "afterDelay"` o et `"dart.flutterHotReloadOnSave": "all"`
        > !! que ça fonctionne on doit activer le débogage via le menu `Exécuter > Démarrer le débogage` au lieu du `flutter run` sinon `VsCode` ne sera pas connecté à l'application, vu que seule applications en mode `debug` peuvent être rechargées à chaud et non en mode `release` ou `profile`
        > !! modifie le `main()`, `initState()`.. la valeur initiale d'une variable globale ou statique on.. relancer l'application via le bouton vert circulaire de la barre de débogage

- En `Flutter` tout ce qui compose l'interface est en `widget` du genre un `bouton`, `marge`, `animation`.. qui s'emboîtent les uns dans les autres et il n'y a pas de `css` séparé
    > Le widget `Column` pour empiler des widgets verticalement, utile.. formulaires, listes, menus
    > !! `Row` !! les alignés horizontalement, utile.. barres d'outils, menus
    > !! `Container` !! regrouper d'autres widgets et de leur appliquer des propriétés comme la taille, la couleur..
    > !! `Padding`, `Center` et `Expanded` !! ajuster l'espace
    > !! `Text` !! afficher du texte à l'écran
    > !! `Icon` !! une icône à l'écran
    > !! `Button` !! d'interagir avec l'utilisateur en déclenchant une action lorsqu'il est pressé et on a des types..
        > `ElevatedButton`, `TextButton`, `IconButton`..
    > !! `Image` !! d'afficher une image à l'écran, `.network` distant
    > !! `Listview` !! une liste d'éléments à l'écran utile pour les collections de données d'artciles.. et peut être défilé verticalement ou horizontalement
    > !! `Gridview` !! une grille d'éléments à l'écran utile pour les collections de données de photos..
    > !! `Stack` !! superposer plusieurs widgets les uns sur les autres utile pour créer des mises en page complexes du genre des cartes, animations..

- !! on a 2 types de widgets, pour créer un composant on étend du `StatelessWidget` ou `StatefulWidget`
    > Le `StatelessWidget` est un widget qui ne change pas d'état, utilisé créer des widgets qui ne dépendent pas de l'état de l'application `statiques` du genre un texte, bouton..
    > !! `StatefulWidget` !! utilisé pour créer des widgets qui sont dynamiques et peuvent changer d'apparence ou de comportement en fonction de l'état de l'application du genre via un compteur
        > `setState()` pour mettre à jour l'état du widget, va prendre une fonction en paramètre et quand elle est exécutée le widget est reconstruit avec le nouvel état, sans lui la variable changerait bien en mémoire mais rien ne se rafraîchirait à l'écran

- Pour utiliser des packages externes `pub.dev`, 
    > `flutter pub get` !! les nouveaux packages ajoutés manuelement
    > `dart pub add package` ou `flutter pub add package` pour télécharger un package, va ajouter la dépendance dans `pubspec.yaml` - `dependencies`

- !! la navigation
    > `Navigator` gère une pile contenant les routes de l'application, le fait d'intégrer une route à la pile du `Navigator` met à jour l'affichage vers cette route et le fait d'en retirer une route renvoie l'affichage à la route précédente, dans `pages/`
    > Ou.. via le nom des pages `MyWidget` - `MaterialApp()` - `routes` puis dans `home.dart`
    > On.. dans le `Scaffold()` la `bottomNavigationBar` pour la barre navigation en bas, dans `AppLayout.dart` et le `drawer` dans `home.dart`
        > `bottomNavigationBar` s'utilise dans `StatefulWidget` vu qu'il change l'état de la page
- !! les formulaires `contact.dart`
- !! qu'une image soit pris en compte on doit l'ajouter au `pubspec.yaml` - `assets..`, dans `widget.dart`
- !! appeler une api `Network` on doit déclarer l'utilisation d'internet dans le `manifeste`
    > `AndroidManifest.xml` pour `Android` on.. `<uses-permission android:name="android.permission.INTERNET" />`
    > On.. le package `http` puis dans `lib/api`, `args/`



- Pour éviter que la touche retour sort de l'application.. doit retourner sur la vue précédente `AppLayout`


final title : une fois définie ne bougera plus

flutter pub add intl : Pour formatter une date

Pour formatter une date avec la locale du système, dans `main.dart` puis on a utilisé dans `WeatherDetailPage.dart`
  > librairie : flutter_localizations
!! personnaliser les thèmes `Theme.dart`

Pour gérer les animations, via `AnimatedList`

- Pour un bottomNavBar jolie on a le package `google_nav_bar`
- Le sélecteur chips.. est un widget qui permet de choisir un élément parmis plusieurs `ChoiceChip`
- Le widget `Stack` permet de superposé des éléments
- !! `Positioned` pour positionner un élément
- !! `TabBar` pour navaguer entre plusieurs sections
- !! `Wrap` permet d'envelopper tous les éléments d'une ligne ou colonne et de les faire apparaître les uns à la suite des autres, peremt aussi de régler le problème de déborderment d'overflow
- !! `ReorderableListView` pour créer une liste réordonnable
- !! `FittedBox` pour adapter un élément à son parent du genre un texte trop grand 
- Pour utiliser la caméra de notre android ou ios on a le package `image_picker`







petite vue : vuejs en léger






- - 
## 6. Gestion d'état à plus grande échelle

Pour une petite app, `setState` suffit. Mais dès que l'état doit être partagé entre plusieurs écrans, les solutions courantes sont :

- **Provider** — la plus simple à apprendre, recommandée pour débuter
- **Riverpod** — une évolution plus robuste de Provider
- **Bloc** — plus structuré, basé sur des flux d'événements, adapté aux grosses apps

Pour débuter, je conseille de rester avec `setState` le temps de bien comprendre les widgets, puis de passer à **Provider**.

## 7. Un chemin d'apprentissage réaliste

1. Comprends bien la différence Stateless / Stateful et `setState`
2. Apprends les widgets de layout de base (Row, Column, Container, ListView)
3. Fais une petite app avec navigation entre 2-3 écrans (`Navigator.push`)
4. Ajoute une gestion d'état simple avec Provider
5. Connecte-la à une API (avec le package `http`)



**`Compteur`** est un `StatefulWidget`, et c'est la partie la plus déroutante au début : il est séparé en **deux classes**. La première, `Compteur`, est elle-même immuable. Elle sert juste à créer son objet d'état via `createState()`. La seconde, `_CompteurState`, contient les données qui changent (`_valeur`) et la méthode `build()`. Pourquoi cette séparation ? Parce que Flutter reconstruit très souvent les widgets, alors que l'objet `State` est **conservé** entre les reconstructions. C'est ce qui permet à la valeur du compteur de survivre.







Parfait ! Je te propose de construire une **liste de tâches (Todo List)** — c'est l'exercice classique parce qu'il couvre à peu près tous les concepts essentiels : StatefulWidget, `setState`, listes, formulaires, et suppression d'éléments.

## Étape 1 : la structure de départ

On part sur un `StatefulWidget` qui contient une liste de tâches en mémoire.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mes tâches',
      home: const TodoScreen(),
    );
  }
}
```

## Étape 2 : l'écran principal avec état

```dart
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _taches = [];
  final TextEditingController _controller = TextEditingController();

  void _ajouterTache() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _taches.add(_controller.text.trim());
      _controller.clear();
    });
  }

  void _supprimerTache(int index) {
    setState(() {
      _taches.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Nouvelle tâche...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _ajouterTache,
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _taches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_taches[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _supprimerTache(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

## Ce qui se passe ici, ligne par ligne

- **`_taches`** : notre "base de données" temporaire, une simple liste en mémoire
- **`TextEditingController`** : récupère ce que l'utilisateur tape dans le champ de texte
- **`_ajouterTache()`** : appelle `setState()`, ce qui déclenche un nouveau `build()` → la liste affichée se met à jour automatiquement
- **`ListView.builder`** : au lieu de créer tous les éléments d'un coup, il ne construit que les lignes visibles à l'écran — essentiel pour les longues listes (performance)
- **`ListTile`** : un widget tout fait pour afficher une ligne (titre + icône), très utilisé dans les listes

## Pour tester

1. Colle ce code dans `lib/main.dart`
2. Lance `flutter run` (ou clique sur "Run" dans ton éditeur)
3. Modifie un texte et sauvegarde → observe le **hot reload** qui met à jour l'app sans redémarrer

Est-ce que tu veux qu'on ajoute une fonctionnalité ensuite (par exemple cocher une tâche comme "faite", ou sauvegarder les tâches pour qu'elles survivent à la fermeture de l'app) ?











Je vais faire les deux, dans l'ordre logique : d'abord **cocher une tâche comme faite**, puis **la sauvegarder** pour qu'elle survive à la fermeture de l'app.

## Étape 3 : cocher une tâche comme faite

Pour ça, il faut changer la structure de données. Une simple `List<String>` ne suffit plus car chaque tâche doit maintenant porter deux informations : son texte **et** son état (faite ou pas). On crée donc une petite classe.

```dart
class Tache {
  String titre;
  bool estFaite;

  Tache({required this.titre, this.estFaite = false});
}
```

Et on adapte l'écran :

```dart
class _TodoScreenState extends State<TodoScreen> {
  final List<Tache> _taches = [];
  final TextEditingController _controller = TextEditingController();

  void _ajouterTache() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _taches.add(Tache(titre: _controller.text.trim()));
      _controller.clear();
    });
  }

  void _supprimerTache(int index) {
    setState(() {
      _taches.removeAt(index);
    });
  }

  void _basculerEtat(int index) {
    setState(() {
      _taches[index].estFaite = !_taches[index].estFaite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Nouvelle tâche...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _ajouterTache,
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _taches.length,
              itemBuilder: (context, index) {
                final tache = _taches[index];
                return ListTile(
                  leading: Checkbox(
                    value: tache.estFaite,
                    onChanged: (_) => _basculerEtat(index),
                  ),
                  title: Text(
                    tache.titre,
                    style: TextStyle(
                      decoration: tache.estFaite
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: tache.estFaite ? Colors.grey : Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _supprimerTache(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

**Ce qui change :** `Checkbox` affiche l'état `estFaite`, et `onChanged` appelle `_basculerEtat` qui inverse la valeur via `setState`. Le style barré (`TextDecoration.lineThrough`) donne le visuel classique de tâche terminée.

## Étape 4 : sauvegarder les tâches

Pour la persistance, le plus simple est le package **`shared_preferences`** — un stockage clé-valeur local, parfait pour des données simples comme une liste de tâches.

**Ajoute la dépendance** dans `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
```

Puis lance `flutter pub get`.

**On sérialise les tâches en JSON** pour pouvoir les stocker sous forme de texte :

```dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Tache {
  String titre;
  bool estFaite;

  Tache({required this.titre, this.estFaite = false});

  Map<String, dynamic> toJson() => {'titre': titre, 'estFaite': estFaite};

  factory Tache.fromJson(Map<String, dynamic> json) =>
      Tache(titre: json['titre'], estFaite: json['estFaite']);
}
```

Et on ajoute le chargement/sauvegarde dans l'écran :

```dart
class _TodoScreenState extends State<TodoScreen> {
  List<Tache> _taches = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chargerTaches();
  }

  Future<void> _chargerTaches() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('taches');
    if (data != null) {
      final List decoded = jsonDecode(data);
      setState(() {
        _taches = decoded.map((e) => Tache.fromJson(e)).toList();
      });
    }
  }

  Future<void> _sauvegarderTaches() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(_taches.map((t) => t.toJson()).toList());
    await prefs.setString('taches', data);
  }

  void _ajouterTache() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _taches.add(Tache(titre: _controller.text.trim()));
      _controller.clear();
    });
    _sauvegarderTaches();
  }

  void _supprimerTache(int index) {
    setState(() {
      _taches.removeAt(index);
    });
    _sauvegarderTaches();
  }

  void _basculerEtat(int index) {
    setState(() {
      _taches[index].estFaite = !_taches[index].estFaite;
    });
    _sauvegarderTaches();
  }

  // ... le build() reste identique à celui de l'étape 3
}
```

## Points importants à retenir

- **`initState()`** : s'exécute une seule fois, à la création du widget — c'est l'endroit idéal pour charger des données au démarrage
- **`async` / `await`** : les opérations de stockage sont asynchrones (elles prennent un peu de temps), donc on utilise `Future` et `await`
- On sauvegarde après **chaque** modification (ajout, suppression, coche) pour ne jamais perdre l'état

Tu as maintenant une vraie petite app fonctionnelle : ajout, suppression, coche, et persistance des données.

Veux-tu qu'on passe à l'étape suivante — par exemple ajouter une navigation vers un écran de détail par tâche, ou connecter l'app à une vraie API au lieu du stockage local ?











Allons-y pour la **navigation vers un écran de détail** — c'est un concept fondamental en Flutter (comment passer d'un écran à un autre), donc plus utile à maîtriser en premier avant de connecter une API.

## Étape 5 : navigation vers un écran de détail

L'idée : quand on tape sur une tâche, on ouvre un nouvel écran qui affiche plus d'informations et permet de la modifier.

### On enrichit d'abord notre modèle

Ajoutons une description à chaque tâche :

```dart
class Tache {
  String titre;
  String description;
  bool estFaite;

  Tache({required this.titre, this.description = '', this.estFaite = false});

  Map<String, dynamic> toJson() =>
      {'titre': titre, 'description': description, 'estFaite': estFaite};

  factory Tache.fromJson(Map<String, dynamic> json) => Tache(
        titre: json['titre'],
        description: json['description'] ?? '',
        estFaite: json['estFaite'],
      );
}
```

### Le nouvel écran de détail

```dart
class DetailScreen extends StatefulWidget {
  final Tache tache;

  const DetailScreen({super.key, required this.tache});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _descController = TextEditingController(text: widget.tache.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.tache.titre)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.tache.estFaite ? 'Statut : Terminée' : 'Statut : En cours',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              onChanged: (valeur) {
                widget.tache.description = valeur;
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

### On modifie l'écran principal pour naviguer

Dans le `ListTile`, on ajoute un `onTap` :

```dart
return ListTile(
  leading: Checkbox(
    value: tache.estFaite,
    onChanged: (_) => _basculerEtat(index),
  ),
  title: Text(
    tache.titre,
    style: TextStyle(
      decoration: tache.estFaite
          ? TextDecoration.lineThrough
          : TextDecoration.none,
      color: tache.estFaite ? Colors.grey : Colors.black,
    ),
  ),
  trailing: IconButton(
    icon: const Icon(Icons.delete, color: Colors.red),
    onPressed: () => _supprimerTache(index),
  ),
  onTap: () async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(tache: tache)),
    );
    _sauvegarderTaches(); // au retour, on sauvegarde si la description a changé
    setState(() {}); // rafraîchit l'affichage au retour
  },
);
```

## Ce qui se passe ici

- **`Navigator.push`** : empile un nouvel écran par-dessus l'actuel (comme une pile de cartes). L'utilisateur peut revenir en arrière avec la flèche ou le geste natif
- **`MaterialPageRoute`** : définit la transition standard (glissement depuis la droite sur iOS/Android)
- **`await Navigator.push(...)`** : le code s'arrête ici jusqu'à ce que l'utilisateur revienne du `DetailScreen` — pratique pour rafraîchir l'écran principal juste après le retour
- **`widget.tache`** : dans un `StatefulWidget`, `widget` donne accès aux paramètres passés depuis l'extérieur (ici, la tâche transmise depuis la liste). Comme `Tache` est un objet (pas une simple valeur), le modifier dans `DetailScreen` modifie directement la même instance en mémoire — d'où l'astuce pratique mais à utiliser avec prudence sur de plus gros projets

## Une meilleure façon de faire retourner des données

Pour des projets plus propres, on peut aussi faire renvoyer explicitement des données par `Navigator.pop` :

```dart
// Dans DetailScreen, un bouton retour explicite :
ElevatedButton(
  onPressed: () => Navigator.pop(context, widget.tache),
  child: const Text('Enregistrer et revenir'),
)
```

```dart
// Dans l'écran principal :
onTap: () async {
  final tacheModifiee = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailScreen(tache: tache)),
  );
  if (tacheModifiee != null) {
    setState(() {
      _taches[index] = tacheModifiee;
    });
    _sauvegarderTaches();
  }
}
```

Cette seconde approche est plus explicite et plus sûre (moins de "mutation cachée" d'objets partagés).

Tu veux qu'on enchaîne maintenant sur la connexion à une vraie API (par exemple récupérer des données depuis un serveur avec le package `http`), ou préfères-tu qu'on explore la gestion d'état avec **Provider** pour partager l'état entre plusieurs écrans plus proprement ?











Excellent choix — en fait, ça tombe bien parce que **Provider** et l'**API** se combinent naturellement : Provider sert justement à gérer proprement les données qui viennent d'un serveur. On va donc faire Provider d'abord (pour restructurer proprement l'état), puis brancher l'API dessus.

## Étape 6 : Provider — centraliser la gestion d'état

### Le problème que Provider résout

Jusqu'ici, tout l'état (`_taches`) vit dans `_TodoScreenState`. Ça marche bien pour un seul écran, mais dès qu'on a plusieurs écrans qui doivent lire ou modifier les mêmes données, on doit les faire transiter manuellement (comme le `widget.tache` de tout à l'heure). Provider centralise l'état dans un objet unique, accessible depuis n'importe quel écran.

**Ajoute la dépendance :**

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  http: ^1.2.0
  shared_preferences: ^2.2.2
```

### On crée un "ChangeNotifier" : le cerveau de l'état

```dart
import 'package:flutter/material.dart';

class TachesProvider extends ChangeNotifier {
  List<Tache> _taches = [];

  List<Tache> get taches => _taches;

  void ajouter(String titre) {
    _taches.add(Tache(titre: titre));
    notifyListeners(); // prévient tous les écrans qui écoutent
  }

  void supprimer(int index) {
    _taches.removeAt(index);
    notifyListeners();
  }

  void basculerEtat(int index) {
    _taches[index].estFaite = !_taches[index].estFaite;
    notifyListeners();
  }
}
```

**`notifyListeners()`** est l'équivalent de `setState()`, mais à l'échelle de toute l'app : n'importe quel écran qui "écoute" ce provider se reconstruit automatiquement.

### On branche le Provider à la racine de l'app

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TachesProvider(),
      child: const MyApp(),
    ),
  );
}
```

### On consomme les données dans l'écran

```dart
class TodoScreen extends StatelessWidget { // devient Stateless !
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TachesProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: ListView.builder(
        itemCount: provider.taches.length,
        itemBuilder: (context, index) {
          final tache = provider.taches[index];
          return ListTile(
            title: Text(tache.titre),
            leading: Checkbox(
              value: tache.estFaite,
              onChanged: (_) => provider.basculerEtat(index),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => provider.supprimer(index),
            ),
          );
        },
      ),
    );
  }
}
```

**Points clés :**
- `context.watch<TachesProvider>()` : "écoute" le provider et reconstruit ce widget à chaque `notifyListeners()`
- Le `TodoScreen` redevient un simple `StatelessWidget` — il n'a plus besoin de gérer son propre état, il l'observe simplement
- N'importe quel autre écran de l'app peut faire pareil et voir les **mêmes** données, sans rien passer en paramètre

## Étape 7 : connecter une vraie API

On va maintenant faire en sorte que le `TachesProvider` aille chercher (et sauvegarder) ses données sur un serveur, via le package `http`, au lieu du stockage local.

### Exemple avec une API REST fictive

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class TachesProvider extends ChangeNotifier {
  List<Tache> _taches = [];
  bool _enChargement = false;

  List<Tache> get taches => _taches;
  bool get enChargement => _enChargement;

  final String _baseUrl = 'https://mon-api.exemple.com/taches';

  // Récupérer les tâches depuis le serveur
  Future<void> chargerDepuisApi() async {
    _enChargement = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _taches = data.map((json) => Tache.fromJson(json)).toList();
      } else {
        throw Exception('Erreur serveur : ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erreur de chargement : $e');
    } finally {
      _enChargement = false;
      notifyListeners();
    }
  }

  // Ajouter une tâche sur le serveur
  Future<void> ajouter(String titre) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'titre': titre, 'estFaite': false}),
    );

    if (response.statusCode == 201) {
      final nouvelleTache = Tache.fromJson(jsonDecode(response.body));
      _taches.add(nouvelleTache);
      notifyListeners();
    }
  }

  // Supprimer une tâche sur le serveur
  Future<void> supprimer(int index) async {
    final id = _taches[index].id; // suppose que Tache a maintenant un id
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200 || response.statusCode == 204) {
      _taches.removeAt(index);
      notifyListeners();
    }
  }
}
```

### Charger les données au démarrage de l'écran

```dart
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    // on lance le chargement une fois, après le premier rendu
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TachesProvider>().chargerDepuisApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TachesProvider>();

    if (provider.enChargement) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: ListView.builder(
        itemCount: provider.taches.length,
        itemBuilder: (context, index) {
          final tache = provider.taches[index];
          return ListTile(
            title: Text(tache.titre),
            onTap: () => provider.basculerEtat(index),
          );
        },
      ),
    );
  }
}
```

## Points importants à retenir

- **`context.watch<T>()`** vs **`context.read<T>()`** : `watch` reconstruit le widget à chaque changement (à utiliser dans `build()`), `read` récupère juste une référence sans "s'abonner" (à utiliser dans les callbacks comme `initState` ou `onPressed`)
- **Gestion des erreurs réseau** : le `try/catch` est indispensable, une requête HTTP peut toujours échouer (pas de réseau, serveur en panne, timeout)
- **États de chargement** : `_enChargement` permet d'afficher un `CircularProgressIndicator` pendant qu'on attend la réponse — essentiel pour une bonne UX
- **Codes de statut HTTP** : `200` (OK), `201` (créé), `204` (supprimé sans contenu), `4xx`/`5xx` (erreurs) — toujours les vérifier avant de traiter la réponse

À ce stade, tu as une architecture Flutter assez représentative de ce qu'on trouve dans une vraie app en production : séparation de l'état (Provider), communication réseau (http), et gestion des écrans (Navigator).

Si tu veux aller plus loin, les prochaines étapes naturelles seraient : la gestion des erreurs utilisateur (afficher un message si l'API échoue), l'authentification (tokens, login), ou les tests automatisés. Dis-moi si l'un de ces sujets t'intéresse.









On va traiter les deux ensemble, car en pratique ils sont liés : la plupart des erreurs API "sérieuses" dans une vraie app concernent justement l'authentification (token expiré, accès refusé).

## Étape 8 : gestion des erreurs utilisateur

### Le problème actuel

Dans le code précédent, les erreurs sont juste envoyées dans `debugPrint` — invisibles pour l'utilisateur. Il faut un vrai système qui distingue les types d'erreurs et les affiche clairement.

### On enrichit le Provider avec un état d'erreur

```dart
class TachesProvider extends ChangeNotifier {
  List<Tache> _taches = [];
  bool _enChargement = false;
  String? _messageErreur;

  List<Tache> get taches => _taches;
  bool get enChargement => _enChargement;
  String? get messageErreur => _messageErreur;

  final String _baseUrl = 'https://mon-api.exemple.com/taches';

  Future<void> chargerDepuisApi() async {
    _enChargement = true;
    _messageErreur = null;
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse(_baseUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _taches = data.map((json) => Tache.fromJson(json)).toList();
      } else if (response.statusCode == 401) {
        _messageErreur = 'Session expirée, merci de vous reconnecter.';
      } else {
        _messageErreur = 'Erreur serveur (${response.statusCode}). Réessaie plus tard.';
      }
    } on SocketException {
      _messageErreur = 'Pas de connexion internet.';
    } on TimeoutException {
      _messageErreur = 'Le serveur met trop de temps à répondre.';
    } catch (e) {
      _messageErreur = 'Une erreur inattendue est survenue.';
    } finally {
      _enChargement = false;
      notifyListeners();
    }
  }
}
```

**Ce qui change :**
- On distingue les types d'erreurs (`SocketException` = pas de réseau, `TimeoutException` = trop lent, code `401` = authentification)
- `.timeout()` évite qu'une requête reste bloquée indéfiniment
- `_messageErreur` est un état à part entière, lisible depuis l'interface

### On affiche l'erreur dans l'écran

```dart
class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TachesProvider>().chargerDepuisApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TachesProvider>();

    // affiche une SnackBar dès qu'une nouvelle erreur apparaît
    if (provider.messageErreur != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(provider.messageErreur!),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Réessayer',
              textColor: Colors.white,
              onPressed: () => provider.chargerDepuisApi(),
            ),
          ),
        );
      });
    }

    if (provider.enChargement) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // écran d'erreur "plein" si la liste est vide ET qu'il y a une erreur
    if (provider.messageErreur != null && provider.taches.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Mes tâches')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              Text(provider.messageErreur!),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => provider.chargerDepuisApi(),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: ListView.builder(
        itemCount: provider.taches.length,
        itemBuilder: (context, index) {
          final tache = provider.taches[index];
          return ListTile(
            title: Text(tache.titre),
            onTap: () => provider.basculerEtat(index),
          );
        },
      ),
    );
  }
}
```

**Deux approches complémentaires** :
- **SnackBar** : pour une erreur ponctuelle (ex : suppression échouée), non-bloquante, disparaît toute seule
- **Écran d'erreur plein** : quand il n'y a *rien* à afficher à cause de l'erreur (ex : le premier chargement échoue), avec un bouton "Réessayer" clair

## Étape 9 : authentification (tokens, login)

### Principe général

1. L'utilisateur saisit email/mot de passe
2. On envoie ces identifiants à l'API, qui renvoie un **token** (généralement un JWT)
3. On stocke ce token **de façon sécurisée** sur l'appareil
4. On l'ajoute à chaque requête suivante (header `Authorization`)
5. Si l'API répond `401`, on redirige vers l'écran de login

### Le stockage sécurisé

`shared_preferences` n'est **pas fait pour des données sensibles** (pas chiffré). Pour un token, on utilise plutôt **`flutter_secure_storage`** :

```yaml
dependencies:
  flutter_secure_storage: ^9.0.0
```

### Le service d'authentification

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final String _baseUrl = 'https://mon-api.exemple.com/auth';

  String? _token;
  String? get token => _token;
  bool get estConnecte => _token != null;

  // Au démarrage de l'app : vérifier si un token existe déjà
  Future<void> chargerToken() async {
    _token = await _storage.read(key: 'auth_token');
    notifyListeners();
  }

  Future<String?> login(String email, String motDePasse) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': motDePasse}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        await _storage.write(key: 'auth_token', value: _token);
        notifyListeners();
        return null; // pas d'erreur
      } else if (response.statusCode == 401) {
        return 'Email ou mot de passe incorrect.';
      } else {
        return 'Erreur serveur, réessaie plus tard.';
      }
    } catch (e) {
      return 'Impossible de contacter le serveur.';
    }
  }

  Future<void> logout() async {
    _token = null;
    await _storage.delete(key: 'auth_token');
    notifyListeners();
  }
}
```

### L'écran de login

```dart
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _erreur;
  bool _enCours = false;

  Future<void> _seConnecter() async {
    setState(() {
      _enCours = true;
      _erreur = null;
    });

    final auth = context.read<AuthService>();
    final resultat = await auth.login(
      _emailController.text.trim(),
      _passwordController.text,
    );

    setState(() {
      _enCours = false;
      _erreur = resultat;
    });

    // Si resultat == null, la connexion a réussi.
    // AuthService a notifié ses écouteurs, donc l'app peut réagir
    // automatiquement si on écoute `estConnecte` plus haut dans l'arbre.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (_erreur != null)
              Text(_erreur!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            _enCours
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _seConnecter,
                    child: const Text('Se connecter'),
                  ),
          ],
        ),
      ),
    );
  }
}
```

### On aiguille l'app selon l'état de connexion

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()..chargerToken()),
        ChangeNotifierProvider(create: (_) => TachesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();

    return MaterialApp(
      home: auth.estConnecte ? const TodoScreen() : const LoginScreen(),
    );
  }
}
```

**`MultiProvider`** permet de déclarer plusieurs providers à la fois. Dès que `AuthService.notifyListeners()` est appelé (après login ou logout), `MyApp` se reconstruit et bascule automatiquement entre `LoginScreen` et `TodoScreen` — pas besoin de `Navigator` manuel pour ça.

### On attache le token à chaque requête

Il faut maintenant que `TachesProvider` utilise le token. Le plus propre est de lui passer `AuthService` :

```dart
class TachesProvider extends ChangeNotifier {
  final AuthService authService;
  TachesProvider(this.authService);

  // ...

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        if (authService.token != null)
          'Authorization': 'Bearer ${authService.token}',
      };

  Future<void> chargerDepuisApi() async {
    _enChargement = true;
    _messageErreur = null;
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse(_baseUrl), headers: _headers)
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _taches = data.map((json) => Tache.fromJson(json)).toList();
      } else if (response.statusCode == 401) {
        _messageErreur = 'Session expirée, merci de vous reconnecter.';
        await authService.logout(); // déconnexion automatique
      } else {
        _messageErreur = 'Erreur serveur (${response.statusCode}).';
      }
    } catch (e) {
      _messageErreur = 'Impossible de contacter le serveur.';
    } finally {
      _enChargement = false;
      notifyListeners();
    }
  }
}
```

Et on adapte la déclaration dans `main()` avec `ChangeNotifierProxyProvider`, qui permet à un provider de dépendre d'un autre :

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthService()..chargerToken()),
    ChangeNotifierProxyProvider<AuthService, TachesProvider>(
      create: (context) => TachesProvider(context.read<AuthService>()),
      update: (context, auth, previous) => previous ?? TachesProvider(auth),
    ),
  ],
  child: const MyApp(),
)
```

## Récapitulatif des bonnes pratiques

| Sujet | Bonne pratique |
|---|---|
| Erreurs réseau | Toujours `try/catch` + `.timeout()` |
| Erreurs serveur | Distinguer les codes (`401`, `404`, `5xx`) pour des messages précis |
| Affichage | SnackBar pour erreurs ponctuelles, écran dédié si rien à montrer |
| Stockage du token | `flutter_secure_storage`, jamais `shared_preferences` |
| Token expiré | Détecter le `401`, déconnecter automatiquement, rediriger vers login |
| Organisation | Un `AuthService` séparé, injecté dans les autres providers qui en ont besoin |

Tu as maintenant une architecture proche de ce qu'on voit en production : gestion d'erreurs différenciée, authentification par token, et providers qui communiquent entre eux. Si tu veux, on peut continuer avec le **rafraîchissement automatique du token** (refresh token) ou les **tests unitaires** pour ce provider.










## Étape 10 : rafraîchissement automatique du token (refresh token)

### Le principe

Un **access token** a généralement une durée de vie courte (15 min à 1h) pour limiter les risques en cas de vol. Pour éviter de redemander le mot de passe à chaque expiration, l'API fournit aussi un **refresh token**, à durée de vie plus longue, qui sert uniquement à obtenir un nouvel access token.

Le flux typique :
1. Une requête échoue avec `401` (access token expiré)
2. On appelle l'endpoint de refresh avec le refresh token
3. Si ça réussit → on récupère un nouvel access token, on **rejoue automatiquement** la requête initiale
4. Si le refresh échoue aussi (refresh token expiré/révoqué) → déconnexion complète, retour au login

### On stocke les deux tokens

```dart
class AuthService extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final String _baseUrl = 'https://mon-api.exemple.com/auth';

  String? _accessToken;
  String? _refreshToken;

  String? get token => _accessToken;
  bool get estConnecte => _accessToken != null;

  Future<void> chargerToken() async {
    _accessToken = await _storage.read(key: 'access_token');
    _refreshToken = await _storage.read(key: 'refresh_token');
    notifyListeners();
  }

  Future<String?> login(String email, String motDePasse) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': motDePasse}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _enregistrerTokens(data['accessToken'], data['refreshToken']);
        return null;
      } else if (response.statusCode == 401) {
        return 'Email ou mot de passe incorrect.';
      }
      return 'Erreur serveur, réessaie plus tard.';
    } catch (e) {
      return 'Impossible de contacter le serveur.';
    }
  }

  Future<void> _enregistrerTokens(String access, String refresh) async {
    _accessToken = access;
    _refreshToken = refresh;
    await _storage.write(key: 'access_token', value: access);
    await _storage.write(key: 'refresh_token', value: refresh);
    notifyListeners();
  }

  Future<void> logout() async {
    _accessToken = null;
    _refreshToken = null;
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    notifyListeners();
  }
}
```

### La logique de rafraîchissement

Point important : si plusieurs requêtes échouent en même temps (ex : la liste des tâches ET le profil utilisateur se chargent en parallèle), il ne faut **pas** déclencher plusieurs rafraîchissements simultanés — le premier réussirait, mais le refresh token aurait déjà été "consommé" (beaucoup d'API invalident l'ancien refresh token dès qu'il est utilisé) et le second échouerait à tort.

On protège ça avec une variable qui mémorise le rafraîchissement en cours :

```dart
class AuthService extends ChangeNotifier {
  // ... champs précédents

  Future<bool>? _rafraichissementEnCours;

  Future<bool> rafraichirToken() {
    // Si un rafraîchissement est déjà en cours, on le réutilise
    // au lieu d'en lancer un deuxième en parallèle.
    _rafraichissementEnCours ??= _effectuerRafraichissement();
    return _rafraichissementEnCours!;
  }

  Future<bool> _effectuerRafraichissement() async {
    if (_refreshToken == null) return false;

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refreshToken': _refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _enregistrerTokens(data['accessToken'], data['refreshToken']);
        return true;
      } else {
        // refresh token invalide ou expiré : déconnexion forcée
        await logout();
        return false;
      }
    } catch (e) {
      return false; // erreur réseau : on ne déconnecte pas, on réessaiera plus tard
    } finally {
      _rafraichissementEnCours = null; // libère pour la prochaine fois
    }
  }
}
```

**Pourquoi `??=` ?** Cet opérateur n'assigne que si la variable est `null`. Donc si trois requêtes échouent en même temps, elles se partagent le **même** `Future` de rafraîchissement au lieu d'en déclencher trois — et la 2e et 3e attendent simplement le résultat de la 1ère.

### On rejoue automatiquement la requête après un refresh réussi

Le plus propre est de centraliser cette logique dans une méthode utilitaire, plutôt que de la dupliquer dans chaque provider :

```dart
class AuthService extends ChangeNotifier {
  // ... code précédent

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        if (_accessToken != null) 'Authorization': 'Bearer $_accessToken',
      };

  /// Exécute une requête HTTP, et si elle échoue avec 401,
  /// rafraîchit le token puis réessaie UNE fois.
  Future<http.Response> requeteAvecRefresh(
    Future<http.Response> Function(Map<String, String> headers) requete,
  ) async {
    var response = await requete(headers);

    if (response.statusCode == 401 && _refreshToken != null) {
      final succes = await rafraichirToken();
      if (succes) {
        response = await requete(headers); // on rejoue avec le nouveau token
      }
    }

    return response;
  }
}
```

### Utilisation dans `TachesProvider`

```dart
class TachesProvider extends ChangeNotifier {
  final AuthService authService;
  TachesProvider(this.authService);

  List<Tache> _taches = [];
  bool _enChargement = false;
  String? _messageErreur;

  List<Tache> get taches => _taches;
  bool get enChargement => _enChargement;
  String? get messageErreur => _messageErreur;

  final String _baseUrl = 'https://mon-api.exemple.com/taches';

  Future<void> chargerDepuisApi() async {
    _enChargement = true;
    _messageErreur = null;
    notifyListeners();

    try {
      final response = await authService.requeteAvecRefresh(
        (headers) => http
            .get(Uri.parse(_baseUrl), headers: headers)
            .timeout(const Duration(seconds: 10)),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _taches = data.map((json) => Tache.fromJson(json)).toList();
      } else if (response.statusCode == 401) {
        // le refresh a été tenté et a échoué : AuthService a déjà déconnecté
        _messageErreur = 'Session expirée, merci de vous reconnecter.';
      } else {
        _messageErreur = 'Erreur serveur (${response.statusCode}).';
      }
    } catch (e) {
      _messageErreur = 'Impossible de contacter le serveur.';
    } finally {
      _enChargement = false;
      notifyListeners();
    }
  }
}
```

**Ce que ça change concrètement pour l'utilisateur :** si son access token expire pendant qu'il utilise l'app, tout se passe en arrière-plan — la requête échoue, le token se rafraîchit, la requête se rejoue, et l'utilisateur ne voit qu'un léger délai, jamais une déconnexion inutile. Il n'est déconnecté que si le refresh token lui-même est expiré (généralement après plusieurs jours ou semaines d'inactivité).

## Schéma récapitulatif du flux

```
Requête API
    │
    ▼
 401 ? ──non──► Résultat normal
    │
   oui
    │
    ▼
Refresh en cours ? ──oui──► Attendre ce refresh
    │
   non
    │
    ▼
Appel /refresh avec refreshToken
    │
    ▼
 Succès ? ──non──► logout() → écran de login
    │
   oui
    │
    ▼
Nouveaux tokens enregistrés
    │
    ▼
Requête initiale rejouée avec le nouveau token
```

## Points de vigilance en production

- **Expiration du refresh token lui-même** : certaines API le renouvellent aussi à chaque usage (*rotation*), comme fait ici — pense à bien enregistrer le nouveau `refreshToken` reçu, pas seulement l'`accessToken`
- **Sécurité du refresh token** : c'est la donnée la plus sensible de l'app puisqu'elle permet de se reconnecter indéfiniment — `flutter_secure_storage` reste indispensable ici
- **Race condition résolue** : le `_rafraichissementEnCours` évite le scénario classique où plusieurs requêtes parallèles provoquent des refresh concurrents qui s'invalident mutuellement

Si tu veux, on peut poursuivre avec les **tests unitaires** de ce `AuthService` (notamment simuler l'expiration du token et vérifier que le refresh + replay fonctionnent), ou voir comment structurer tout ça avec **Riverpod** plutôt que Provider pour un projet plus grand.












## Étape 11 : migrer vers Riverpod

### Pourquoi Riverpod plutôt que Provider

Riverpod a été créé par le même auteur que Provider, pour corriger certaines limites structurelles :

| Limite de Provider | Solution Riverpod |
|---|---|
| Dépend du `BuildContext` (besoin d'un widget pour lire l'état) | Fonctionne aussi en dehors de l'arbre de widgets |
| Erreurs de type détectées à l'exécution seulement | Vérifiées à la compilation |
| `ChangeNotifierProxyProvider` verbeux pour les dépendances entre providers | Dépendances déclarées simplement avec `ref.watch()` |
| Pas de gestion native des états async (loading/error/data) | `AsyncValue` et `AsyncNotifier` intégrés, faits pour ça |

Le dernier point est particulièrement pertinent pour notre cas : on a justement des états `enChargement` / `messageErreur` / données gérés à la main jusqu'ici — Riverpod a un type dédié pour ça.

### Installation

```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

dev_dependencies:
  build_runner: ^2.4.9
  riverpod_generator: ^2.4.0
```

On utilise ici l'approche moderne avec **génération de code** (`@riverpod`), qui est la façon recommandée d'écrire du Riverpod aujourd'hui — plus concise et mieux typée que l'écriture manuelle des providers.

### On remplace `MultiProvider` par `ProviderScope`

```dart
void main() {
  runApp(
    const ProviderScope( // englobe toute l'app, une seule fois
      child: MyApp(),
    ),
  );
}
```

Pas besoin de déclarer les providers ici — contrairement à Provider, ils se déclarent individuellement dans leurs propres fichiers.

### AuthService devient un `AsyncNotifier`

```dart
// auth_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_provider.g.dart'; // généré automatiquement par build_runner

@riverpod
class Auth extends _$Auth {
  final _storage = const FlutterSecureStorage();
  final String _baseUrl = 'https://mon-api.exemple.com/auth';

  String? _accessToken;
  String? _refreshToken;
  Future<bool>? _rafraichissementEnCours;

  String? get accessToken => _accessToken;

  @override
  Future<bool> build() async {
    // équivalent de initState + chargerToken() : appelé automatiquement
    // à la première lecture du provider
    _accessToken = await _storage.read(key: 'access_token');
    _refreshToken = await _storage.read(key: 'refresh_token');
    return _accessToken != null; // = estConnecte
  }

  Future<String?> login(String email, String motDePasse) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': motDePasse}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _enregistrerTokens(data['accessToken'], data['refreshToken']);
        state = const AsyncValue.data(true); // notifie les écouteurs
        return null;
      } else if (response.statusCode == 401) {
        return 'Email ou mot de passe incorrect.';
      }
      return 'Erreur serveur, réessaie plus tard.';
    } catch (e) {
      return 'Impossible de contacter le serveur.';
    }
  }

  Future<void> _enregistrerTokens(String access, String refresh) async {
    _accessToken = access;
    _refreshToken = refresh;
    await _storage.write(key: 'access_token', value: access);
    await _storage.write(key: 'refresh_token', value: refresh);
  }

  Future<void> logout() async {
    _accessToken = null;
    _refreshToken = null;
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    state = const AsyncValue.data(false);
  }

  Future<bool> rafraichirToken() {
    _rafraichissementEnCours ??= _effectuerRafraichissement();
    return _rafraichissementEnCours!;
  }

  Future<bool> _effectuerRafraichissement() async {
    if (_refreshToken == null) return false;
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refreshToken': _refreshToken}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _enregistrerTokens(data['accessToken'], data['refreshToken']);
        return true;
      } else {
        await logout();
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      _rafraichissementEnCours = null;
    }
  }

  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        if (_accessToken != null) 'Authorization': 'Bearer $_accessToken',
      };

  Future<http.Response> requeteAvecRefresh(
    Future<http.Response> Function(Map<String, String> headers) requete,
  ) async {
    var response = await requete(headers);
    if (response.statusCode == 401 && _refreshToken != null) {
      final succes = await rafraichirToken();
      if (succes) response = await requete(headers);
    }
    return response;
  }
}
```

**Différences clés avec `ChangeNotifier` :**
- `build()` remplace le constructeur + `chargerToken()` : il s'exécute automatiquement la première fois que le provider est lu, et son retour devient l'état initial
- `state = AsyncValue.data(...)` remplace `notifyListeners()` : on assigne le nouvel état directement, et Riverpod se charge de notifier
- Le type de retour de `build()` est `Future<bool>`, donc l'état exposé est un `AsyncValue<bool>` — Riverpod gère **automatiquement** les trois cas (chargement / erreur / donnée) sans qu'on ait à coder `enChargement` à la main

### TachesProvider devient un `AsyncNotifier` sur une liste

C'est là que `AsyncValue` devient vraiment intéressant : plus besoin de `_enChargement` ni `_messageErreur` séparés.

```dart
// taches_provider.dart
part 'taches_provider.g.dart';

@riverpod
class Taches extends _$Taches {
  final String _baseUrl = 'https://mon-api.exemple.com/taches';

  @override
  Future<List<Tache>> build() async {
    // se déclenche automatiquement à la création du provider
    return _chargerDepuisApi();
  }

  Future<List<Tache>> _chargerDepuisApi() async {
    final auth = ref.read(authProvider.notifier);

    final response = await auth.requeteAvecRefresh(
      (headers) => http
          .get(Uri.parse(_baseUrl), headers: headers)
          .timeout(const Duration(seconds: 10)),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Tache.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Session expirée, merci de vous reconnecter.');
    } else {
      throw Exception('Erreur serveur (${response.statusCode}).');
    }
  }

  Future<void> rafraichir() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _chargerDepuisApi());
  }

  Future<void> basculerEtat(int index) async {
    final tachesActuelles = state.value ?? [];
    tachesActuelles[index].estFaite = !tachesActuelles[index].estFaite;
    state = AsyncValue.data([...tachesActuelles]); // nouvelle liste = reconstruction
  }
}
```

**Points essentiels :**
- **`ref.read(authProvider.notifier)`** : c'est ainsi qu'un provider accède à un autre — remplace le `ChangeNotifierProxyProvider` de Provider, sans configuration séparée
- **`AsyncValue.guard(...)`** : exécute une fonction async et capture automatiquement une éventuelle exception dans un état `AsyncError`, sans `try/catch` manuel
- **Pas de champ d'erreur séparé** : une exception levée dans `build()` ou `_chargerDepuisApi()` devient automatiquement un état `AsyncError` que l'interface peut détecter

### Consommer les providers dans l'UI

Les widgets qui lisent un provider Riverpod héritent de `ConsumerWidget` (ou `ConsumerStatefulWidget`) au lieu de `StatelessWidget`/`StatefulWidget` :

```dart
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      home: authState.when(
        data: (estConnecte) => estConnecte ? const TodoScreen() : const LoginScreen(),
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (err, stack) => const LoginScreen(),
      ),
    );
  }
}
```

```dart
class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tachesAsync = ref.watch(tachesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: tachesAsync.when(
        data: (taches) => ListView.builder(
          itemCount: taches.length,
          itemBuilder: (context, index) {
            final tache = taches[index];
            return ListTile(
              title: Text(tache.titre),
              onTap: () => ref.read(tachesProvider.notifier).basculerEtat(index),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(err.toString()),
              ElevatedButton(
                onPressed: () => ref.read(tachesProvider.notifier).rafraichir(),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**`.when(data:, loading:, error:)`** est l'équivalent du pattern matching sur les trois états possibles — c'est ce qui remplace tous nos `if (provider.enChargement) { ... } else if (provider.messageErreur != null) { ... }` codés à la main.

### `watch` vs `read` : la même règle qu'avec Provider

- **`ref.watch(...)`** dans `build()` : reconstruit le widget à chaque changement
- **`ref.read(...)`** dans un callback (`onTap`, `onPressed`) : lit une seule fois sans s'abonner

### Génération du code

Après avoir écrit les fichiers avec l'annotation `@riverpod`, il faut lancer :

```bash
dart run build_runner build --delete-conflicting-outputs
```

Cette commande génère les fichiers `.g.dart` (ex : `auth_provider.g.dart`) qui contiennent le vrai code du provider (`authProvider`, `tachesProvider`) à partir des classes annotées. En développement, on peut aussi lancer un mode "watch" qui régénère automatiquement à chaque sauvegarde :

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Comparatif récapitulatif

| Aspect | Provider | Riverpod |
|---|---|---|
| Déclaration | `MultiProvider` à la racine | `ProviderScope` (vide) + providers déclarés par fichier |
| Classe de base | `ChangeNotifier` | `Notifier` / `AsyncNotifier` |
| Notifier un changement | `notifyListeners()` | `state = ...` |
| Widget consommateur | `StatelessWidget` + `context.watch` | `ConsumerWidget` + `ref.watch` |
| États loading/error/data | Champs manuels (`bool`, `String?`) | `AsyncValue` intégré |
| Dépendance entre providers | `ChangeNotifierProxyProvider` | `ref.read()` / `ref.watch()` directement |
| Sécurité de type | Erreurs possibles à l'exécution | Vérifiées à la compilation |

Riverpod demande un peu plus d'outillage au départ (génération de code, fichiers `.g.dart`), mais élimine une bonne partie du code répétitif qu'on avait dû écrire à la main avec Provider pour gérer le chargement et les erreurs.

Si tu veux, on peut continuer avec les **tests unitaires** de ces notifiers Riverpod (Riverpod a un mode spécial pour ça, avec `ProviderContainer`), ou voir comment organiser un projet Flutter de taille réelle en dossiers/couches (architecture *feature-first* ou *clean architecture*).












## Étape 12 : organiser un projet Flutter à grande échelle

### Les deux grandes philosophies

Il existe principalement deux approches, qui peuvent d'ailleurs se combiner :

- **Feature-first** : on organise par fonctionnalité métier (auth, taches, profil...). Chaque dossier contient tout ce qui concerne cette fonctionnalité.
- **Layer-first / Clean Architecture** : on organise par couche technique (data, domain, presentation), répétée à l'intérieur de chaque feature.

En pratique, la meilleure approche pour un vrai projet est de **combiner les deux** : feature-first au premier niveau, puis clean architecture à l'intérieur de chaque feature. C'est ce qu'on va détailler.

## Structure générale du projet

```
lib/
  core/                     ← code partagé, transverse à toute l'app
    constants/
    errors/
    network/
    theme/
    utils/
    widgets/                ← widgets réutilisables (boutons, loaders...)

  features/
    auth/
      data/
      domain/
      presentation/
    taches/
      data/
      domain/
      presentation/

  main.dart
  app.dart                  ← MaterialApp, routing racine
```

## Le détail des trois couches (Clean Architecture)

C'est le cœur du sujet. Reprenons notre feature `taches` pour illustrer, avec les trois couches à l'intérieur.

```
features/taches/
  data/
    models/
      tache_model.dart       ← version "brute", liée au JSON de l'API
    datasources/
      taches_remote_datasource.dart   ← appels http bruts
      taches_local_datasource.dart    ← cache local (shared_preferences)
    repositories/
      taches_repository_impl.dart     ← implémentation concrète

  domain/
    entities/
      tache.dart              ← objet métier "pur", sans dépendance externe
    repositories/
      taches_repository.dart  ← interface abstraite (contrat)
    usecases/
      obtenir_taches.dart
      ajouter_tache.dart
      basculer_etat_tache.dart

  presentation/
    providers/
      taches_provider.dart    ← Riverpod, fait le lien avec l'UI
    screens/
      taches_screen.dart
      detail_tache_screen.dart
    widgets/
      tache_tile.dart
```

### Pourquoi cette séparation ?

**La règle d'or de Clean Architecture : les dépendances pointent toujours vers l'intérieur.**

```
presentation  ──dépend de──►  domain  ◄──dépend de──  data
```

Le `domain` ne connaît **rien** de Flutter, ni de `http`, ni de JSON. Il ne connaît que des concepts métier purs. C'est cette couche qui reste stable même si tu changes de framework UI, de base de données, ou de fournisseur d'API.

### 1. La couche `domain` — le cœur métier

**Entité** (objet métier pur, sans `toJson`/`fromJson`) :

```dart
// domain/entities/tache.dart
class Tache {
  final String id;
  final String titre;
  final String description;
  final bool estFaite;

  const Tache({
    required this.id,
    required this.titre,
    this.description = '',
    this.estFaite = false,
  });

  Tache copierAvec({String? titre, String? description, bool? estFaite}) {
    return Tache(
      id: id,
      titre: titre ?? this.titre,
      description: description ?? this.description,
      estFaite: estFaite ?? this.estFaite,
    );
  }
}
```

**Interface du repository** (le contrat, sans implémentation) :

```dart
// domain/repositories/taches_repository.dart
abstract class TachesRepository {
  Future<List<Tache>> obtenirTaches();
  Future<Tache> ajouterTache(String titre);
  Future<void> supprimerTache(String id);
  Future<void> basculerEtat(String id);
}
```

**Use case** (une action métier précise, une classe par action) :

```dart
// domain/usecases/obtenir_taches.dart
class ObtenirTaches {
  final TachesRepository repository;
  ObtenirTaches(this.repository);

  Future<List<Tache>> call() => repository.obtenirTaches();
}
```

Ça peut sembler être beaucoup de code pour "juste" appeler une méthode du repository — et pour une petite app, ça l'est. L'intérêt apparaît sur un gros projet : chaque use case documente une action métier isolée, facile à tester unitairement, et facile à retrouver dans un IDE (`ObtenirTaches`, `ajouter_tache.dart`... tout est explicite).

### 2. La couche `data` — l'implémentation concrète

**Modèle** (hérite ou convertit vers l'entité, gère le JSON) :

```dart
// data/models/tache_model.dart
import '../../domain/entities/tache.dart';

class TacheModel extends Tache {
  const TacheModel({
    required super.id,
    required super.titre,
    super.description,
    super.estFaite,
  });

  factory TacheModel.fromJson(Map<String, dynamic> json) => TacheModel(
        id: json['id'],
        titre: json['titre'],
        description: json['description'] ?? '',
        estFaite: json['estFaite'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'titre': titre,
        'description': description,
        'estFaite': estFaite,
      };
}
```

**Datasource** (parle directement au réseau, ne connaît rien du domain) :

```dart
// data/datasources/taches_remote_datasource.dart
class TachesRemoteDatasource {
  final http.Client client;
  final AuthService authService;
  TachesRemoteDatasource(this.client, this.authService);

  Future<List<TacheModel>> obtenirTaches() async {
    final response = await authService.requeteAvecRefresh(
      (headers) => client.get(Uri.parse('$_baseUrl/taches'), headers: headers),
    );
    if (response.statusCode != 200) {
      throw ServeurException(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => TacheModel.fromJson(json)).toList();
  }
}
```

**Implémentation du repository** (relie datasource et interface du domain) :

```dart
// data/repositories/taches_repository_impl.dart
class TachesRepositoryImpl implements TachesRepository {
  final TachesRemoteDatasource remote;
  TachesRepositoryImpl(this.remote);

  @override
  Future<List<Tache>> obtenirTaches() async {
    try {
      return await remote.obtenirTaches(); // TacheModel EST-UN Tache
    } on ServeurException catch (e) {
      throw ExceptionMetier('Erreur serveur (${e.code})');
    } on SocketException {
      throw ExceptionMetier('Pas de connexion internet.');
    }
  }
}
```

C'est **ici**, dans la couche `data`, que les exceptions techniques (`SocketException`, `ServeurException`) sont traduites en exceptions métier compréhensibles. Le `domain` et la `presentation` n'ont jamais à connaître `SocketException`.

### 3. La couche `presentation` — l'UI et son état

```dart
// presentation/providers/taches_provider.dart
part 'taches_provider.g.dart';

@riverpod
class TachesNotifier extends _$TachesNotifier {
  @override
  Future<List<Tache>> build() {
    final useCase = ref.read(obtenirTachesUseCaseProvider);
    return useCase();
  }

  Future<void> basculerEtat(String id) async {
    final useCase = ref.read(basculerEtatUseCaseProvider);
    await useCase(id);
    ref.invalidateSelf(); // relance build() pour rafraîchir
  }
}
```

Le provider Riverpod ne connaît que des **use cases** — jamais directement `http`, jamais `jsonDecode`. Si demain l'API change de format ou qu'on passe à GraphQL, seule la couche `data` change ; `presentation` et `domain` restent intacts.

### Injection des dépendances

Pour relier toutes ces couches, on déclare des providers Riverpod "d'infrastructure" :

```dart
// core/network/providers.dart
@riverpod
http.Client httpClient(HttpClientRef ref) => http.Client();

// data layer
@riverpod
TachesRemoteDatasource tachesRemoteDatasource(TachesRemoteDatasourceRef ref) {
  return TachesRemoteDatasource(
    ref.watch(httpClientProvider),
    ref.watch(authProvider.notifier),
  );
}

@riverpod
TachesRepository tachesRepository(TachesRepositoryRef ref) {
  return TachesRepositoryImpl(ref.watch(tachesRemoteDatasourceProvider));
}

// domain layer
@riverpod
ObtenirTaches obtenirTachesUseCase(ObtenirTachesUseCaseRef ref) {
  return ObtenirTaches(ref.watch(tachesRepositoryProvider));
}
```

Chaque couche ne dépend que de la couche juste en-dessous, jamais de deux niveaux à la fois. Ça semble verbeux avec un seul exemple, mais sur un projet avec 15-20 features, cette régularité rend le code **prévisible** : n'importe quel développeur qui rejoint le projet sait exactement où chercher.

## Feature-first vs Clean Architecture : faut-il toujours tout faire ?

Non — c'est une question de taille de projet :

| Taille du projet | Structure recommandée |
|---|---|
| Petite app / prototype | Un seul dossier `lib/` avec quelques fichiers | 
| App moyenne (l'exercice qu'on a fait) | Feature-first simple : `features/taches/{models, providers, screens}` |
| Grosse app en équipe | Feature-first + Clean Architecture complète (ce qu'on vient de voir) |

L'erreur classique est d'appliquer la Clean Architecture complète dès le premier jour d'un petit projet perso — ça ajoute beaucoup de friction pour un bénéfice qui n'apparaît que passé un certain seuil de complexité (plusieurs développeurs, besoin de tests poussés, logique métier complexe indépendante de l'UI).

## Autres conventions utiles à grande échelle

**Le routing** : pour une grosse app, `Navigator.push` manuel devient vite ingérable. Le package **`go_router`** est le standard pour déclarer les routes de façon centralisée et typée :

```dart
final routerProvider = Provider((ref) => GoRouter(
  routes: [
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    GoRoute(
      path: '/taches',
      builder: (_, __) => const TachesScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (_, state) => DetailTacheScreen(id: state.pathParameters['id']!),
        ),
      ],
    ),
  ],
));
```

**Les tests**, organisés en miroir de `lib/` :

```
test/
  features/
    taches/
      domain/usecases/obtenir_taches_test.dart
      data/repositories/taches_repository_impl_test.dart
      presentation/providers/taches_provider_test.dart
```

**Le dossier `core/`** mérite d'être bien pensé dès le départ car tout en dépend :
- `core/errors/` : classes d'exceptions métier communes
- `core/network/` : client HTTP partagé, intercepteurs
- `core/theme/` : couleurs, typographie centralisées
- `core/widgets/` : boutons, champs de texte, loaders réutilisés partout

## Ce que ça donne pour notre app Todo complète

```
lib/
  core/
    errors/exception_metier.dart
    network/http_client_provider.dart
    theme/app_theme.dart
    widgets/bouton_primaire.dart

  features/
    auth/
      data/
        datasources/auth_remote_datasource.dart
        repositories/auth_repository_impl.dart
      domain/
        entities/utilisateur.dart
        repositories/auth_repository.dart
        usecases/login.dart
        usecases/rafraichir_token.dart
      presentation/
        providers/auth_provider.dart
        screens/login_screen.dart

    taches/
      data/
        models/tache_model.dart
        datasources/taches_remote_datasource.dart
        repositories/taches_repository_impl.dart
      domain/
        entities/tache.dart
        repositories/taches_repository.dart
        usecases/obtenir_taches.dart
        usecases/basculer_etat_tache.dart
      presentation/
        providers/taches_provider.dart
        screens/taches_screen.dart
        screens/detail_tache_screen.dart
        widgets/tache_tile.dart

  app.dart
  main.dart
```

C'est exactement la même app qu'on a construite ensemble depuis le début, mais réorganisée pour supporter une équipe de plusieurs développeurs et une croissance sur plusieurs mois ou années sans devenir ingérable.

Tu veux qu'on mette tout ça en pratique en réécrivant concrètement le module `auth` complet dans cette structure, ou préfères-tu qu'on parle des tests unitaires par couche (domain, data, presentation) maintenant qu'on a cette architecture ?












## Étape 13 : les tests unitaires, couche par couche

### Le principe général

La Clean Architecture rend les tests naturels car chaque couche a des dépendances **explicites et remplaçables**. Le mot-clé est **mock** : on remplace une vraie dépendance (API, stockage) par une fausse version contrôlée, pour tester une seule couche à la fois, isolément.

**Packages nécessaires :**

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.4        # pour créer des mocks
  riverpod_test: ^0.0.1   # utilitaires de test pour Riverpod (optionnel)
```

`mocktail` est préféré à `mockito` aujourd'hui car il ne nécessite pas de génération de code.

## 1. Tester le `domain` — la couche la plus simple

Le `domain` ne dépend que d'abstractions (interfaces), donc on peut mocker le repository facilement, sans toucher au réseau ni au stockage.

```dart
// test/features/taches/domain/usecases/obtenir_taches_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTachesRepository extends Mock implements TachesRepository {}

void main() {
  late ObtenirTaches useCase;
  late MockTachesRepository mockRepository;

  setUp(() {
    mockRepository = MockTachesRepository();
    useCase = ObtenirTaches(mockRepository);
  });

  test('doit retourner la liste des tâches depuis le repository', () async {
    // Arrange : on programme le comportement du mock
    final tachesAttendues = [
      const Tache(id: '1', titre: 'Acheter du pain'),
      const Tache(id: '2', titre: 'Appeler le médecin'),
    ];
    when(() => mockRepository.obtenirTaches())
        .thenAnswer((_) async => tachesAttendues);

    // Act : on exécute l'action testée
    final resultat = await useCase();

    // Assert : on vérifie le résultat
    expect(resultat, tachesAttendues);
    verify(() => mockRepository.obtenirTaches()).called(1);
  });

  test('doit propager une exception si le repository échoue', () async {
    when(() => mockRepository.obtenirTaches())
        .thenThrow(const ExceptionMetier('Erreur serveur'));

    expect(() => useCase(), throwsA(isA<ExceptionMetier>()));
  });
}
```

**Ce qu'on vérifie ici :** uniquement la logique du use case, jamais le vrai réseau. Ces tests s'exécutent en quelques millisecondes, sans connexion internet.

**Structure classique d'un test : AAA**
- **Arrange** : préparer les données et le comportement des mocks
- **Act** : exécuter l'action
- **Assert** : vérifier le résultat

## 2. Tester la couche `data`

Ici, on teste que le repository traduit correctement les réponses/erreurs du datasource, **sans faire de vrais appels HTTP**.

```dart
// test/features/taches/data/repositories/taches_repository_impl_test.dart
class MockTachesRemoteDatasource extends Mock implements TachesRemoteDatasource {}

void main() {
  late TachesRepositoryImpl repository;
  late MockTachesRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockTachesRemoteDatasource();
    repository = TachesRepositoryImpl(mockDatasource);
  });

  group('obtenirTaches', () {
    test('doit retourner les tâches en cas de succès', () async {
      final modeles = [
        const TacheModel(id: '1', titre: 'Test'),
      ];
      when(() => mockDatasource.obtenirTaches())
          .thenAnswer((_) async => modeles);

      final resultat = await repository.obtenirTaches();

      expect(resultat, modeles); // TacheModel EST-UN Tache
    });

    test('doit lever ExceptionMetier si le serveur répond une erreur', () async {
      when(() => mockDatasource.obtenirTaches())
          .thenThrow(ServeurException(500));

      expect(
        () => repository.obtenirTaches(),
        throwsA(isA<ExceptionMetier>()),
      );
    });

    test('doit lever ExceptionMetier si pas de connexion', () async {
      when(() => mockDatasource.obtenirTaches())
          .thenThrow(const SocketException('Pas de réseau'));

      expect(
        () => repository.obtenirTaches(),
        throwsA(isA<ExceptionMetier>()),
      );
    });
  });
}
```

**L'intérêt spécifique à cette couche :** vérifier que **chaque type d'erreur technique** (`SocketException`, `ServeurException`, timeout...) est bien traduit en `ExceptionMetier`. C'est exactement la logique de traduction qu'on avait mise dans `TachesRepositoryImpl` — c'est elle qu'on protège ici contre les régressions.

## 3. Tester la couche `presentation` (les providers Riverpod)

C'est la partie la plus spécifique à Riverpod. On n'a **pas besoin de widgets** pour tester un notifier — on utilise `ProviderContainer`, qui simule l'environnement Riverpod sans rien afficher à l'écran.

```dart
// test/features/taches/presentation/providers/taches_provider_test.dart
class MockObtenirTaches extends Mock implements ObtenirTaches {}
class MockBasculerEtatTache extends Mock implements BasculerEtatTache {}

void main() {
  late MockObtenirTaches mockObtenirTaches;
  late MockBasculerEtatTache mockBasculerEtat;
  late ProviderContainer container;

  setUp(() {
    mockObtenirTaches = MockObtenirTaches();
    mockBasculerEtat = MockBasculerEtatTache();

    container = ProviderContainer(
      overrides: [
        // on remplace les vrais use cases par les mocks
        obtenirTachesUseCaseProvider.overrideWithValue(mockObtenirTaches),
        basculerEtatUseCaseProvider.overrideWithValue(mockBasculerEtat),
      ],
    );
  });

  tearDown(() => container.dispose()); // libère les ressources après chaque test

  test('doit charger les tâches au démarrage', () async {
    final taches = [const Tache(id: '1', titre: 'Test')];
    when(() => mockObtenirTaches()).thenAnswer((_) async => taches);

    // on lit le provider : ça déclenche build()
    final resultat = await container.read(tachesNotifierProvider.future);

    expect(resultat, taches);
  });

  test('doit exposer un état AsyncError si le chargement échoue', () async {
    when(() => mockObtenirTaches())
        .thenThrow(const ExceptionMetier('Erreur serveur'));

    // on écoute les changements d'état du provider
    final container2 = ProviderContainer(overrides: [
      obtenirTachesUseCaseProvider.overrideWithValue(mockObtenirTaches),
    ]);

    // on attend que le provider termine son build (qui va échouer)
    await container2.read(tachesNotifierProvider.future).catchError((_) {});

    final etat = container2.read(tachesNotifierProvider);
    expect(etat.hasError, true);

    container2.dispose();
  });
}
```

**Points clés propres à Riverpod :**
- **`ProviderContainer`** : un environnement Riverpod isolé, sans avoir besoin de monter un widget avec `ProviderScope`
- **`overrides`** : remplace n'importe quel provider par une version de test — c'est l'équivalent de l'injection de dépendances pour les tests
- **`tachesNotifierProvider.future`** : attend que l'état async se résolve (utile car `build()` est asynchrone)
- **`tearDown`** : `container.dispose()` évite les fuites de mémoire entre les tests

## Tester un widget (test "widget", pas unitaire)

Ce n'est pas strictement un test unitaire, mais complète naturellement la pyramide de tests. On vérifie que l'UI réagit bien à un état donné :

```dart
// test/features/taches/presentation/screens/taches_screen_test.dart
void main() {
  testWidgets('affiche un indicateur de chargement pendant le chargement',
      (tester) async {
    final mockObtenirTaches = MockObtenirTaches();
    // simule un chargement qui ne se termine jamais dans ce test
    when(() => mockObtenirTaches())
        .thenAnswer((_) => Completer<List<Tache>>().future);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          obtenirTachesUseCaseProvider.overrideWithValue(mockObtenirTaches),
        ],
        child: const MaterialApp(home: TachesScreen()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('affiche la liste des tâches une fois chargées', (tester) async {
    final mockObtenirTaches = MockObtenirTaches();
    when(() => mockObtenirTaches()).thenAnswer(
      (_) async => [const Tache(id: '1', titre: 'Acheter du pain')],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          obtenirTachesUseCaseProvider.overrideWithValue(mockObtenirTaches),
        ],
        child: const MaterialApp(home: TachesScreen()),
      ),
    );

    await tester.pumpAndSettle(); // attend la fin des animations/futures

    expect(find.text('Acheter du pain'), findsOneWidget);
  });
}
```

**`pumpWidget`** construit le widget dans un environnement de test simulé, **`pump`/`pumpAndSettle`** avancent le temps virtuel pour laisser les animations et `Future` se terminer, et `find.byType`/`find.text` permettent de vérifier ce qui est réellement affiché.

## La pyramide de tests pour ce projet

```
        ▲
       /│\      Tests widgets/intégration (lents, coûteux, peu nombreux)
      / │ \     → vérifient le comportement bout-en-bout
     /──┼──\
    /   │   \   Tests de providers (presentation)
   /────┼────\  → vérifient la logique d'état
  /     │     \
 /──────┼──────\ Tests domain + data (rapides, nombreux)
/_______|_______\ → vérifient la logique métier et la traduction d'erreurs
```

**Règle générale à retenir :** plus on descend dans les couches (domain → data → presentation → widgets), plus les tests sont rapides et nombreux à écrire ; plus on monte, plus ils sont lents mais couvrent des scénarios réalistes de bout en bout. Un projet sain a **beaucoup** de tests domain/data, un nombre modéré de tests de providers, et seulement quelques tests widgets ciblés sur les parcours critiques.

## Commandes utiles

```bash
flutter test                              # lance tous les tests
flutter test test/features/taches/        # cible un dossier
flutter test --coverage                   # génère un rapport de couverture
```

Le rapport de couverture (`coverage/lcov.info`) peut ensuite être visualisé avec des outils comme `genhtml` pour voir précisément quelles lignes ne sont pas testées.

Veux-tu qu'on aille plus loin avec l'**intégration continue** (faire tourner ces tests automatiquement sur GitHub Actions à chaque push), ou préfères-tu qu'on s'arrête là pour consolider ce qu'on a vu sur l'ensemble du parcours ?










## Étape 14 : les modes debug, profile et release

Flutter propose **trois modes de compilation**, chacun avec un objectif précis. Comprendre leurs différences évite de mauvaises surprises (une app lente en debug qui inquiète à tort, ou pire, des logs de debug oubliés en production).

## Vue d'ensemble

| Mode | Commande | Objectif |
|---|---|---|
| **Debug** | `flutter run` | Développement quotidien, hot reload |
| **Profile** | `flutter run --profile` | Mesurer les performances réelles |
| **Release** | `flutter run --release` | Version finale distribuée aux utilisateurs |

## Mode Debug

C'est le mode par défaut quand tu lances `flutter run` ou que tu cliques sur "Run" dans ton éditeur.

**Caractéristiques :**
- **Hot reload et hot restart** activés — c'est le mode qu'on a utilisé tout au long de ce tutoriel
- **Assertions activées** : les `assert()` dans le code s'exécutent et peuvent stopper l'app si une condition attendue est fausse
- **Debug banner** : le petit bandeau "DEBUG" en haut à droite de l'écran
- **Observatoire/DevTools** : outils d'inspection (arbre de widgets, timeline, mémoire) pleinement fonctionnels
- **Compilation JIT** (Just-In-Time) : le code Dart est compilé à la volée, ce qui permet le hot reload mais rend l'app **nettement plus lente** qu'en production

```dart
void ajouterTache(String titre) {
  assert(titre.isNotEmpty, 'Le titre ne doit jamais être vide ici');
  // ce assert ne s'exécute qu'en debug — en release, il est totalement retiré
  _taches.add(Tache(titre: titre));
}
```

**Point important à retenir :** ne jamais juger les performances d'une app à partir du mode debug. Une animation qui semble saccadée en debug peut être parfaitement fluide en release, car le mode debug ajoute énormément d'instrumentation.

### Détecter le mode dans le code

```dart
import 'package:flutter/foundation.dart';

if (kDebugMode) {
  print('Ceci ne s\'affiche jamais en production');
}
```

## Mode Profile

Mode intermédiaire, souvent oublié des débutants, pourtant essentiel pour optimiser une app avant de la publier.

**Caractéristiques :**
- Compilé de façon proche du release (**AOT**, Ahead-Of-Time), donc performances quasi-identiques à la production
- **Mais** garde certains outils de profiling actifs (DevTools, timeline des frames) pour identifier les points lents
- Pas de hot reload
- Pas de bandeau debug

```bash
flutter run --profile
```

**Cas d'usage typique :** tu remarques que le défilement de ta `ListView` de tâches saccade. Tu lances en mode profile, tu ouvres DevTools, tu regardes la **timeline des frames** pour repérer si le problème vient de la construction des widgets (`build`) ou du rendu (`raster`), et tu corriges en connaissance de cause — chose impossible en debug (trop lent artificiellement) ou en release (pas d'outils d'inspection).

## Mode Release

Le mode final, celui qu'on publie sur l'App Store ou le Play Store.

**Caractéristiques :**
- **Compilation AOT complète** : le code Dart est compilé en code machine natif à l'avance, pas d'interprétation à l'exécution → démarrage plus rapide, exécution plus fluide
- Taille de l'app optimisée (**tree shaking** : le code non utilisé est retiré, y compris les icônes Material non utilisées si tu utilises `--tree-shake-icons`)
- Aucun outil de debug, aucun bandeau, aucune assertion
- `kDebugMode` et `kProfileMode` valent `false`, `kReleaseMode` vaut `true`

```bash
flutter build apk --release        # Android : fichier .apk
flutter build appbundle --release  # Android : format préféré pour le Play Store
flutter build ios --release        # iOS : nécessite Xcode pour finaliser
```

## Un piège classique : les logs

`print()` fonctionne dans tous les modes, mais reste visible et peut légèrement impacter les performances en production. La bonne pratique est d'utiliser `debugPrint()` (qui limite automatiquement le débit pour éviter de saturer la console) et surtout de conditionner les logs verbeux :

```dart
void chargerDepuisApi() async {
  if (kDebugMode) {
    debugPrint('Appel API vers $_baseUrl');
  }
  // ...
}
```

Pour une vraie app en production, on utilise plutôt un package comme **`logger`** ou un service distant (Sentry, Firebase Crashlytics) qui capture les erreurs réelles des utilisateurs, plutôt que de compter sur `print()`.

## Application concrète à notre app Todo

Reprenons `AuthService` de tout à l'heure — voici où ces notions s'appliquent :

```dart
Future<String?> login(String email, String motDePasse) async {
  try {
    final response = await http.post(/* ... */);

    if (kDebugMode) {
      debugPrint('Réponse login : ${response.statusCode}');
      debugPrint('Corps : ${response.body}'); // JAMAIS en production : peut contenir des données sensibles
    }

    // ... reste de la logique
  } catch (e) {
    if (kReleaseMode) {
      // en production, on envoie l'erreur à un service de crash reporting
      // FirebaseCrashlytics.instance.recordError(e, stackTrace);
    } else {
      debugPrint('Erreur login : $e');
    }
    return 'Impossible de contacter le serveur.';
  }
}
```

**Pourquoi c'est important ici précisément :** dans une app avec authentification, logger le corps complet d'une réponse HTTP en production pourrait exposer des tokens ou des données personnelles dans les logs système du téléphone — un vrai risque de sécurité, pas juste une question de propreté du code.

## Récapitulatif des différences techniques

| Aspect | Debug | Profile | Release |
|---|---|---|---|
| Compilation | JIT | AOT | AOT |
| Hot reload | ✅ | ❌ | ❌ |
| Assertions (`assert`) | ✅ | ❌ | ❌ |
| DevTools / Timeline | ✅ complet | ✅ | ❌ |
| Bandeau "DEBUG" | ✅ | ❌ | ❌ |
| Taille de l'app | Grande | Moyenne | Optimisée (tree shaking) |
| Vitesse d'exécution | Lente | Proche du réel | Maximale |
| `kDebugMode` | `true` | `false` | `false` |
| `kReleaseMode` | `false` | `false` | `true` |

## Pour aller plus loin : les variantes de build (flavors)

Sur un vrai projet, on ajoute souvent une distinction supplémentaire, orthogonale aux trois modes : les **flavors** (ou "variantes"), qui permettent d'avoir par exemple une version "dev" pointant vers une API de test et une version "prod" pointant vers l'API réelle, indépendamment du mode debug/release :

```bash
flutter run --flavor dev --dart-define=API_URL=https://api-dev.exemple.com
flutter build apk --flavor prod --dart-define=API_URL=https://api.exemple.com
```

C'est utile en particulier pour tester l'app en mode **release** mais contre un serveur de développement, plutôt que le serveur de production — un scénario que les seuls modes debug/profile/release ne couvrent pas.

Veux-tu qu'on détaille la mise en place des **flavors** pour notre app (séparer dev/prod), ou qu'on parle du déploiement complet vers l'App Store et le Play Store ?










## Étape 15 : les flavors (dev/prod)

### Le principe

Un **flavor** (variante) permet de générer plusieurs versions de la même app, avec des configurations différentes — API, icône, nom d'app — sans dupliquer le code. Typiquement : `dev`, `staging`, `prod`.

### Configuration Android

Dans `android/app/build.gradle`, on déclare les flavors :

```gradle
android {
    // ...
    flavorDimensions "environnement"
    productFlavors {
        dev {
            dimension "environnement"
            applicationIdSuffix ".dev"
            resValue "string", "app_name", "Mes Tâches (Dev)"
        }
        prod {
            dimension "environnement"
            resValue "string", "app_name", "Mes Tâches"
        }
    }
}
```

**`applicationIdSuffix`** est important : il permet d'installer la version dev **et** prod en même temps sur le même téléphone (deux apps distinctes), pratique pour tester sans écraser la version de production.

### Configuration iOS

Sur iOS, ça passe par des **schemes** Xcode. Il faut ouvrir `ios/Runner.xcworkspace` dans Xcode et dupliquer le scheme `Runner` en `dev` et `prod`, chacun lié à une configuration de build distincte (avec son propre `Bundle Identifier`). C'est plus manuel que sur Android — Flutter ne peut pas générer ça automatiquement.

### Injecter la configuration avec `--dart-define`

Plutôt que de coder l'URL de l'API en dur, on la passe au moment du build :

```dart
// core/config/app_config.dart
class AppConfig {
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://api-dev.exemple.com',
  );

  static const String nomEnvironnement = String.fromEnvironment(
    'ENV',
    defaultValue: 'dev',
  );

  static bool get estProd => nomEnvironnement == 'prod';
}
```

On utilise ensuite `AppConfig.apiUrl` partout où on avait codé l'URL en dur (dans `AuthService`, `TachesRemoteDatasource`, etc.), au lieu de la chaîne littérale.

### Lancer ou builder avec un flavor

```bash
# Développement, pointe vers l'API de dev
flutter run --flavor dev --dart-define=API_URL=https://api-dev.exemple.com --dart-define=ENV=dev

# Build final de production
flutter build appbundle --flavor prod --release \
  --dart-define=API_URL=https://api.exemple.com --dart-define=ENV=prod
```

### Simplifier avec un fichier de configuration

Pour éviter de retaper ces commandes à rallonge, on peut centraliser les `--dart-define` dans un fichier JSON :

```json
// config/dev.json
{
  "API_URL": "https://api-dev.exemple.com",
  "ENV": "dev"
}
```

```bash
flutter run --flavor dev --dart-define-from-file=config/dev.json
```

**Important :** ces fichiers de config (surtout `prod.json` s'il contient des clés sensibles) doivent être ajoutés à `.gitignore` s'ils contiennent des secrets, ou au minimum ne jamais contenir de clé API vraiment sensible — `--dart-define` reste visible dans le binaire compilé, ce n'est pas un mécanisme de sécurité.

---

## Étape 16 : déploiement sur les stores

### Vue d'ensemble du processus

```
Code prêt → Build signé → Upload sur la console → Révision → Publication
```

Les étapes diffèrent significativement entre Android et iOS.

## Déploiement Android (Google Play Store)

### 1. Créer une clé de signature

Toute app Android publiée doit être signée numériquement :

```bash
keytool -genkey -v -keystore ~/upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

**⚠️ Cette clé est critique** : si tu la perds, tu ne peux plus jamais mettre à jour ton app sous le même identifiant — il faudrait publier une app totalement nouvelle. Elle doit être sauvegardée en lieu sûr, jamais commitée dans Git.

### 2. Configurer la signature

Dans `android/key.properties` (à ajouter au `.gitignore`) :

```properties
storePassword=motdepasse
keyPassword=motdepasse
keyAlias=upload
storeFile=/chemin/vers/upload-keystore.jks
```

Puis référencer ce fichier dans `android/app/build.gradle` pour que le build de release soit automatiquement signé.

### 3. Builder le bundle

```bash
flutter build appbundle --flavor prod --release \
  --dart-define-from-file=config/prod.json
```

Le format `.aab` (Android App Bundle) est celui exigé par le Play Store aujourd'hui — Google génère ensuite les APK optimisés par appareil automatiquement.

### 4. Publier sur la Google Play Console

- Créer une fiche d'application (nom, description, captures d'écran, icône)
- Uploader le `.aab` dans un canal de test (interne → fermé → ouvert) avant la production
- Remplir le questionnaire de contenu, la politique de confidentialité (obligatoire)
- Soumettre à la révision (généralement quelques heures à quelques jours)

## Déploiement iOS (App Store)

Plus contraignant : nécessite un **Mac** et un compte **Apple Developer Program** (99$/an).

### 1. Configuration dans Xcode

Ouvrir `ios/Runner.xcworkspace`, définir :
- Le **Bundle Identifier** (ex : `com.tonentreprise.mestaches`)
- L'**équipe de développement** (ton compte Apple Developer)
- La signature automatique (`Automatically manage signing`) simplifie grandement le processus par rapport à la gestion manuelle des certificats

### 2. Builder

```bash
flutter build ipa --flavor prod --release \
  --dart-define-from-file=config/prod.json
```

Ça génère un fichier `.ipa` dans `build/ios/ipa/`.

### 3. Publier via App Store Connect

- Créer l'app sur [App Store Connect](https://appstoreconnect.apple.com)
- Uploader le `.ipa` via **Xcode** (Organizer) ou l'outil en ligne de commande **Transporter**
- Remplir la fiche (captures d'écran obligatoires pour chaque taille d'écran, description, mots-clés)
- Soumettre à révision — généralement **24 à 48h**, parfois plus, et Apple est notoirement plus strict que Google sur les rejets (design non conforme aux guidelines, fonctionnalités incomplètes, etc.)

## Différences clés à retenir

| Aspect | Google Play | App Store |
|---|---|---|
| Coût compte développeur | 25$ une fois | 99$/an |
| Machine nécessaire | N'importe laquelle | Mac obligatoire |
| Délai de révision | Quelques heures | 24-48h+ |
| Strictness de la review | Modérée | Élevée |
| Format de build | `.aab` | `.ipa` |
| Rollout progressif | Oui (par %) | Oui (phased release) |

## Automatiser avec la CI/CD

Sur un vrai projet, ces builds et déploiements sont automatisés plutôt que faits manuellement à chaque fois. Les outils courants :

- **Fastlane** : automatise signature, build et upload sur les deux stores depuis un seul script
- **Codemagic** : CI/CD pensé spécifiquement pour Flutter, gère nativement les flavors et la signature
- **GitHub Actions / GitLab CI** : peuvent aussi déclencher `flutter build` + upload à chaque tag Git

Un pipeline typique : à chaque tag `v1.2.0` poussé sur Git, la CI build automatiquement les deux flavors, signe les binaires, et les envoie en test interne sur les deux stores — sans intervention manuelle.

## Où en est notre projet Todo maintenant

On a couvert, dans l'ordre, à peu près tout le cycle de vie d'une vraie app Flutter en production :

1. Widgets et état de base
2. Persistance locale
3. Navigation
4. Gestion d'état à l'échelle (Provider → Riverpod)
5. Communication API, erreurs, authentification, refresh token
6. Architecture en couches pour un projet d'équipe
7. Tests unitaires par couche
8. Modes debug/profile/release
9. Flavors et déploiement sur les stores

C'est un parcours complet, représentatif de ce qu'on retrouve dans une vraie app Flutter en production. Si tu veux, on peut revenir sur un point précis pour l'approfondir, ou passer à un tout autre sujet (par exemple les animations, ou l'intégration de notifications push).