import 'package:flutter/material.dart';
import 'package:implicit_animations/animated_color_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool colorizeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                child: Text("Change state"),
                onPressed: () {
                  setState(() {
                    colorizeButton = !colorizeButton;
                  });
                },
              ),
              AnimatedColorText(
                text: "Text",
                textColor: colorizeButton ? Colors.red : Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
