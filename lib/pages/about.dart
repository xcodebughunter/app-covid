import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 93.0,
                      backgroundColor: Colors.blueAccent,
                      child: CircleAvatar(
                        radius: 90.0,
                        backgroundImage: NetworkImage(
                            'http://jochiduarte.com.co/wp-content/uploads/2020/04/Foto_BW_Vertical.jpg'),
                      ),
                    ),
                    Text(
                      'Jose Luis Duarte',
                      style:TextStyle(color: Colors.blueAccent, fontSize: 30),
                      textAlign: TextAlign.center,
                    ).py16(),
                    Text('info@jochiduarte.com.co',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center
                    ).pOnly(bottom: 10.0)
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Built with '),
                    Icon(
                      Icons.favorite,
                      color: Colors.blueAccent,
                    ),
                    Text(' in Flutter')
                  ],
                ).p20(),
              ],
            ),
          ],
        ),
      );
  }
}