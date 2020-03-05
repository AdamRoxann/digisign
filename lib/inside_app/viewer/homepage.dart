import 'dart:convert';

import 'package:digisign/auth/scanning_page.dart';
import 'package:digisign/model/modelViewer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewer extends StatefulWidget {
  final String code;
  HomePageViewer(this.code);
  @override
  _HomePageViewerState createState() => _HomePageViewerState();
}

class _HomePageViewerState extends State<HomePageViewer> {
  ScanStatus _scanStatus = ScanStatus.notSignIn;

  //  getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     value = preferences.getString("value");
  //   });
  // }

  var loading = false;
  final list = new List<Viewer>();
  Future<void> getData() async {
    list.clear();
    setState(() {
      loading = true;
    });
    final response = await http.post(
        'http://numpang.dipena.com/api/daftar_khotib/show',
        body: {"user_app": widget.code});
    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = new Viewer(
            api['id'], api['nama_khotib'], api['tanggal'], api['user_id']);
        list.add(ab);
      });
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //Wrap out body with a `WillPopScope` widget that handles when a user is cosing current route
      onWillPop: () async {
        Future.value(
            false); //return a `Future` with false value so this route cant be popped or closed.
      },
      child: Scaffold(
        body: loading
            ? Center(child: CircularProgressIndicator())
            : list.isEmpty
                ? Center(child: Text("Data tidak cocok, ${widget.code}"))
                : Column(
                    children: <Widget>[
                      Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, i) {
                                final x = list[i];
                                return Column(
                                  children: <Widget>[
                                    Text(x.nama_khotib),
                                    Text(x.tanggal),
                                  ],
                                );
                              })),
                      FlatButton(
                        child: Text("LOG OUT"),
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          setState(() {
                            preferences.setInt('value', null);
                            preferences.commit();
                            _scanStatus = ScanStatus.notSignIn;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext ctx) =>
                                      ScanningPage()));
                        },
                      )
                    ],
                  ),
      ),
    );
  }
}
