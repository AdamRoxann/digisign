import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          backgroundColor: Color.fromRGBO(5, 213, 152, 1),
          elevation: 2,
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(15, 213, 152, 1),
          ),
          title: Text(
            'Account',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: Container(
                child: Text(
                  'Masjid A',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              child: Container(
                child: Text(
                  'Jl. Lorem Ipsum Dolor Sit Amet',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 45,
              ),
              child: Container(
                child: Text(
                  'Gold',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              child: Container(
                child: Image.asset(
                  'assets/images/Gold_Medal.png',
                  width: 80,
                  height: 80,
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Container(
                child: Text(
                  'SISA MASA PACKAGE',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                child: Text(
                  '40 HARI',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
