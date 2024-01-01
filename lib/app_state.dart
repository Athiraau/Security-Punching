import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
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

  int _MacVeri = 0;
  int get MacVeri => _MacVeri;
  set MacVeri(int _value) {
    _MacVeri = _value;
  }

  String _lostFocusTextfieldValue = '';
  String get lostFocusTextfieldValue => _lostFocusTextfieldValue;
  set lostFocusTextfieldValue(String _value) {
    _lostFocusTextfieldValue = _value;
  }

  String _battery = '';
  String get battery => _battery;
  set battery(String _value) {
    _battery = _value;
  }

  String _macid = '';
  String get macid => _macid;
  set macid(String _value) {
    _macid = _value;
  }

  String _hostname = '';
  String get hostname => _hostname;
  set hostname(String _value) {
    _hostname = _value;
  }

  String _ipaddress = '';
  String get ipaddress => _ipaddress;
  set ipaddress(String _value) {
    _ipaddress = _value;
  }

  String _OSinstallDt = '';
  String get OSinstallDt => _OSinstallDt;
  set OSinstallDt(String _value) {
    _OSinstallDt = _value;
  }

  String _compress = '';
  String get compress => _compress;
  set compress(String _value) {
    _compress = _value;
  }

  String _textfield = '';
  String get textfield => _textfield;
  set textfield(String _value) {
    _textfield = _value;
  }

  String _SecurityName = '';
  String get SecurityName => _SecurityName;
  set SecurityName(String _value) {
    _SecurityName = _value;
  }

  String _SecType = '';
  String get SecType => _SecType;
  set SecType(String _value) {
    _SecType = _value;
  }

  String _LocalBase64Image = '';
  String get LocalBase64Image => _LocalBase64Image;
  set LocalBase64Image(String _value) {
    _LocalBase64Image = _value;
  }

  String _lostFocusValue = '';
  String get lostFocusValue => _lostFocusValue;
  set lostFocusValue(String _value) {
    _lostFocusValue = _value;
  }

  String _branch = '';
  String get branch => _branch;
  set branch(String _value) {
    _branch = _value;
  }

  String _brid = '';
  String get brid => _brid;
  set brid(String _value) {
    _brid = _value;
  }

  String _msg = '';
  String get msg => _msg;
  set msg(String _value) {
    _msg = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
