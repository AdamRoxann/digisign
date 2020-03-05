import 'package:digisign/auth/packages/trial.dart';
import 'package:flutter/material.dart';

class Gold extends StatefulWidget {
  @override
  _GoldState createState() => _GoldState();
}

class _GoldState extends State<Gold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Text(
                    'GOLD',
                    style: TextStyle(
                      color: Color.fromRGBO(239, 199, 94, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/Gold_Medal.png',
                  ),
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 45,
                      ),
                      child: Text(
                        '• Max Playlist 3 \n'
                        '• Max Background Image 5 \n'
                        '• Max Operator 3',
                        style: TextStyle(
                          color: Color.fromRGBO(239, 199, 94, 1),
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 45,
                      ),
                      child: Text(
                        'PRICE: \n'
                        'Rp. x.xxx.xxx',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(239, 199, 94, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 45,
                  right: 85,
                  left: 85,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      elevation: 1,
                      splashColor: Colors.blue,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Color.fromRGBO(15, 213, 152, 1),
                      child: Text(
                        'Pilih',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Georgia',
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.white,
                child: Text(
                  'Coba Trial Disini',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () async {
                  var navigationResult = await Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Trial(),
                    ),
                  );
                  if (navigationResult == true) {
                    MaterialPageRoute(
                      builder: (context) => Trial(),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
