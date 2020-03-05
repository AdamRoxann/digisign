import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  String _selected;
  String _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          backgroundColor: Color.fromRGBO(5, 213, 152, 1),
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Countdown',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 55,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Countdown adzan:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    right: 70,
                    left: 70,
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
                      value: _time,
                      underline: SizedBox(),
                      items: [
                        '10 Detik',
                        '30 Detik',
                        '60 Detik',
                      ].map((choice) {
                        return DropdownMenuItem(
                          child: Text(choice),
                          value: choice,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _time = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Countdown iqomah:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    right: 70,
                    left: 70,
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
                      value: _selected,
                      underline: SizedBox(),
                      items: [
                        '5 Menit',
                        '10 Menit',
                        '15 Menit',
                      ].map((choice) {
                        return DropdownMenuItem(
                          child: Text(choice),
                          value: choice,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selected = value;
                        });
                      },
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
