import 'package:flutter/material.dart';
import 'package:implicit_animations/animated_color_text.dart';

class ExplicitAnimatedPage extends StatefulWidget {
  @override
  _ExplicitAnimatedPageState createState() => _ExplicitAnimatedPageState();
}

class _ExplicitAnimatedPageState extends State<ExplicitAnimatedPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _colorize = false;
  Animation _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    Animation curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _anim = ColorTween(
      begin: Colors.black,
      end: Colors.red,
    ).animate(curve);

    _controller.forward();
  }

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
                  if (_anim.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedBuilder(
                animation: _anim,
                builder: (context, child) => Text(
                      "Text",
                      style: TextStyle(
                        color: _anim.value,
                        fontSize: 32,
                      ),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
