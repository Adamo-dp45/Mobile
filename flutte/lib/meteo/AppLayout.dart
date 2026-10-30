import 'package:flutte/Theme.dart';
import 'package:flutte/meteo/AboutPage.dart';
import 'package:flutte/meteo/NestedNavigation.dart';
import 'package:flutte/meteo/WeatherDetailPage.dart';
import 'package:flutte/meteo/WeatherForm.dart';
import 'package:flutte/meteo/WeatherPage.dart';
import 'package:flutte/pages/home.dart';
import 'package:flutte/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';

class AppLayout extends StatefulWidget {
  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;
  static List<Widget> _tabViews = [WeatherPage(), AboutPage(), Home()]; /*
    - 'List' vu qu'il peut être parcourir avec des index
  */
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    }); /*
      - 'setState' pour changer l'état
    */
  }

  Future<bool> _onPop() async {
    Widget _selectedWidget = _tabViews[_selectedIndex];
    if (_selectedWidget is NestedNavigation) {
      bool isFirstRouteInCurrentTab =
          !await (_selectedWidget as NestedNavigation)
              .navigationKey()
              .currentState!
              .maybePop();
      if (!isFirstRouteInCurrentTab) {
        /*
        - Si on n'est pas sur la première route..
      */
        return Future.value(false);
      }
      if (_selectedIndex != 0) {
        _onTap(0);
        return Future.value(false);
      }
    }
    return Future.value(true);
  } /*
    - Pour que lors du 1er clique sur le bouton retour du téléphone ça ramène à l'onglet 1.. mais on triche un peu ici vu qu'on a que 3 onglets
  */

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        appBar: AppBar(title: Text('Météo')),
        body: Center(child: _tabViews[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTap /*
          - Pour piloter les onglets
        */,
          currentIndex: _selectedIndex,
          backgroundColor: MyThemeColors.red,
          unselectedItemColor: MyThemeColors.redDark /*
          - 'Colors.amber[900]' pour controller le constract
        */,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Buisness',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Navigation',
            ),
          ],
        ),
      ) /*
        - 'bottomNavigationBar' la barre de navigation en bas
      */,
    ); /*
      - Le 'WillPopScope(onWillPop: _onPop, child: ..)' est déprécié par 'PopScope'
    */
  }
}
