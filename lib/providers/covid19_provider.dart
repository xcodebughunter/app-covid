import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app_covid_19/models/paises_model.dart';

class Covid19Provider {
  
  // URL API
  final String _url = 'https://api.covid19api.com';

  List<Country> _paises = [];
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
    
    _paises = [];

    final url = '$_url/summary';

    final resp = await http.get( url );

    final decodedData = json.decode(resp.body);
    
    final paisesData = new Paises.fromJsonList(decodedData["Countries"]);

    final estadisticasData = new Global.fromJson(decodedData["Global"]);

    _paises = paisesData.items;
    _estadisticas = estadisticasData;
    
    return _paises;
  }

  List<Country> get listadoPaises => _paises;

  Global get estadisticas => _estadisticas;

  get listadoPaisesConfirmedDesc => _paises.sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
  get listadoPaisesConfirmedAsc => _paises.sort((b, a) => a.totalConfirmed.compareTo(b.totalConfirmed));
}