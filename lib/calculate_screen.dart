import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _calculateState();
}

class _calculateState extends State<Calculate> {
  String currentText = "0";
  String _currentText = "0";
  String _operator = "";
  double num1 = 0.0;
  double num2 = 0.0;

  calculate(String text) {
    if (text == "C") {
      _operator = "";
      _currentText = "0";
      num1 = 0.0;
      num2 = 0.0;
    } else if (text == "+" || text == "-" || text == "x" || text == "/") {
      num1 = double.parse(currentText);
      _operator = text;
      _currentText = "0";
    } else if (text == ".") {
      if (_currentText.contains(".")) {
        return;
      } else {
        _currentText = _currentText + text;
      }
    } else if (text == "del") {
      _currentText = _currentText.substring(0, (_currentText.length - 1));
      if (_currentText.length < 1) {
        _currentText = "0";
      }
    } else if (text == "=") {
      num2 = double.parse(currentText);
      if (_operator == "+") {
        _currentText = (num1 + num2).toString();
      }
      if (_operator == "-") {
        _currentText = (num1 - num2).toString();
      }
      if (_operator == "x") {
        _currentText = (num1 * num2).toString();
      }
      if (_operator == "/") {
        _currentText = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      _operator = "";
    } else {
      _currentText = _currentText + text;
    }
    setState(() {
      currentText = double.parse(_currentText).toStringAsFixed(2);
    });
  }

  Widget button_calc(String title, Color color, double textSize) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color),
          onPressed: () => calculate(title),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: textSize),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 54, 57, 77),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          currentText,
                          style: TextStyle(
                              color: Color.fromARGB(255, 204, 204, 204),
                              fontSize: 100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button_calc("C", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc("del", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc(
                    '%',
                    Color.fromARGB(255, 74, 78, 105),
                    50,
                  ),
                  button_calc(
                    '/',
                    Color.fromARGB(255, 240, 173, 78),
                    50,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button_calc("7", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc("8", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc(
                    '9',
                    Color.fromARGB(255, 74, 78, 105),
                    50,
                  ),
                  button_calc(
                    'x',
                    Color.fromARGB(255, 240, 173, 78),
                    50,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button_calc("4", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc("5", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc(
                    '6',
                    Color.fromARGB(255, 74, 78, 105),
                    50,
                  ),
                  button_calc(
                    '-',
                    Color.fromARGB(255, 240, 173, 78),
                    50,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button_calc("1", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc("2", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc(
                    '3',
                    Color.fromARGB(255, 74, 78, 105),
                    50,
                  ),
                  button_calc(
                    '+',
                    Color.fromARGB(255, 240, 173, 78),
                    50,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button_calc("0", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc(".", Color.fromARGB(255, 74, 78, 105), 50),
                  button_calc(
                    '=',
                    Color.fromARGB(255, 240, 173, 78),
                    50,
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
