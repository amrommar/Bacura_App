import 'package:flutter/material.dart';

class test_screen extends StatefulWidget {
  @override
  _test_screenState createState() => _test_screenState();
}

class _test_screenState extends State<test_screen> {
  // List of dropdown options
  final List<String> _options = [
    'فرد',
    'صندوق استثمار',
    'جهة حكومية',
    'منشأة ربحية',
    'منشأة غير ربحية',
    'بنك',
    'أخري',
  ];

  // Variable to store the selected option
  String _selectedOption = 'فرد'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Menu
            DropdownButtonFormField<String>(
              value: _selectedOption,
              decoration: InputDecoration(
                labelText: 'نوع المستثمر',
                border: OutlineInputBorder(),
              ),
              items: _options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
