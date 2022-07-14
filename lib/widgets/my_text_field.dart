import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantity_measurement_system/utility/theme.dart';
import 'package:quantity_measurement_system/widgets/gradient.dart';

class MyField extends StatelessWidget {
  final TextEditingController controller;
  final double height;
  final double width;
  MyField(
      {required this.controller, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return MyBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Enter digit",
          hintStyle: TextStyle(
              fontFamily: FONT,
              fontSize: 20,
              color: const Color.fromRGBO(186, 104, 200, 1)),
          suffixIcon: const Icon(
            Icons.edit_outlined,
            color: Colors.purple,
          ),
          iconColor: Colors.purple,
          fillColor: Colors.white70,
          filled: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
        cursorColor: Colors.purple[300],
        cursorWidth: 2,
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontFamily: FONT, fontSize: 20, color: Colors.purple[400]),
      ),
    );
  }
}
