import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
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
            'Donasi',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Total Sumbangan',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp. 12.045.678',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Tanggal',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Nominal',
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
                            '10/01/2020',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            'Rp. 250.000',
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
                            '23/02/2020',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                         DataCell(
                          Text(
                            'Rp. 500.000',
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
                            '3',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                         DataCell(
                          Text(
                            '23/03/2020',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                         DataCell(
                          Text(
                            'Rp. 750.000',
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
          ],
        ),
      ),
    );
  }
}
