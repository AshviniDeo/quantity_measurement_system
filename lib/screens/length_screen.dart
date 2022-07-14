import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quantity_measurement_system/services/length_convert.dart';
import 'package:quantity_measurement_system/utility/theme.dart';
import 'package:quantity_measurement_system/widgets/gradient.dart';
import 'package:quantity_measurement_system/widgets/my_drop_down_button.dart';
import 'package:quantity_measurement_system/widgets/my_list.dart';
import 'package:quantity_measurement_system/widgets/my_text_field.dart';
import 'package:quantity_measurement_system/widgets/textfile.dart';

class LengthScreen extends StatefulWidget {
  const LengthScreen({Key? key}) : super(key: key);

  @override
  State<LengthScreen> createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LengthScreen> {
  final _digitController = TextEditingController();
  List<String> items = [
    "KiloMeter",
    "Meter",
    "Centimeter",
    "Inch",
    "Yard",
    "Foot"
  ];
  String value = "Centimeter";
  String selectValue = "Centimeter";
  Map data = {
    "KiloMeter": "0",
    "Meter": "0",
    "Centimeter": "0",
    "Inch": "0",
    "Yard": "0",
    "Foot": "0"
  };

  Map symbol = {
    "KiloMeter": "km",
    "Meter": "m",
    "Centimeter": "cm",
    "Inch": "in",
    "Yard": "yd",
    "Foot": "ft"
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _digitController.addListener(() {
      convertValue();
    });
  }

  void convertValue() async {
    LengthConverter instance = LengthConverter();
    double number = double.parse(_digitController.text);
    Map result = await instance.getValues(number, value);
    setState(() {
      data = {
        "KiloMeter": result["Kilometer"].toString(),
        "Meter": result["Meter"].toString(),
        "Centimeter": result["Centimeter"].toString(),
        "Inch": result["Inch"].toString(),
        "Yard": result["Yard"].toString(),
        "Foot": result["Foot"].toString(),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SECONDARY,
        centerTitle: true,
        title: MyTitle(text: "Length Converter"),
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
