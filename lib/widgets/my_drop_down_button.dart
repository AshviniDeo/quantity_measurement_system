import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quantity_measurement_system/widgets/gradient.dart';
import 'package:quantity_measurement_system/widgets/textfile.dart';

class MyDropDown extends StatelessWidget {
  double height;
  double width;
  List<String> items;
  String value;

  void Function(String?)? onChanged;

  MyDropDown({
    required this.onChanged,
    required this.width,
    required this.height,
    required this.items,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyBox(
          height: 50,
          width: 180,
          child: DropdownButton(
            isExpanded: true,
            alignment: AlignmentDirectional.center,
            onChanged: onChanged,
            isDense: true,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.purple,
            ),
            iconSize: 40,
            value: value,
            items: items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: MyText(text: item),
                ),
              );
            }).toList(),
          )),
    );
  }
}
