import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:app_covid_19/providers/covid19_provider.dart';

class GlogalPage extends StatelessWidget {

  final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    final covidProvider = Provider.of<Covid19Provider>(context, listen: true);
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            cardData(
              Colors.orangeAccent,
              'Nuevas confirmadas',
              Icons.trending_up,
              covidProvider.estadisticas.newConfirmed,
            ),
            cardData(
              Colors.orangeAccent,
              'Total confirmadas',
              Icons.bug_report,
              covidProvider.estadisticas.totalConfirmed,
            ),
            cardData(
              Colors.redAccent,
              'Nuevas muertes',
              Icons.report,
              covidProvider.estadisticas.newDeaths,
            ),
            cardData(
              Colors.redAccent,
              'Total muertes',
              Icons.airline_seat_individual_suite,
              covidProvider.estadisticas.totalDeaths,
            ),
            cardData(
              Colors.green,
              'Nuevos recuperados',
              Icons.whatshot,
              covidProvider.estadisticas.newRecovered,
            ),
            cardData(
              Colors.green,
              'Total recuperados',
              Icons.healing,
              covidProvider.estadisticas.totalRecovered,
            )
          ],
        ),
      );
  }

  Widget cardData( Color color, String text, IconData icon, int data) {
    return Card(
        elevation: 4.0,
        color: Colors.blueGrey[50],
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(color: Colors.black, fontSize: 30)
                    ),
                    Text(
                      text,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    icon,
                    size: 60.0,
                    color: color,
                  ))
            ],
          ),
        ).p8(),
    ).px12();
  }
}

