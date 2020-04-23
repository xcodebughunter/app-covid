import 'package:app_covid_19/models/paises_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:app_covid_19/providers/covid19_provider.dart';


class PaisesPage extends StatefulWidget {
  @override
  _PaisesPageState createState() => _PaisesPageState();
}

class _PaisesPageState extends State<PaisesPage> {

  final _textDetail = TextStyle( fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF000000));

  @override
  Widget build(BuildContext context) {

    final covidProvider = Provider.of<Covid19Provider>(context, listen: false);
    covidProvider.obtenerPaises();

    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      covidProvider.listadoPaisesConfirmedAsc();
                    },
                    child: const Text(
                      'Confirmadas ASC',
                      style: TextStyle(fontSize: 12)
                    ),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      covidProvider.listadoPaisesConfirmedDesc();
                    },
                    child: const Text(
                      'Confirmadas DESC',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
            FutureProvider(
              create: (_) async => covidProvider.listadoPaises,
              lazy: false,
              child: Consumer<Covid19Provider>(
                builder: (BuildContext context, data, child) {
                  if ( data.paises.length > 0 ) {
                    return Expanded( 
                      child: ListView.separated(
                        itemCount: data.paises.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ExpansionTile(
                            title: Text('${data.paises[index].country}'),
                            children: <Widget>[
                              Divider(height: 5.0),
                              ListTile(
                                title: Column(
                                  children: <Widget>[
                                    Text('Nuevos confirmados: ${data.paises[index].newConfirmed}', style: _textDetail).py12(),
                                    Text('Total confirmados: ${data.paises[index].totalConfirmed}', style: _textDetail).py12()
                                  ],
                                ),
                                subtitle: Text('Fecha actualización: ${data.paises[index].date}', textAlign: TextAlign.right, ).py20(),
                              ),
                            ],
                          );
                        }, 
                        separatorBuilder: (context, index) {
                          return Divider();
                        },)
                      );
                  } else {
                    return Container(
                      height: 400.0,
                      child: Center(
                        child: CircularProgressIndicator()
                      )
                    );
                  }
                },
              )
            )
          ],
        ),
      );
  }
}
