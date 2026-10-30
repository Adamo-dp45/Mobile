import 'package:english_words/english_words.dart';
import 'package:flutte/Theme.dart';
import 'package:flutte/meteo/AppLayout.dart';
import 'package:flutte/pages/contact.dart';
import 'package:flutte/pages/home.dart';
import 'package:flutte/pages/login.dart';
import 'package:flutte/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:truncate/truncate.dart'; /*
  - 'import' pour importer une librairie, 'as ..' !! lui donner un alias
*/

/*
  Spécifique du langage
    - 'late String temp = _readThermometer()' pour créer une fonction si la variable est accéder
    - 'b ??= value' va assigner une valeur si 'b' n'en a pas déjà
    - querySelector('#bo')
      ?..text = 'confirm'
      ..classes.add('important')
      ..onClick.. -- Si le sélecteur est null il ne fais pas ce qui suit
    - On.. pas obligé de mettre le 'new' pour instancier une class
    - '_' pour indiquer qu'une fonction est privée
*/
void main() {
  runApp(const MyWidget()); /*
    - On.. le point d'entrée de notre application
    - Ou.. 'void main() => runApp(const MyWidget())' le arrow notation pour renvoyer directement
  */

  /* Les bases du langage 'Dart'
  */
  var name = "Adama"; // Ou.. 'String name..' vu que 'Dart' trouve le type automatiquement
  int age = 24; /*
    - 'String transform = age.toString()' pour transformer un entier en chaîne
    - 'int one = int.parse('1'); assert(one == 1)' !! une chaîne en entier, 'double.' pour double
    - 'String piAsString = 3.14.toStringAsFixed(2); assert(piAsString == '3.14')' !! un double en chaîne
  */
  double height = 1.75;
  bool isStudent = true;
  /*
    - Par défaut une variable est non nullable, pour la rendre nullable on ajoute un '?' après le type 'int?..'
    - Les opérations arithmétiques !!
    - !! de comparaison '==', '!=', '<', '>', '<=', '>='
  */

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
    /*
    - Va s'éxécuter tant que la condition est vraie
    - 'break' pour arrêter
  */
    print(age);
    age++;
  }

  do {
    // !! au moins une fois même si la condition de départ est fausse
    print(age);
    age++;
  } while (age < 30);

  List<String> fruits = [
    "Pomme",
    "Banane",
    "Orange",
    if (age > 15) "Valeur conditionnelle",
    // for (var i in listOfInts) '#$i'
  ]; /*
    On.. utiliser 'var fruits = ["Pomme", "Banane", "Orange"];' mais le type de la liste sera 'List<dynamic>' et on ne pourra pas utiliser les méthodes spécifiques aux listes de type 'String' comme 'fruits.join(", ")' par exemple
   */
  // 'var fruits2 = <String>[];' Ou.. 'List<String> fruits2 = [];' pour créer une liste vide de type 'String'
  for (String fruit in fruits) {
    /*
    - Le 'for in' pour parcourir une liste ou les collections de données
    - 'continue' pour sauter du genre un return pour les for
  */
    if (age == 10) {
      continue;
    }
    print(fruit);
  }

  fruits.add("Kiwi"); /*
    - Le '.add()' pour ajouter un élément à la liste
    - !! '.remove()' !! supprimer
    - !! '.removeAt()' !! supprimer l'élément à l'index 1..
    - !! '.insert()' !! insérer un élément à l'index 1..
    - !! '.sort()' !! trier la liste par ordre alphabétique
  */
  fruits.remove("Banane");
  fruits.removeAt(1);
  fruits.insert(1, "Mangue");
  fruits.sort();

  Set<String> couleurs = {"Rouge", "Vert", "Bleu"}; /*
    - Un 'Set' est une liste non ordonnée d'éléments uniques, donc sans doublon
    - !! 'Map' !! de paires clé valeur contrairement à une liste qui ne contient que des valeurs
  */
  Map<String, int> ages = {"Adama": 24, "Ali": 30, "Awa": 20};

  print("$age, $couleurs['Rouge']"); /*
    - '$' pour utiliser une variable dans une chaîne de caractères
  */
  ages.forEach((key, value) {
    print("$key: $value"); /*
      - 'forEach' pour parcourir un 'Set' ou les collections de données
    */
  });

  /* Les fonctions
   */
  myFunction(name, age);
  add(5, 10);
  moyenne([10, 15, 20]);

  /* Exception
   */
  try {
    myFunction('Adama', 15);
  } on OutOfMemoryError {
    print('Out exception');
  } on Exception catch (e) {
    print(e.toString());
  } catch (e, s) {
    print('Les détails de l\'exception $e');
    print('La Stack trace $s'); /*
      - On peut 'rethrow;'
    */
  } finally {
    print('Exécuter quoi qu\'il se passe');
  }

  /* Class..
   */

  /* Async.. pour le 'Future' on.. 'async et await', !! 'Stream'..
   */
}

