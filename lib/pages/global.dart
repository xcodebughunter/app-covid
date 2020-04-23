import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:app_covid_19/providers/covid19_provider.dart';

class GlogalPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final covidProvider = Provider.of<Covid19Provider>(context, listen: true);
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Nuevas confirmadas: ${ covidProvider.estadisticas.newConfirmed }').py4(),
            Text('Total confirmadas: ${ covidProvider.estadisticas.totalConfirmed }').py4(),
            Text('Nuevas muertes: ${ covidProvider.estadisticas.newDeaths }').py4(),
            Text('Total muertes: ${ covidProvider.estadisticas.totalDeaths }').py4(),
            Text('Nuevos recuperados: ${ covidProvider.estadisticas.newRecovered }').py4(),
            Text('Total recuperados: ${ covidProvider.estadisticas.totalRecovered }').py4()
          ],
        ),
      );
  }
}