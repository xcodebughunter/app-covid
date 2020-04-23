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

  final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {

    final covidProvider = Provider.of<Covid19Provider>(context, listen: false);
    covidProvider.obtenerPaises();

    Widget _buttonSort(String text, int action) {
      return Expanded(
        child: RaisedButton(
          color: Colors.redAccent,
          textColor: Color(0xFFFFFFFF),
          onPressed: () {
            switch(action){
              case 1:
                covidProvider.listadoPaisesConfirmedAsc();
                break;
              case 2:
                covidProvider.listadoPaisesConfirmedDesc();
                break;
            }
          },
          child: new Text(
            text,
            style: TextStyle(fontSize: 10)
          ),
        ),
      );
    }

    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Row(
                children: <Widget>[
                  Text("Ordenar por confirmadas: ", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFFFFFFFF)
                  ),),
                  Spacer(),
                  _buttonSort('Asc', 1),
                  SizedBox(width: 14,),
                  _buttonSort('Desc', 2),
                ],
              ),
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
                          return Card(
                              elevation: 3,
                              child: ExpansionTile(
                              title: Text('${data.paises[index].country}'),
                              children: <Widget>[
                                Divider(height: 5.0),
                                ListTile(
                                  title: Column(
                                    children: <Widget>[
                                      Text('Nuevos confirmados: ${data.paises[index].newConfirmed.toString().replaceAllMapped(reg, mathFunc)}', style: _textDetail).py12(),
                                      Text('Total confirmados: ${data.paises[index].totalConfirmed.toString().replaceAllMapped(reg, mathFunc)}', style: _textDetail).py12()
                                    ],
                                  ),
                                  subtitle: Text('Fecha actualización: ${data.paises[index].date}', textAlign: TextAlign.right, ).py20(),
                                ),
                              ],
                            )
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
