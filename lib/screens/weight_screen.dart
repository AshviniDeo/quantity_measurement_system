import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/components/gradient.dart';
import 'package:quantity_measurement_system/components/my_text_field.dart';
import 'package:quantity_measurement_system/components/textfile.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final _digitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SECONDARY,
        centerTitle: true,
        title: MyTitle(text: "Weight Converter"),
        elevation: 0,
      ),
      body: MyGradient(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeading(text: "FROM :"),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  MyField(controller: _digitController, height: 40, width: 180),
                  const SizedBox(
                    width: 15,
                  ),
                  MyBox(
                      height: 40,
                      width: 180,
                      child: Center(
                        child: MyText(
                          text: "Ashvini",
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  label: MyHeading(text: "Convert To"),
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    color: Colors.purple,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
