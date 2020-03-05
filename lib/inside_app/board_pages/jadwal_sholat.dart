import 'package:flutter/material.dart';

class JadwalSholat extends StatefulWidget {
  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class City {
  int id;
  String name;

  City(
    this.id,
    this.name,
  );

  static List<City> getCities() {
    return <City>[
      City(
        1,
        'DKI Jakarta',
      ),
      City(
        2,
        'Bandung',
      ),
      City(
        3,
        'Gorontalo',
      ),
      City(
        4,
        'Ambon',
      ),
    ];
  }
}

class _JadwalSholatState extends State<JadwalSholat> {
  String result = '';
  List<City> _cities = City.getCities();
  List<DropdownMenuItem<City>> _dropdownMenuItems;
  City _selectedCity;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_cities);
    _selectedCity = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<City>> buildDropdownMenuItems(List cities) {
    List<DropdownMenuItem<City>> items = List();
    for (City city in cities) {
      items.add(
        DropdownMenuItem(
          value: city,
          child: Text(city.name),
        ),
      );
    }
    return items;
  }

  onChangedDropdownMenuItem(City selectedCity) {
    setState(() {
      _selectedCity = selectedCity;
    });
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
            'Jadwal Sholat',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 30,
              left: 30,
              top: 20,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                isExpanded: true,
                value: _selectedCity,
                items: _dropdownMenuItems,
                underline: SizedBox(),
                onChanged: onChangedDropdownMenuItem,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 25 ,
              right: 20,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'Jadwal',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Waktu',
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
                            'Subuh',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '05:15',
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
                            'Dzuhur',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '12:06',
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
                            'Ashar',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '15:30',
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
                            'Maghrib',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '18:20',
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
                            'Isya',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '19:31',
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
          ),
        ],
      ),
    );
  }
}
