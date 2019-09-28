import 'package:flutter/material.dart';

void main() => runApp(new MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculator();

}

class Calculator extends State<MyCalculator> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final controller_numA = TextEditingController();
  final controller_numB = TextEditingController();
  final form_key = GlobalKey<FormState>();

  String textToShow = "";

  void sum() {
    if (form_key.currentState.validate()) {
      int numA = int.parse(controller_numA.text);
      int numB = int.parse(controller_numB.text);
      int result = numA + numB;

      setState(() {
        textToShow = "$numA + $numB = $result";
      }
      );
    }
  }

  void subtrahend() {
    if (form_key.currentState.validate()) {
      int numA = int.parse(controller_numA.text);
      int numB = int.parse(controller_numB.text);
      int result = numA - numB;

      setState(() {
        textToShow = "$numA - $numB = $result";
      }
      );
    }
  }

  void factor() {
    if (form_key.currentState.validate()) {
      int numA = int.parse(controller_numA.text);
      int numB = int.parse(controller_numB.text);
      int result = numA * numB;

      setState(() {
        textToShow = "$numA * $numB = $result";
      }
      );
    }
  }

  void quotient() {
    if (form_key.currentState.validate()) {
      int numA = int.parse(controller_numA.text);
      print(numA);
      int numB = int.parse(controller_numB.text);
      double result = numA / numB;

      setState(() {
        textToShow = "$numA / $numB = $result";
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //Create Layout
    return new Scaffold(body: Form(
        key: form_key,
        child: Column(mainAxisAlignment:
        MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                controller: controller_numA,
                validator: (value) {
                  if (value.isEmpty) return "Please enter a number";
                },
                decoration: InputDecoration(hintText: "Please Enter number:"),
                keyboardType: TextInputType.number),
            TextFormField(
                controller: controller_numB,
                validator: (value) {
                  if (value.isEmpty) return "Please enter a number";
                },
                decoration: InputDecoration(hintText: "Please Enter number:"),
                keyboardType: TextInputType.number),
            Text(textToShow, style: TextStyle(fontSize: 20.0)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(onPressed: sum, child: Text('+'),),
              RaisedButton(onPressed: subtrahend, child: Text('-'),),
              RaisedButton(onPressed: factor, child: Text('*'),),
              RaisedButton(onPressed: quotient, child: Text('/'),),
            ],
            )
          ],
        )
    )
    );
  }
}
