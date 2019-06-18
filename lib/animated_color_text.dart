import 'package:flutter/material.dart';

class AnimatedColorText extends ImplicitlyAnimatedWidget {
  final Color textColor;
  final String text;

  AnimatedColorText(
      {Key key,
      @required this.textColor,
      @required this.text,
      Duration duration = const Duration(seconds: 1),
      Curve curve = Curves.linear})
      : super(duration: duration, key: key, curve: curve);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedColorTextState();
  }
}

class _AnimatedColorTextState extends AnimatedWidgetBaseState<AnimatedColorText> {
  ColorTween _colorTween;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: _colorTween.evaluate(animation),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    _colorTween = visitor(
      _colorTween,
      widget.textColor,
      (dynamic value) => ColorTween(begin: value),
    );
  }
}
