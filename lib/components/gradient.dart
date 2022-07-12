import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class MyGradient extends StatelessWidget {
  final Widget? child;

  MyGradient({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colorList,
      )),
      child: child,
    );
  }
}

class MyBox extends StatelessWidget {
  final Widget? child;
  double? height;
  double? width;
  MyBox({required this.child, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(color: Colors.purpleAccent, offset: Offset(1, 1)),
          BoxShadow(color: Colors.white54, offset: Offset(-4, -4)),
          BoxShadow(color: Colors.white, offset: Offset(-1, -1)),
        ],
      ),
      child: child,
    );
  }
}
