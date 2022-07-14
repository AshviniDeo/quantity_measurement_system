import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/routes/nav_main.dart';
import 'package:quantity_measurement_system/screens/loading_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const MainHome(),
    },
  ));
}           
