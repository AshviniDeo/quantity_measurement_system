import 'package:flutter/material.dart';
import 'package:quantity_measurement_system/utility/theme.dart';

class MyList extends StatelessWidget {
  const MyList({
    required this.items,
    required this.symbol,
    required this.data,
  });

  final List<String> items;
  final Map symbol;
  final Map data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Center(
          child: Card(
            color: const Color.fromARGB(0, 0, 0, 0),
            child: ListTile(
              title: Text(symbol[items.elementAt(index)],
                  style: TextStyle(fontFamily: FONT, fontSize: 22)),
              leading: Text(
                data[items.elementAt(index)],
                style: TextStyle(fontFamily: FONT, fontSize: 22),
              ),
            ),
          ),
        );
      },
    );
  }
}
