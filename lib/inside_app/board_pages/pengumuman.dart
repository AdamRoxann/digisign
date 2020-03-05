import 'package:flutter/material.dart';

class Pengumuman extends StatefulWidget {
  @override
  _PengumumanState createState() => _PengumumanState();
}

class _PengumumanState extends State<Pengumuman> {
  TextEditingController _textFieldController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  _callAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _textFieldController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Isi Pengumuman',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
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
          backgroundColor: Color.fromRGBO(5, 213, 152, 1),
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Pengumuman',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          DataTable(
            columns: [
              DataColumn(
                label: Text(
                  'No.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Pengumuman',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      'pengumuman abcdefghi',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      'akndkjndfjdsnfs',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
