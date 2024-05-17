import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _makePhoto = true;
  bool get makePhoto => _makePhoto;
  set makePhoto(bool _value) {
    _makePhoto = _value;
  }

  String _fileBase64 = '';
  String get fileBase64 => _fileBase64;
  set fileBase64(String _value) {
    _fileBase64 = _value;
  }
}
