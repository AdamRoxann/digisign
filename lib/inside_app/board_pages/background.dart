import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
   TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  final _key = new GlobalKey<FormState>();

  String nama_khotib, tanggal;
  String user_app = '1';

  submit() async {
    // await getPref();
    final response =
        await http.post("http://numpang.dipena.com/api/daftar_khotib", body: {
      "nama_khotib": nama_khotib,
      "tanggal": tanggal,
      "user_app": '1',
      // "post_cat_id" : post_cat_id,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      print(pesan);
      setState(() {
        _textFieldController.clear();
      });
    } else {
      print(pesan);
    }
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      submit();
    }
  }
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
          title: Text(
            'Background',
          ),
        ),
      ),
      body: Form(
            key: _key,
                      child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    onSaved: (e) => nama_khotib = e,
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      labelText: 'Nama Ustad',
                      hintText: 'Tulis disini...',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: TextFormField(
                      onSaved: (e) => tanggal = e,
                      // controller: _textFieldController,
                      decoration: InputDecoration(
                        labelText: 'Tanggal',
                        hintText: 'dd/mm/yy',
                      ),
                    ),
                  ),
                FlatButton(
                  onPressed: () {
                    check();
                    print(nama_khotib);
                    print(tanggal);
                    // Navigator.pop(context);
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Color.fromRGBO(15, 213, 152, 1),
                    ),
                  ),
                ),
                ],
              ),
          ),
    );
  }
}
