import 'package:flutter/material.dart';

class InputFieldProvider with ChangeNotifier {
  final Map<String, String> _values = {};

  // Getter for retrieving field values
  String getValue(String key) => _values[key] ?? '';

  // Setter for updating field values
  void updateValue(String key, String value) {
    _values[key] = value;
    notifyListeners(); // Notify the listeners to rebuild the UI
  }
}
