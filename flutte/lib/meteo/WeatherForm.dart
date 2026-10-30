import 'package:flutte/api/WeatherApi.dart';
import 'package:flutte/meteo/LoadingButton.dart';
import 'package:flutte/meteo/WeatherDetailPage.dart';
import 'package:flutter/material.dart';

class WeatherFormPage extends StatefulWidget {
  @override
  State<WeatherFormPage> createState() => _WeatherFormPageState();
}

class _WeatherFormPageState extends State<WeatherFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cityController = TextEditingController(text: 'Paris');
  bool _loading = false; /*
    - Pour gérer le chargement
  */

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      final forecast = await WeatherApi().fetch(cityController.text); /*
        - On va chercher les données de la ville
      */
      Navigator.pushNamed(
        context,
        WeatherDetailPage.routeName,
        arguments: forecast,
      ); /*
        - On navigue vers la page de détail en passant les données qu'on a récupérées dans 'ForecastArguments'
      */

      // debugger();
      /* ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(cityController.text))); 
        - Un ex pour traiter les informations
      */
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  void _onSubmitText(String text) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choisir votre ville')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch /*
            - Pour que le bouton prenne toute la largeur
          */,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: cityController,
                /*
                  onSubmitted: _onSubmitText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Rechercher une ville',
                  ),
                */
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Vous devez rentrer une ville';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 8),
            /*
              ElevatedButton(
                onPressed: _onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.all(16),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Rechercher'),
              ),
            */
            LoadingButton(
              loading: _loading,
              label: 'Rechercher',
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