void myFunction(String name, int age) {
  print("Bonjour $name, vous avez $age ans");
}

int add(int a, int b) {
  return a + b;
} /*
  - Ou.. int add(int a, int b) => a + b; - Fonction fléchée
*/

double moyenne(List<int> notes) {
  int somme = 0;
  for (int note in notes) {
    somme += note;
  }
  return somme / notes.length;
} /*
  - Ou.. 'double moyenne(List<int> notes) => notes.reduce((a, b) => a + b) / notes.length;' une fonction fléchée
*/

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: MyThemeColors.red,
        primarySwatch: Colors.grey,
      ),

      supportedLocales: [const Locale('fr', '')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ] /*
        - !! gérer la local
      */,

      home: AppLayout() /*
          - Widgets() 
          - Scaffold(
          appBar: AppBar(
            title: const Text('Flutter'),
            actions: [
              IconButton(onPressed: _pushSaved, icon: Icon(Icons.widgets)),
            ],
          ),
          backgroundColor: Colors.blue,
          // body: const Center(child: Text('Hello World')),
          body: Center(child: RandomWords()),
          /*
            - Le body recois un widget, ici un 'Center' qui contient un 'Text' pour afficher du texte centré
            - 'Colors.' les couleurs de material
          */
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('Bouton cliqué');
            },
            child: const Icon(Icons.add),
          ) /*
            - Un bouton flottant qui déclenche une action lorsqu'il est pressé, 'Flutter' fournit de base des icons via 'Icons.'
          */,
        ),
      */,
      routes: {
        '/home': (context) => Home(),
        '/contact': (context) => Contact(),
        '/login': (context) => Login(),
      } /*
        - On.. l'a utiliser dans 'home.dart' via 'Navigator.pushNamed(context, '/contact')'
        - 'initialRoute: '/home'' !! définir une route initial
      */,
      debugShowCheckedModeBanner: false,
    );
  }
} /*
  - Le widget racine ne change pas d'état donc 'Stateless', configure l'application en appliquant le style Material Design de Google via 'MaterialApp'
  - 'build()' une méthode qui décrit l'interface, rappelée 0 chaque fois que l'état change
*/

void _pushSaved() {
  // Navigator.of(context).push(route) -- '.of()' pour afficher un nouvel écran
}

/* Pour créer un 'StatefulWidget' on.. '_RandomWords' qui sera le 'state' de 'RandomWords' puis dans 'MyWidget' - 'body'
 */
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
} /*
  - On le lie à un objet 'State'
*/

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    var text = 'This is a long text';
    var truncated = truncate(
      text,
      17,
      omission: '...',
      position: TruncatePosition.end,
    );
    print('$truncated : ${truncated.length} characters');
    return Text('Ok');
  }
}

/* ex
 */
class Compteur extends StatefulWidget {
  const Compteur({super.key});

  @override
  State<Compteur> createState() => _CompteurState();
}

class _CompteurState extends State<Compteur> {
  int valeur = 0;

  void incrementer() {
    setState(() {
      valeur++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Valeur : $valeur'),
        ElevatedButton(onPressed: incrementer, child: const Text('+1')),
      ],
    );
  }
}

/* Class
 */
class A {
  void hello() {
    print('Hello A');
  }
}

class B extends A {
  @override /*
    - 'override' optionnel et permet de se référer à la fonction de la class parente
  */
  void hello() {
    // TODO: implement hello
    return super.hello();
  }
}

/* Enum
 */
enum Color { red, green, blue }
/*
  void main() {
    assert(Color.red.index == 1);
  }
*/

/* Mixin
 */
mixin C {
  void good() {
    print('good');
  }
}

class Y with C {}

void main2() {
  var y = Y();
  y.good();
}
