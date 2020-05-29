import 'package:flutter/material.dart';

class VideoTestModel with ChangeNotifier {
  String _url = "";

  int _count = 0;
  int get count => _count;
  String get url => _url;

  void updateUrl(String url) {
    _url = url;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void minus() {
    _count--;
    notifyListeners();
  }
}
