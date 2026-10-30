import 'package:flutter/material.dart';

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout'),
        backgroundColor: Colors.blue,
        leading: Icon(Icons.logo_dev),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))] /*
          - 'leading' se positionne à gauche
          - 'actions' !! à droite
        */,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: Icon(Icons.account_circle, size: 50),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start /*
                    - 'crossAxisAlignment' pour aligner les widgets enfants sur l'axe horizontal
                      - 'CrossAxisAlignment.start' !! à gauche
                      - '..center' !! centrer les widgets enfants
                      - '..end' !! aligner les widgets enfants à droite
                  */,
                  mainAxisSize: MainAxisSize.min /*
                    - 'mainAxisSize' la taille de la colonne est définie par le contenu
                      - 'MainAxisSize.min' pour que la colonne prenne la taille minimale nécessaire pour contenir ses enfants
                      - '..max' !! toute la hauteur disponible
                  */,
                  children: [
                    Text(
                      'Flutter McFlutter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Expérienced App Developper',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween /*
                - 'mainAxisAlignment' pour aligner les widgets enfants sur l'axe vertical
                  - 'MainAxisAlignment.start' !! en haut
                  - '..center' !! centrer les widgets enfants
                  - '..end' !! aligner les widgets enfants en bas
                  - '..spaceBetween' !! espacer les widgets enfants de manière égale entre eux
                  - '..spaceAround' !! les widgets enfants de manière égale autour d'eux
                  - '..spaceEvenly' !! les widgets enfants de manière égale entre eux et autour d'eux
              */,
              children: [
                Text(
                  '123 Main Street',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '(415) 555-0198',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.accessibility, size: 50),
                Icon(Icons.timer, size: 50),
                Icon(Icons.phone_android, size: 50),
                Icon(Icons.phone_iphone, size: 50),
              ],
            ) /*
              - 'Row' pour afficher des widgets enfants les uns à côté des autres
              - 'Icon' !! une icône
            */,
            SizedBox(height: 16),
            Image(image: AssetImage('assets/1.png')),
            SizedBox(height: 16),
            /* Dans 'readme'
             */
            Container(
              height: 100,
              width: 100,
              color: Colors.red.shade400,
              child: Center(
                child: Text(
                  'Conteneur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(child: Text('Ok')),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 50,
                    child: Center(child: Text('1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    child: Center(child: Text('2')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    height: 50,
                    child: Center(child: Text('3')),
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Text(
                    'Bienvenue dans l\'application',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Text(
                    'Bienvenue dans l\'application',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.yellow),
                  title: Text('Info'),
                  subtitle: Text('Lorem..'),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person, color: Colors.lightBlue),
                  title: Text('Person ${index + 1}'),
                  subtitle: Text('Détail de la personne ${index + 1}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                );
              },
            ) /*
              - 'itemBuilder' l'élément qu'on veut construire
              - 'itemCount' le nombre d'élément qu'on veut ajouter
            */,
            GridView.count(
              crossAxisCount: 2,
              children: List.generate(6, (index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'Card ${index + 1}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              }),
            ),
            Stack(
              children: [
                Container(color: Colors.black, width: 300, height: 200),
                const Positioned(
                  top: 10,
                  left: 10,
                  child: FittedBox(
                    child: Text(
                      'Text haut gauche',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => print('Conteneur cliqué'),
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.red,
                    child: Center(child: Text('Cliqué ici')),
                  ),
                ),
              ],
            ),
            ColoredBox(color: Colors.black, child: Container()),
            /*
              bool isSeleted = false;
              ChoiceChip(label: Text('Choisir'), avatar: Icon(Icons.check), selected: isSeleted, onSelected: (value) => {
                setState(() => {
                  isSeleted = value;
                })
              },) -- On l'utilise dans 'Stateful..'
            */
            Stack(
              children: [
                Center(
                  child: Container(width: 200, height: 200, color: Colors.blue),
                ),
                Center(
                  child: Container(width: 150, height: 150, color: Colors.red),
                ),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 40,
                  child: Container(width: 250, height: 250, color: Colors.blue),
                ),
                Positioned(
                  top: 80,
                  left: 80,
                  child: Container(width: 250, height: 250, color: Colors.red),
                ),
                Positioned(
                  top: 120,
                  left: 120,
                  child: Container(
                    width: 250,
                    height: 250,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Center(child: Wrap(children: [])),
            HomePage(),
          ],
        ),
      ) /*
        - 'Padding' pour avoir un padding autour du widget enfant
          - 'EdgeInsetsGeometry.all(8)' !! définir un padding de 8 pixels sur tous les côtés
        - 'ColoredBox' !! entourer en couleur
        - 'Column' !! afficher des widgets enfants les uns en dessous des autres
        - 'SizedBox' !! avoir un espace entre les widgets enfants
        - 'Expanded' !! que le widget parte du début jusqu'à la fin de la page, dans une 'Row' prend tout l'espace disponible
        - 'ListView' !! utile pour une liste connue, mais pour une liste inconnue 'ListView.builder'
          - 'ListTile' !! créer des petites tiles..
        - 'Stack' !! superposer plusieurs widgets, utile pour afficher un texte ou icône par dessus une image
          - 'Positioned' !! positionner un élément en fonction du parent lorsqu'il se trouve dans un 'Stack'
        - 'GestureDetector' !! l'intéraction
      */,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Accueil'),
                Tab(icon: Icon(Icons.settings), text: 'Paramètre'),
                Tab(icon: Icon(Icons.person), text: 'Profil'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Contenu de l\'onglet accueil')),
                  Center(child: Text('Contenu de l\'onglet paramètre')),
                  Center(child: Text('Contenu de l\'onglet profil')),
                ],
              ),
            ) /*
              - 'Expanded' nécéssaire pour que la 'TabBarView' prenne tout l'espace disponible sinon on aura une erreur
            */,
          ],
        ),
      ),
    );
  }
}

class ListReoder extends StatefulWidget {
  @override
  State<ListReoder> createState() => _ListReoderState();
}

class _ListReoderState extends State<ListReoder> {
  final List<String> items = ['A', 'B', 'C', 'D'];
  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        children: [
          for (final item in items)
            ListTile(
              key: ValueKey(item),
              title: Text('Item ${item}'),
              trailing: Icon(Icons.drag_handle),
            ), // 'trailing' pour placer l'icône à la fin ou 'leading' au début
        ],
        onReorder: (oldIndex, newIndex) => onReorder(oldIndex, newIndex),
      ),
    );
  }
}
