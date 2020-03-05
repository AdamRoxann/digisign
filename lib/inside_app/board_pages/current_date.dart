import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

class CurrentDate extends StatefulWidget {
  @override
  _CurrentDateState createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();

  String aw;
  // String result = aw.substring(0, aw.indexOf('.'));

  @override
  void initState() {
    _postsController = new StreamController();
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => addValue());
    loadPosts();
  }

  void addValue() {
    // if(list.insert == true){
    setState(() {
      // counter++;
      //  print("nambah");
      // list[i]
      _refresh.currentState.show();
      // _messages.clear();
    });
    // }
  }

  StreamController _postsController;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  // int count = 1;

  Future fetchPost() async {
    final response =
        await http.get('http://worldtimeapi.org/api/timezone/Asia/Jakarta');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController.add(res);
      return res;
    });
  }

  Future<Null> _handleRefresh() async {
    // count++;
    // print(count);
    fetchPost().then((res) async {
      _postsController.add(res);
      // showSnack();
      return null;
    });
  }
  // String _timeString;

  // void _getTime() {
  //   final DateTime now = DateTime.now();
  //   final String formattedDateTime = _formatDateTime(now);
  //   setState(() {
  //     _timeString = formattedDateTime;
  //   });
  // }

  // String _formatDateTime(DateTime dateTime) {
  //   return DateFormat('hh:mm:ss').format(dateTime);
  // }

  // MM/dd/yyyy

  // @override
  // void initState() {
  //   _timeString = _formatDateTime(DateTime.now());
  //   Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());// TODO: implement initState
  //   super.initState();
  // }
  Timer timer;
  int counter = 0;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // String result = aw.substring(0, aw.indexOf('.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          backgroundColor: Color.fromRGBO(15, 213, 152, 1),
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Current Date & Time',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        primary: true,
        padding: EdgeInsets.all(24),
        children: <Widget>[
          DateTimeForm(),
          // RefreshIndicator(
          //   onRefresh: _handleRefresh,
          //   key: _refresh,
          //   child: Container(),
          // ),
          StreamBuilder(
              stream: _postsController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // print('Has error: ${snapshot.hasError}');
                // print('Has data: ${snapshot.hasData}');
                // print('Snapshot Data ${snapshot.data}');

                if (snapshot.hasError) {
                  return Text(snapshot.error);
                }

                // setState(() {
                //   snapshot.data['datetime'] = aw;
                // });

                if (snapshot.hasData) {
                  return RefreshIndicator(
                    key: _refresh,
                    onRefresh: _handleRefresh,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        var post = snapshot.data[index];
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                  '${snapshot.data["datetime"].substring(11, snapshot.data["datetime"].indexOf('.'))}'),
                              // Text(aw),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Text('No Posts');
                }
              })
          // Column(
          //   children: <Widget>[
          //     Text(_timeString, style: new TextStyle(fontSize: 20.0)) ?? ''
          //   ],
          // ),
        ],
      ),
    );
  }
}

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
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

class _DateTimeFormState extends State<DateTimeForm> {
  String _timeString;
  String _dateString;

  void _getDate() {
    final DateTime now = DateTime.now();
    final String formattedDateDate = _formatDateDate(now);
    setState(() {
      _dateString = formattedDateDate;
    });
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  String _formatDateDate(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

  final TextEditingController controller = new TextEditingController();
  String result = '';
  List<City> _cities = City.getCities();
  List<DropdownMenuItem<City>> _dropdownMenuItems;
  City _selectedCity;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    _dateString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getDate());
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

  bool check = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Otomatis',
                style: TextStyle(
                  fontSize: 15,
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
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  check == true
                      ? Center(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Waktu"),
                              Text(_dateString,
                                      style: new TextStyle(fontSize: 20.0)) ??
                                  ''
                            ],
                          ),
                        )
                      : BasicDateField(),
                  SizedBox(
                    height: 24,
                  ),
                  check == true
                      ? Center(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Waktu"),
                              Text(_timeString,
                                      style: new TextStyle(fontSize: 20.0)) ??
                                  ''
                            ],
                          ),
                        )
                      : Clock24Example(),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Color.fromRGBO(15, 213, 152, 1),
                            fontSize: 20,
                            fontFamily: 'Georgia',
                          ),
                        ),
                        onPressed: () => formKey.currentState.save(),
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                color: Color.fromRGBO(15, 213, 152, 1),
                                fontSize: 20,
                                fontFamily: 'Georgia',
                              ),
                            ),
                            onPressed: () => formKey.currentState.reset(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Pilih Kota:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: DropdownButton(
                    value: _selectedCity,
                    items: _dropdownMenuItems,
                    onChanged: onChangedDropdownMenuItem,
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

class BasicDateField extends StatelessWidget {
  // final CurrentDate _timeString;

  // BasicDateField(this._

  final format = DateFormat('dd-MM-yyy');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Tanggal',
        ),
        // Text(
        //   // CurrentDate._timeString,
        // ),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100),
            );
          },
        ),
      ],
    );
  }
}

class Clock24Example extends StatefulWidget {
  @override
  _Clock24ExampleState createState() => _Clock24ExampleState();
}

class _Clock24ExampleState extends State<Clock24Example> {
  final format = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Waktu',
        ),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(
                currentValue ?? DateTime.now(),
              ),
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat: true,
                ),
                child: child,
              ),
            );
            return DateTimeField.convert(time);
          },
        ),
      ],
    );
  }
}
