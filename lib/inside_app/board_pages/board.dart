import 'package:digisign/inside_app/board_pages/background.dart';
import 'package:digisign/inside_app/board_pages/daftar_khotib.dart';
import 'package:digisign/inside_app/board_pages/jadwal_sholat.dart';
import 'package:digisign/inside_app/board_pages/pengumuman.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'current_date.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          backgroundColor: Color.fromRGBO(15, 213, 152, 1),
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Pengaturan Board',
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
                      FontAwesomeIcons.calendarAlt,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Current Date & Time',
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
                  builder: (context) => CurrentDate(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => CurrentDate(),
                );
              }
            },
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
                      Icons.people,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Daftar Khotib',
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
                  builder: (context) => DaftarKhotib(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => DaftarKhotib(),
                );
              }
            },
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
                      Icons.announcement,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Pengumuman',
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
                  builder: (context) => Pengumuman(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => Pengumuman(),
                );
              }
            },
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
                      FontAwesomeIcons.pray,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Jadwal Sholat',
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
                  builder: (context) => JadwalSholat(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => JadwalSholat(),
                );
              }
            },
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
                      FontAwesomeIcons.image,
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        'Background',
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
            onPressed: ()  async {
              var navigationResult = await Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => Background(),
                ),
              );
              if (navigationResult == true) {
                MaterialPageRoute(
                  builder: (context) => Background(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
