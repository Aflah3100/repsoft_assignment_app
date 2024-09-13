import 'package:flutter/material.dart';

class AuthScreenProvider with ChangeNotifier {
  bool _isLoading = false;

  void setLoadingStatus(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool getLadingStatus() => _isLoading;
}
