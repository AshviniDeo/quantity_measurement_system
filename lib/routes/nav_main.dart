import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/screens/length_screen.dart';
import 'package:quantity_measurement_system/screens/temerature_screen.dart';
import 'package:quantity_measurement_system/screens/weight_screen.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List screens = [
    const WeightScreen(),
    const TemperatureScreen(),
    const LengthScreen(),
  ];
  int currentIndex = 0;

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          backgroundColor: PRIMERY,
          unselectedItemColor: Colors.purple,
          selectedIconTheme: const IconThemeData(
            size: 30,
            color: Colors.white,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.fitness_center,
                color: Colors.purple,
              ),
              label: "Weight",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.device_thermostat,
                  color: Colors.purple,
                ),
                label: "Temperature"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.design_services_outlined,
                  color: Colors.purple,
                ),
                label: "Length")
          ],
        ));
  }
}
