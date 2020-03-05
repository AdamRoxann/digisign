// import 'package:digisign/inside_app/viewer/homepage.dart';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:digisign/inside_app/viewer/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
// import 'shared';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'login.dart';

class ScanningPage extends StatefulWidget {
  @override
  _ScanningPageState createState() => _ScanningPageState();
}

enum ScanStatus { notSignIn, signIn }

class _ScanningPageState extends State<ScanningPage> {
  ScanStatus _scanStatus = ScanStatus.notSignIn;
  String code = "";

  scanStatus() async {
    // await scan();
    final response =
        await http.post('http://numpang.dipena.com/api/event/shared_pref', body: {
      "code": code,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    if (value == 1) {
      setState(() {
        _scanStatus = ScanStatus.signIn;
        // savePref(value);
      });
      print(value);
      // loginToast(message);
    } else {
      print("fail");
      print(value);
      // loginToast(message);
    }
  }

  savePref(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.commit();
    });
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _scanStatus = value == 1 ? ScanStatus.signIn : ScanStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _scanStatus = ScanStatus.notSignIn;
    });
  }

  // Future scanBarcode() async {
  //   await FlutterBarcodeScanner.scanBarcode("#09922", "CANCEL", true).
  //   then((String kode){
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageViewer(kode)));
  //   });
  // }
  Future scan() async {
    try {
      String code = await BarcodeScanner.scan();
      setState(() => this.code = code);
      // Navigator.push(context,
          // MaterialPageRoute(builder: (context) => HomePageViewer(code)));
      // scanStatus();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.code = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.code = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.code =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.code = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_scanStatus) {
      case ScanStatus.notSignIn:
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(15, 213, 152, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Digisign',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Monotype Corsiva',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: Text(
                          'Silahkan scan QR code di masjid \n'
                          'terdekat untuk bisa melihat konten',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
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
                                'Scan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Georgia',
                                ),
                              ),
                              onPressed: () async {
                                // scanBarcode();
                                await scan();
                                scanStatus();
                              },
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Admin?',
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
                              builder: (context) => Login(),
                            ),
                          );
                          if (navigationResult == true) {
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case ScanStatus.signIn:
        return HomePageViewer(code);
    }
  }
}
