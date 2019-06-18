import 'package:flutter/material.dart';
import 'package:implicit_animations/animated_color_text.dart';

class ImplicitAnimationPageBasic extends StatefulWidget {
  @override
  _ImplicitAnimationPageBasicState createState() => _ImplicitAnimationPageBasicState();
}

class _ImplicitAnimationPageBasicState extends State<ImplicitAnimationPageBasic> {
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
                child: Text(
                  "Change state",
                  style: TextStyle(fontSize: 32),
                ),
                onPressed: () {
                  setState(() {
                    colorizeButton = !colorizeButton;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedContainer(
                width: 60,
                height: 60,
                color: colorizeButton ? Colors.red : Colors.black,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutBack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
