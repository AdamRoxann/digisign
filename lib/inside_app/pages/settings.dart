import 'package:digisign/inside_app/settings_pages/background_media.dart';
import 'package:digisign/inside_app/settings_pages/countdown.dart';
import 'package:digisign/inside_app/settings_pages/qr_sumbangan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:digisign/inside_app/board_pages/board.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          backgroundColor: Color.fromRGBO(15, 213, 152, 1),
          elevation: 2,
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(15, 213, 152, 1),
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            highlightColor: Colors.blue,
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.playlist_add,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Board',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () async {
              var navigationResult = await Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => Board(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => Board(),
                );
              }
            },
            disabledBorderColor: Colors.black,
          ),
          OutlineButton(
            highlightColor: Colors.blue,
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.landscape,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Background Media',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () async {
              var navigationResult = await Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => BackgroundMedia(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => BackgroundMedia(),
                );
              }
            },
            disabledBorderColor: Colors.black,
          ),
          OutlineButton(
            highlightColor: Colors.blue,
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.qrcode,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'QR Sumbangan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () async {
              var navigationResult = await Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => QrSumbangan(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => QrSumbangan(),
                );
              }
            },
            disabledBorderColor: Colors.black,
          ),
          OutlineButton(
            highlightColor: Colors.blue,
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Countdown',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () async {
              var navigationResult = await Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => Countdown(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => Countdown(),
                );
              }
            },
            disabledBorderColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
