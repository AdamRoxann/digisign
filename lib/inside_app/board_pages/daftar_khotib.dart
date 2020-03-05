import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'khotib_list/khotib.dart';
import 'package:http/http.dart' as http;

class DaftarKhotib extends StatefulWidget {
  DaftarKhotib() : super();

  final String title = 'Daftar Khotib';
  @override
  _DaftarKhotibState createState() => _DaftarKhotibState();
}

class _DaftarKhotibState extends State<DaftarKhotib> {
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
      'nama_khotib': nama_khotib,
      'tanggal': tanggal,
      'user_app': '1',
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

  _callAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return 
         AlertDialog(
            content: 
            Column(
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
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  check();
                  Navigator.pop(context);
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 213, 152, 1),
                  ),
                ),
              ),
            ],

        );
      },
    );
  }

  List<Khotib> khotibs;
  List<Khotib> selectedKhotibs;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedKhotibs = [];
    khotibs = Khotib.getKhotibs();
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        khotibs.sort(
          (a, b) => a.firstName.compareTo(b.firstName),
        );
      } else {
        khotibs.sort(
          (a, b) => b.firstName.compareTo(a.firstName),
        );
      }
    }
  }

  onSelectedRow(bool selected, Khotib khotib) async {
    setState(() {
      if (selected) {
        selectedKhotibs.add(khotib);
      } else {
        selectedKhotibs.remove(khotib);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedKhotibs.isNotEmpty) {
        List<Khotib> temp = [];
        temp.addAll(selectedKhotibs);
        for (Khotib khotib in temp) {
          khotibs.remove(khotib);
          selectedKhotibs.remove(khotib);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text(
                'Nama Ustad',
              ),
              numeric: false,
              tooltip: 'Daftar Nama',
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColumn(columnIndex, ascending);
              }),
          DataColumn(
            label: Text(
              'Tanggal',
            ),
            numeric: false,
            tooltip: 'Tanggal',
          ),
        ],
        rows: khotibs
            .map(
              (khotib) => DataRow(
                selected: selectedKhotibs.contains(khotib),
                onSelectChanged: (b) {
                  print(
                    'OnSelect',
                  );
                  onSelectedRow(b, khotib);
                },
                cells: [
                  DataCell(
                    Text(khotib.firstName),
                    onTap: () {
                      print(
                        'Selected ${khotib.firstName}',
                      );
                    },
                  ),
                  DataCell(
                    Text(khotib.tanggal),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(15, 213, 152, 1),
        splashColor: Colors.blue,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _callAlert();
        },
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          backgroundColor: Color.fromRGBO(15, 213, 152, 1),
          elevation: 2,
          centerTitle: true,
          title: Text(
            widget.title,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: OutlineButton(
                  child: Text(
                    'Selected ${selectedKhotibs.length}',
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: OutlineButton(
                  child: Text(
                    'Delete Selected',
                  ),
                  onPressed: selectedKhotibs.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
            ],
          ),
          Form(
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
        ],
      ),
    );
  }
}
