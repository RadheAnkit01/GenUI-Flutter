import 'package:flutter/material.dart';
import 'package:gen_ui/Data/json.dart';

class GenUiProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _generatedUiList = [defaultdata];
  List<Map<String, dynamic>> get generatedUiList => _generatedUiList;

  // Call this whenever your AI or system streams in new UI data
  void addNewUiComponent(Map<String, dynamic> newComponent) {
    _generatedUiList.add(newComponent);
    notifyListeners(); // Tells the ListView that the count increased
  }
}
