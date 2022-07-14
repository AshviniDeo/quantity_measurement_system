import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/components/gradient.dart';
import 'package:quantity_measurement_system/components/my_button.dart';
import 'package:quantity_measurement_system/components/my_drop_down_button.dart';
import 'package:quantity_measurement_system/components/my_list.dart';
import 'package:quantity_measurement_system/components/my_text_field.dart';
import 'package:quantity_measurement_system/components/textfile.dart';
import 'package:quantity_measurement_system/services/weight_convert.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final _digitController = TextEditingController();

  List<String> items = ["Gram", "Kilogram", "Pound", "Us ton", "Miligram"];
  String value = "Gram";
  String selectValue = "Gram";
  Map data = {
    "Gram": "0",
    "Kilogram": "0",
    "Pound": "0",
    "Us ton": "0",
    "Miligram": "0"
  };
  Map symbol = {
    "Gram": "g",
    "Kilogram": "kg",
    "Pound": "lb(pound)",
    "Us ton": "ton(Uk)",
    "Miligram": "mg"
  };
  void onChange(String? newValue) {
    setState(() {
      value = newValue!;
    });
    convertValue();
  }

  void onSelectChange(String? newValue) {
    setState(() {
      selectValue = newValue!;
    });
    convertValue();
  }

  void convertValue() async {
    WeightConverter instance = WeightConverter();
    double number = double.parse(_digitController.text);
    Map result = await instance.getValues(number, value);
    setState(() {
      data = {
        "Gram": result["Gram"].toString(),
        "Kilogram": result["Kilogram"].toString(),
        "Pound": result["Pound"].toString(),
        "Us ton": result["Us ton"].toString(),
        "Miligram": result["Miligram"].toString()
      };
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _digitController.addListener(() {
      convertValue();
    });
  }

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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeading(text: "FROM"),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  MyField(controller: _digitController, height: 50, width: 180),
                  const SizedBox(
                    width: 15,
                  ),
                  MyDropDown(
                      onChanged: onChange,
                      width: 180,
                      height: 40,
                      items: items,
                      value: value)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              MyHeading(text: "To"),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  MyBox(
                      height: 50,
                      width: 180,
                      child: Center(
                        child: MyText(
                          text: data[selectValue].toString() +
                              " " +
                              symbol[selectValue],
                        ),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  MyDropDown(
                      onChanged: onSelectChange,
                      width: 180,
                      height: 40,
                      items: items,
                      value: selectValue)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: MyList(
                data: data,
                items: items,
                symbol: symbol,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
