import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  const MyButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: buttonColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              "CONVERT",
              style: TextStyle(
                  color: Colors.white, fontFamily: FONT, fontSize: 28),
            ),
          ),
        ),
      ),
    );
  }
}
