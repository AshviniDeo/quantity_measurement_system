import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/widgets/gradient.dart';
import 'package:quantity_measurement_system/widgets/my_drop_down_button.dart';
import 'package:quantity_measurement_system/widgets/my_list.dart';
import 'package:quantity_measurement_system/widgets/my_text_field.dart';
import 'package:quantity_measurement_system/widgets/textfile.dart';
import 'package:quantity_measurement_system/services/temperature_convert.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  List<String> items = ["Fahrenite", "Celcius", "Kelvin"];
  String value = "Celcius";
  String selectValue = "Celcius";
  final _digitController = TextEditingController();

  Map data = {"Fahrenite": "0", "Celcius": "0", "Kelvin": "0"};
  Map symbol = {"Fahrenite": "F", "Celcius": "C", "Kelvin": "K"};

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
    TemperatureConverter instance = TemperatureConverter();
    double number = double.parse(_digitController.text);
    Map result = await instance.getValues(number, value);
    setState(() {
      data = {
        "Fahrenite": result["Fahrenite"].toString(),
        "Celcius": result["Celcius"].toString(),
        "Kelvin": result["Kelvin"].toString(),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SECONDARY,
        centerTitle: true,
        title: MyTitle(text: "Temperature Converter"),
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
