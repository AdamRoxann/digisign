import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digisign/inside_app/pages/account.dart';
import 'package:digisign/inside_app/pages/contact.dart';
import 'package:digisign/inside_app/pages/donation.dart';
import 'package:digisign/inside_app/pages/settings.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int pageIndex = 1;

  final Contact _contact = Contact();
  final Settings _settings = Settings();
  final Donation _donation = Donation();
  final Account _account = Account();

  Widget _showPage = new Settings();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _contact;
        break;  

      case 1:
        return _settings;
        break;

      case 2:
        return _donation;
        break;

      case 3:
        return _account;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.phone,
            size: 30,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
          Icon(
            Icons.attach_money,
            size: 30,
          ),
          Icon(
            Icons.person_outline,
            size: 30,
          ),
        ],
        color: Color.fromRGBO(15, 213, 152, 1),
        buttonBackgroundColor: Color.fromRGBO(15, 213, 152, 1),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
