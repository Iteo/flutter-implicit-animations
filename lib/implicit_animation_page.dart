import 'package:flutter/material.dart';
import 'package:implicit_animations/animated_color_text.dart';

class ImplicitAnimationPage extends StatefulWidget {
  @override
  _ImplicitAnimationPageState createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  bool colorizeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Colors.grey,
                child: Text("Change state", style: TextStyle(fontSize: 32),),
                onPressed: () {
                  setState(() {
                    colorizeButton = !colorizeButton;
                  });
                },
              ),
              SizedBox(height: 20,),
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
