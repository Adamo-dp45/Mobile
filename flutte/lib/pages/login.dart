import 'package:flutte/widgets/textField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const new({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, size: 80),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                'Une expérience unique',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              MyTextField(
                hintText: 'Pseudo',
                icon: Icons.person_outline,
                obscureText: false,
              ),
              MyTextField(
                hintText: 'Mot de passe',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Mot de passe oublié !',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Connexion',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Vous n\'avez pas de compte ? '),
                    TextSpan(
                      text: 'S\'inscrire',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Continuer avec',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.apple),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    color: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.g_mobiledata_outlined),
                    ),
                  ) /*
                    - Ou.. un composant personnalisé 'MyTile'
                  */,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} /*
  - 'SafeArea()' !! éviter de prendre tout l'écran, comme après le haut du téléphone
  - 'Container' !! rendre un texte cliquable on.. 'InkWell' ou 'GestureDetector'
    - 'decoration' !! la décoration du conteneur
  - 'RichText' !! avoir 2 éléments sur une même avec des styles différents via 'TextSpan()'
  - 'Card'..
    - 'elevation' !! l'ombre
*/
