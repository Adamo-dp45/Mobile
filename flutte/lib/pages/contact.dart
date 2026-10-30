import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const new({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController controller = TextEditingController();
  String name = '';
  void submit() {
    setState(() {
      name = 'Mon nom est : ${controller.text}';
    });
  } /*
    - Va s'exécuter via un bouton
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              spacing: 16,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    label: Text('Nom'),
                    hintText: 'Entrez votre texte',
                    border: OutlineInputBorder(),
                  ) /*
                    - 'keyboardType: TextInputType.number' pour afficher le clavier numérique
                  */,
                ),
                ElevatedButton(onPressed: submit, child: Text('Envoyer')),
                Text(name) /*
                  - Pour que '${controller.text}' s'actualise on utilise le 'setState()'
                */,
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Retourner à l\'accueil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} /*
  - 'Navigator.pop()' pour revenir à la page précédente, on.. qu'il y'a un bouton retour qui se place automatiquement si on un 'Scaffold()' et qu'à l'intérieur il y'a un 'AppBar()'
  - Formulaire..
    - 'TextField' !! un champ et fonctionne dans un 'StatefulWidget'
      - 'TextEditingController' !! recueillir ce que l'utilisateur entre
  - 'Column'..
    - 'spacing' !! séparer les éléments ou 'SizedBox(height: 16)'
  - 'Padding'..
    - 'EdgeInsetsGeometry.symmetric(horizontal: 16)' sur l'axe horizontal
*/
