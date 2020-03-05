import 'package:flutter/material.dart';

class BackgroundMedia extends StatefulWidget {
  @override
  _BackgroundMediaState createState() => _BackgroundMediaState();
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

class _BackgroundMediaState extends State<BackgroundMedia> {
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

  bool check = false;
  final formKey = GlobalKey<FormState>();
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
            'Background Media',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(  
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                width: 105,
                height: 100,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Waktu',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Checkbox(
                          value: check,
                          activeColor: Color.fromRGBO(15, 213, 152, 1),
                          onChanged: (a) {
                            setState(() {
                              check = a;
                            });
                          },
                        ),
                      ],
                    ),
                    DropdownButton(
                      isExpanded: true,
                      value: _selectedTime,
                      items: _dropdownMenuItems,
                      onChanged: onChangedDropdownMenuItem,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'URL',
                  labelText: 'Link Video',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
