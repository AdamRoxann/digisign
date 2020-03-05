import 'package:flutter/material.dart';

import 'package.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(15, 213, 152, 1),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            title: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(15, 213, 152, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    'Digisign',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Monotype Corsiva',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Palatino Linotype',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 40,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 25,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama Masjid',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 25,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'E - mail',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 25,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: _toggleVisibility,
                        icon: _isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 25,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Lokasi Masjid',
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
                  OutlineButton(
                    highlightElevation: 1,
                    splashColor: Colors.blue,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Color.fromRGBO(15, 213, 152, 1),
                    child: Text(
                      'Pilih Package',
                      style: TextStyle(
                        color: Color.fromRGBO(15, 213, 152, 1),
                        fontSize: 20,
                        fontFamily: 'Georgia',
                      ),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(15, 213, 152, 1),
                      width: 2,
                    ),
                    onPressed: () async {
                      var navigationResult = await Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => Package(),
                        ),
                      );
                      if (navigationResult == true) {
                        MaterialPageRoute(
                          builder: (context) => Package(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 30,
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
                      'Konfirmasi',
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
          ],
        ),
      ),
    );
  }
}
