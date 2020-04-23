import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_covid_19/models/paises_model.dart';

class Covid19Provider with ChangeNotifier{
  
  // URL API
  final String _url = 'https://api.covid19api.com';

  List<Country> paises = [];
  Global _estadisticas = Global(
    newConfirmed: 1,
    totalConfirmed: 1,
    newDeaths: 1,
    totalDeaths: 1,
    newRecovered: 1,
    totalRecovered: 1,
  );

  // List
  Future<List<Country>> obtenerPaises() async {
    paises = [];

    final url = '$_url/summary';

    final resp = await http.get( url );

    final decodedData = json.decode(resp.body);
    
    final paisesData = new Paises.fromJsonList(decodedData["Countries"]);

    final estadisticasData = new Global.fromJson(decodedData["Global"]);

    paises = paisesData.items;
    _estadisticas = estadisticasData;
    
    notifyListeners();
    return paises;
  }

  List<Country> get listadoPaises => paises;

  Global get estadisticas => _estadisticas;

  void listadoPaisesConfirmedAsc() async{ 
    paises.sort((a, b) => a.country.compareTo(b.country));
    paises.sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
    notifyListeners();
  }
  void listadoPaisesConfirmedDesc() async{
    paises.sort((a, b) => a.country.compareTo(b.country));
    paises.sort((b, a) => a.totalConfirmed.compareTo(b.totalConfirmed));
    notifyListeners();
  }
}