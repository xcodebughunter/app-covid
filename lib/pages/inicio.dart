import 'package:app_covid_19/providers/covid19_provider.dart';
import 'package:flutter/material.dart';

import 'package:app_covid_19/pages/paises.dart';
import 'package:app_covid_19/pages/global.dart';
import 'package:provider/provider.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {

  int _selectedIndex = 0;
  
  List<Widget> _widgetOptions = <Widget>[
    PaisesPage(),
    GlogalPage()
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19'),
      ),
      body:  Provider(
          create: (_) => new Covid19Provider(),
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sort),
            title: Text('Confirmados')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text('Estadísticas')
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}