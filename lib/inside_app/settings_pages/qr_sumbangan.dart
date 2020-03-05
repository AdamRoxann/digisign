import 'package:flutter/material.dart';

class QrSumbangan extends StatefulWidget {
  @override
  _QrSumbanganState createState() => _QrSumbanganState();
}

class Time {
  int id;
  String name;

  Time(
    this.id,
    this.name,
  );

  static List<Time> getTimes() {
    return <Time>[
      Time(
        1,
        '5 Detik',
        
      ),
      Time(
        2,
        '10 Detik',
      ),
      Time(
        3,
        '15 Detik',
      ),
      Time(
        4,
        '20 Detik',
      ),
    ];
  }
}

class _QrSumbanganState extends State<QrSumbangan> {
  String result = '';
  List<Time> _times = Time.getTimes();
  List<DropdownMenuItem<Time>> _dropdownMenuItems;
  Time _selectedTime;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_times);
    _selectedTime = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Time>> buildDropdownMenuItems(List times) {
    List<DropdownMenuItem<Time>> items = List();
    for (Time time in times) {
      items.add(
        DropdownMenuItem(
          value: time,
          child: Text(time.name),
        ),
      );
    }
    return items;
  }

  onChangedDropdownMenuItem(Time selectedTime) {
    setState(() {
      _selectedTime = selectedTime;
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
            'QR Sumbangan',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 75,
              ),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/QR_Code.png',
                    width: 250,
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Waktu:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: DropdownButton(
                            value: _selectedTime,
                            items: _dropdownMenuItems,
                            onChanged: onChangedDropdownMenuItem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
