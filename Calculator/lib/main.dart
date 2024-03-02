import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyCalculator(),
  debugShowCheckedModeBanner: false,
));

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {

  String output = "0";
  bool ok = false;

  String _output = "0";
  double t1 = 0.0;
  double t2 = 0.0;
  String opperand = "";

  double power(double x, int e) {
    if(e == 0) {
      return 1;
    }
    else if(e % 2 == 0) {
      return power(x * x, e ~/ 2);
    }
    else if(e % 2 == 1){
      return x * power(x * x, e ~/ 2);
    }
  }

  buttonPressed(String buttonText) {
    if(buttonText == "AC") {
      _output = "0";
      t1 = 0.0;
      t2 = 0.0;
      opperand = "";
      ok = false;
    } else if(buttonText == "DEL") {
      _output = _output.substring(0, _output.length - 1);
    } else if(buttonText == "+" || buttonText == '-' || buttonText == 'X' || buttonText == '/' || buttonText == '^') {
      t1 = double.parse(output);
      opperand = buttonText;
      _output = "0";
      ok = false;
    } else if(buttonText == ".") {
      if(_output.contains(".")) {
        print("Already contains decimal");
        return;
      }
      else {
        _output = _output + buttonText;
      }
    } else if(buttonText == '+-') {
      if(_output[0] == '-') {
        _output = _output.substring(1, _output.length);
      }
      else {
        _output = "-" + _output;
        ok = true;
      }
    } else if(buttonText == '=') {
      t2 = double.parse(output);
      if(opperand == "+") {
        _output = (t1 + t2).toString();
      }
      if(opperand == "-") {
        _output = (t1 - t2).toString();
      }
      if(opperand == "/") {
        try{
          _output = (t1 / t2).toString();
        }
        catch (e) {
          _output = "Error";
        }
      }
      if(opperand == "X") {
        _output = (t1 * t2).toString();
      }
      if(opperand == "^") {
        int _t2 = t2.toInt();
        if(_t2 != t2) {
          _output = "Error";
        }
        else {
          double res = power(t1, _t2);
          _output = res.toString();
        }
      }

      t1 = 0.0;
      t2 = 0.0;
      opperand = "";
      ok = false;
      print(_output.length);
      if(_output[_output.length - 1] == "0" && _output[_output.length - 2] == ".") {
        _output = _output.substring(0, _output.length - 2);
      }
    } else {
      if(ok == false) {
        _output = "";
      }
      _output = _output + buttonText;
      ok = true;
    }

    print(_output);
    setState(() {
      output = _output;
    });
  }

  Widget buildButton(buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          return buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("DEL"),
                    buildButton("AC"),
                  ]
                ),
                Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("X"),
                      buildButton("/"),
                    ]
                ),
                Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("+"),
                      buildButton("-"),
                    ]
                ),
                Row(
                    children: [
                      buildButton("0"),
                      buildButton("."),
                      buildButton("+-"),
                      buildButton("^"),
                      buildButton("="),
                    ]
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


