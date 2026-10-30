import 'package:flutte/pages/contact.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        backgroundColor: Colors.cyan.shade400,
        child: ListView(
          children: [
            DrawerHeader(child: Icon(Icons.account_circle, size: 100)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text('Connexion'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contact()),
            );
          },
          child: Text('Contact'),
        ),
      ),
    );
  }
} /*
  - Dans 'main.dart' on le définie comme le point d'entrée via le 'body'
  - 'Navigator.push()' pour naviguer vers la page suivante
  - 'Navigator.pushNamed(context, '/contact')' !! une route nommé dans le 'MaterialApp()' du 'main.dart'
  - 'Drawer' !! menu latéral sur la barre de navigation
*/
