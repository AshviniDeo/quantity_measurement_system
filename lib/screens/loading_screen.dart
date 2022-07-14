import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quantity_measurement_system/utility/theme.dart';
import 'package:quantity_measurement_system/widgets/gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyGradient(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitFoldingCube(
              color: Colors.purple,
              size: 80,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Quantity Measurement",
              style: TextStyle(
                  fontFamily: FONT,
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          navigateToHome();
        }),
        backgroundColor: Colors.purple,
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
