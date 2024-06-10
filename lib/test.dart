import 'package:flutter/material.dart';

class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  // Example data
  List<Map<String, dynamic>> _data = [
    {"name": "John", "selectedOption": "Option 1"},
    {"name": "Doe", "selectedOption": "Option 2"},
    {"name": "Jane", "selectedOption": "Option 3"},
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Options')),
      ],
      rows: _data
          .map(
            (item) => DataRow(
              cells: [
                DataCell(Text(item['name'])),
                DataCell(
                  DropdownWidget(
                    options: ['Option 1', 'Option 2', 'Option 3'],
                    selectedOption: item['selectedOption'],
                    onChanged: (value) {
                      setState(() {
                        item['selectedOption'] = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class DropdownWidget extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final void Function(String?)? onChanged; // Adjusted signature

  DropdownWidget({
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedOption,
      onChanged: onChanged,
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
