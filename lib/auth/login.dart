import 'package:digisign/auth/sign_up.dart';
import 'package:digisign/inside_app/navbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    'LOGIN',
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
                      'Masuk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Georgia',
                      ),
                    ),
                    onPressed: () async {
                      var navigationResult = await Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ),
                      );
                      if (navigationResult == true) {
                        MaterialPageRoute(
                          builder: (context) => NavBar(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            FlatButton(
              color: Colors.white,
              child: Text(
                'Belum Menjadi Admin?',
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
                    builder: (context) => SignUp(),
                  ),
                );
                if (navigationResult == true) {
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
