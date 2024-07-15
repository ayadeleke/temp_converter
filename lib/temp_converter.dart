// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double temp1 = 0.0;
  String unit1 = 'Celsius', unit2 = 'Fahrenheit';
  var temp1Controller = TextEditingController();
  var temp2Controller = TextEditingController();
  List<String> units = ['Celsius', 'Fahrenheit'];
  List<String> history = []; // List to store conversion history

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    temp1Controller.dispose();
    temp2Controller.dispose();
    super.dispose();
  }

/* Temperature converter */
  void convertTemperatures() {
    if (temp1Controller.text.isNotEmpty) {
      double input = double.parse(temp1Controller.text);
      double result;
      if (unit1 == 'Celsius' && unit2 == 'Fahrenheit') {
        result = input * 9 / 5 + 32;
      } else if (unit1 == 'Fahrenheit' && unit2 == 'Celsius') {
        result = (input - 32) * 5 / 9;
      } else if (unit1 == unit2) {
        result = input;
      } else {
        showErrorDialog('Invalid units');
        return;
      }
      temp2Controller.text = result.toStringAsFixed(2);

      // Add to history
      String conversionEntry =
          "${temp1Controller.text}°$unit1 = ${result.toStringAsFixed(2)}°$unit2";
      setState(() {
        history.add(conversionEntry);
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Conversion Result'),
            content: Text(conversionEntry),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showErrorDialog('Please enter a valid value');
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showHistoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conversion History'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: history.reversed.map((entry) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry,
                    style: TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  history.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Clear History'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                    value: unit1,
                    items: units.map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        unit1 = value!;
                        temp1Controller.clear();
                        temp2Controller.clear(); // Clear previous results
                      });
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: temp1Controller,
                    decoration: InputDecoration(
                        suffix: Text(unit1 == 'Celsius' ? '°C' : '°F')),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                    value: unit2,
                    items: units.map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        unit2 = value!;
                        temp1Controller.clear();
                        temp2Controller.clear(); // Clear previous results
                      });
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: temp2Controller,
                    decoration: InputDecoration(
                        suffix: Text(unit2 == 'Celsius' ? '°C' : '°F')),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: convertTemperatures,
              child: Text('Convert'),
            ),
            SizedBox(width: 10),
            Tooltip(
              message: 'History',
              child: IconButton(
                icon: Icon(Icons.history),
                onPressed: showHistoryDialog,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
