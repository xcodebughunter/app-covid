import 'package:flutter/material.dart';
import 'package:app_covid_19/pages/inicio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'Covid 19',
      initialRoute: '/',
      routes: {
        '/': ( BuildContext context ) => InicioPage(),
      }
    );
  }
}