import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class MyTitle extends StatelessWidget {
  String? text;
  MyTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontFamily: FONT,
          color: Colors.purple,
          fontSize: 30,
          letterSpacing: 2,
          fontWeight: FontWeight.bold),
    );
  }
}

class MyHeading extends StatelessWidget {
  String? text;
  MyHeading({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontFamily: FONT,
          color: Colors.purple,
          fontSize: 25,
          letterSpacing: 2),
    );
  }
}

class MyText extends StatelessWidget {
  String? text;
  MyText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontFamily: FONT,
          color: Colors.purple[300],
          fontSize: 22,
          letterSpacing: 2),
    );
  }
}
