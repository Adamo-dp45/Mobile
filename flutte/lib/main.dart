import 'package:flutter/material.dart';

/*
  - Un 'widget' est une classe qui représente un élément de l'interface utilisateur. Il peut être un bouton, un texte, une image, etc. Il existe deux types de widgets : les 'StatelessWidget' et les 'StatefulWidget'. Un 'StatelessWidget' est un widget qui ne change pas d'état, tandis qu'un 'StatefulWidget' est un widget qui peut changer d'état.
  - Un 'scaffold' est un widget qui fournit une structure de base pour l'application, comme une barre d'applications, un tiroir de navigation, un corps, etc. Il est utilisé pour créer une interface utilisateur cohérente et facile à utiliser.
  - Un 'container' est un widget qui permet de regrouper d'autres widgets et de leur appliquer des propriétés comme la taille, la couleur, les marges, les bordures, etc. Il est utilisé pour créer des mises en page complexes et pour styliser les widgets.
  - Un 'text' est un widget qui permet d'afficher du texte à l'écran. Il est utilisé pour afficher des informations, des titres, des descriptions, etc. Il peut être stylisé avec différentes polices, tailles, couleurs, etc.
  - Un 'icon' est un widget qui permet d'afficher une icône à l'écran. Il est utilisé pour représenter des actions, des états, des catégories, etc. Il peut être stylisé avec différentes tailles, couleurs, etc.
  - Un 'button' est un widget qui permet d'interagir avec l'utilisateur en déclenchant une action lorsqu'il est pressé. Il peut être stylisé avec différentes formes, couleurs, tailles, etc. Il existe différents types de boutons comme les 'ElevatedButton', 'TextButton', 'IconButton', etc.
  - Un 'image' est un widget qui permet d'afficher une image à l'écran. Il est utilisé pour afficher des photos, des illustrations, des logos, etc. Il peut être stylisé avec différentes tailles, formes, bordures, etc.
  - Un 'listview' est un widget qui permet d'afficher une liste d'éléments à l'écran. Il est utilisé pour afficher des collections de données, comme des articles, des contacts, des messages, etc. Il peut être stylisé avec différentes tailles, couleurs, formes, etc. Il peut être défilé verticalement ou horizontalement.
  - Un 'gridview' est un widget qui permet d'afficher une grille d'éléments à l'écran. Il est utilisé pour afficher des collections de données, comme des photos, des produits, des vidéos, etc. Il peut être stylisé avec différentes tailles, couleurs, formes, etc. Il peut être défilé verticalement ou horizontalement.
  - Un 'stack' est un widget qui permet de superposer plusieurs widgets les uns sur les autres. Il est utilisé pour créer des mises en page complexes, comme des cartes, des pop-ups, des animations, etc. Il peut être stylisé avec différentes tailles, couleurs, formes, etc.
  - Un 'column' est un widget qui permet d'afficher plusieurs widgets les uns en dessous des autres. Il est utilisé pour créer des mises en page verticales, comme des formulaires, des listes, des menus, etc. Il peut être stylisé avec différentes tailles, couleurs, formes, etc.
  - Un 'row' est un widget qui permet d'afficher plusieurs widgets les uns à côté des autres. Il est utilisé pour créer des mises en page horizontales, comme des barres d'outils, des menus, des boutons, etc. Il peut être stylisé avec différentes tailles, couleurs, formes, etc.

  - Un 'MaterialApp' est un widget qui fournit une structure de base pour l'application, comme un thème, une navigation, etc. Il est utilisé pour créer une application Flutter qui suit les directives de conception Material Design.
  - Un 'StatelessWidget' est un widget qui ne change pas d'état. Il est utilisé pour créer des widgets qui ne dépendent pas de l'état de l'application, comme un texte, une image, un bouton, etc. Il est utilisé pour créer des widgets qui sont statiques et ne changent pas d'apparence ou de comportement.
  - Un 'StatefulWidget' est un widget qui peut changer d'état. Il est utilisé pour créer des widgets qui dépendent de l'état de l'application, comme un formulaire, une liste, un compteur, etc. Il est utilisé pour créer des widgets qui sont dynamiques et peuvent changer d'apparence ou de comportement en fonction de l'état de l'application.
  - Un 'setState()' est une méthode qui permet de mettre à jour l'état d'un 'StatefulWidget'. Elle est utilisée pour notifier le framework Flutter qu'un changement d'état a eu lieu et que le widget doit être reconstruit. Elle prend une fonction en paramètre qui contient le code qui modifie l'état du widget. Lorsque cette fonction est exécutée, le widget est reconstruit avec le nouvel état.
  - Un 'hot reload' est une fonctionnalité de Flutter qui permet de recharger l'application en cours d'exécution sans perdre son état. Il est utilisé pour accélérer le développement en permettant aux développeurs de voir les changements apportés au code immédiatement dans l'application. Il peut être déclenché en appuyant sur le bouton "Hot Reload" dans l'IDE ou en utilisant le raccourci clavier "r" dans la console.
  - Un 'hot restart' est une fonctionnalité de Flutter qui permet de redémarrer l'application en cours d'exécution et de réinitialiser son état. Il est utilisé pour réinitialiser l'application à son état initial, ce qui peut être utile pour tester des scénarios spécifiques ou pour résoudre des problèmes liés à l'état de l'application. Il peut être déclenché en appuyant sur le bouton "Hot Restart" dans l'IDE ou en utilisant le raccourci clavier "R" dans la console.
  - Un 'debug painting' est une fonctionnalité de Flutter qui permet de visualiser les limites et les marges des widgets dans l'application. Il est utilisé pour aider les développeurs à comprendre comment les widgets sont disposés et comment ils interagissent les uns avec les autres. Il peut être activé en appuyant sur le bouton "Toggle Debug Paint" dans l'IDE ou en utilisant le raccourci clavier "p" dans la console.
  - Un 'widget tree' est une structure hiérarchique qui représente l'ensemble des widgets dans une application Flutter. Il est utilisé pour organiser les widgets de manière logique et pour gérer leur état et leur apparence. Chaque widget dans le 'widget tree' peut avoir des enfants, qui sont eux-mêmes des widgets, créant ainsi une structure arborescente. Le 'widget tree' est construit à partir du widget racine, qui est généralement un 'MaterialApp' ou un 'CupertinoApp', et se développe vers le bas avec des widgets enfants.
  - Un 'element tree' est une structure hiérarchique qui représente l'ensemble des éléments dans une application Flutter. Il est utilisé pour gérer l'état et l'apparence des widgets dans le 'widget tree'. Chaque élément dans l''element tree' correspond à un widget dans le 'widget tree', mais il contient également des informations supplémentaires sur l'état et l'apparence du widget. L''element tree' est construit à partir de l'élément racine, qui est généralement un 'Element' associé au widget racine, et se développe vers le bas avec des éléments enfants.
  - Un 'render tree' est une structure hiérarchique qui représente l'ensemble des objets de rendu dans une application Flutter. Il est utilisé pour gérer l'affichage des widgets à l'écran et pour optimiser les performances de rendu. Chaque objet de rendu dans le 'render tree' correspond à un élément dans l''element tree', mais il contient également des informations supplémentaires sur la position, la taille et l'apparence du widget. Le 'render tree' est construit à partir de l'objet de rendu racine, qui est généralement un 'RenderObject' associé à l'élément racine, et se développe vers le bas avec des objets de rendu enfants.
  - Un 'widget inspector' est un outil de développement qui permet d'examiner et de déboguer les widgets dans une application Flutter. Il est utilisé pour visualiser le 'widget tree', l''element tree' et le 'render tree', ainsi que pour inspecter les propriétés et l'état des widgets. Le 'widget inspector' peut être activé en appuyant sur le bouton "Toggle Widget Inspector" dans l'IDE ou en utilisant le raccourci clavier "i" dans la console.
*/
void main() {
  // runApp(const MyApp());
  runApp(const MyWidget());

  /* Les bases du langage 'dart'
  */
  var name = "Adama"; // Ou.. 'String name..' vu que 'dart' trouve le type automatiquement
  int age = 24;
  double height = 1.75;
  bool isStudent = true;
  // Par défaut une variable est non nullable, pour la rendre nullable on ajoute un '?' après le type 'int?..'
  // Les opérations arithmétiques !!
  // !! de comparaison '==', '!=', '<', '>', '<=', '>='

  /* Les conditions et boucles
  */
  if (age >= 18) {
    print("Vous êtes majeur");
  } else if (age == 18) {
    print("Vous avez 18 ans");
  } else {
    print("Vous êtes mineur");
  }

  switch (name) {
    case "Adama":
      print("Vous êtes Adama");
      break;
    case "Ali":
      print("Vous n'êtes pas Adama");
      break;
    default:
      print("Inconnu");
  }

  for (int i = 0; i < 5; i++) {
    print(i);
  }

  while (age < 30) {
    // S'éxécute tant que la condition est vraie
    print(age);
    age++;
  }

  do {
    // S'éxécute au moins une fois puis tant que la condition est vraie :: même si la condition de départ est fausse, le bloc de code s'éxécute au moins une fois
    print(age);
    age++;
  } while (age < 30);

  List<String> fruits = ["Pomme", "Banane", "Orange"]; /*
    On peut utiliser var fruits = ["Pomme", "Banane", "Orange"]; mais le type de la liste sera 'List<dynamic>' et on ne pourra pas utiliser les méthodes spécifiques aux listes de type 'String' comme 'fruits.join(", ")' par exemple
   */
  // var fruits2 = <String>[]; Ou List<String> fruits2 = []; pour créer une liste vide de type 'String'
  for (String fruit in fruits) {
    // Boucle for-in pour parcourir une liste ou les collections de données
    print(fruit);
  }

  fruits.add("Kiwi"); // Ajoute un élément à la liste
  fruits.remove("Banane"); // Supprime un élément de la liste
  fruits.removeAt(1); // Supprime l'élément à l'index 1 de la liste
  fruits.insert(1, "Mangue"); // Insère un élément à l'index 1 de la liste
  fruits.sort(); // Trie la liste par ordre alphabétique

  Set<String> couleurs = {"Rouge", "Vert", "Bleu"}; // Un 'Set' est une collection d'éléments uniques, contrairement à une liste qui peut contenir des doublons
  Map<String, int> ages = {"Adama": 24, "Ali": 30, "Awa": 20}; // Un 'Map' est une collection de paires clé-valeur, contrairement à une liste qui ne contient que des valeurs

  print(
    "$age, $couleurs['Rouge']",
  ); // '$' pour utiliser une variable dans une chaîne de caractères
  ages.forEach((key, value) {
    print("$key: $value");
  }); // Boucle forEach pour parcourir un 'Set' ou les collections de données

  /* Les fonctions
   */
  myFunction(
    name,
    age,
  ); // Appel de la fonction 'myFunction' avec les paramètres 'name' et 'age'
  add(5, 10); // Appel de la fonction 'add' avec les paramètres '5' et '10'
  moyenne([
    10,
    15,
    20,
  ]); // Appel de la fonction 'moyenne' avec une liste de notes
} /*
  - On.. créer un 'StatelessWidget' qui sera le point d'entrée de notre application, la différence avec un 'StatefulWidget'
*/

void myFunction(String name, int age) {
  print("Bonjour $name, vous avez $age ans");
}

int add(int a, int b) {
  return a + b;
} // Ou.. int add(int a, int b) => a + b; - Fonction fléchée

double moyenne(List<int> notes) {
  int somme = 0;
  for (int note in notes) {
    somme += note;
  }
  return somme / notes.length;
} // Ou.. double moyenne(List<int> notes) => notes.reduce((a, b) => a + b) / notes.length; - Fonction fléchée

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter')),
        backgroundColor: Colors.blue,
        body: const Center(child: Text('Hello World')), // Le body recois un widget, ici un 'Center' qui contient un 'Text' pour afficher du texte centré
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Bouton cliqué');
          },
          child: const Icon(Icons.add),
        ), // Un bouton flottant qui déclenche une action lorsqu'il est pressé, flutter fournit de base des icons via 'Icons.'
      ) /*
        - 'Scaffold()' pour avoir une page blanche
      */,
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
