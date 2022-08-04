import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesNotifier with ChangeNotifier {
  static final PreferencesNotifier _prefNotifier =
      PreferencesNotifier._internal();

  factory PreferencesNotifier() => _prefNotifier;

  PreferencesNotifier._internal();

  SharedPreferences? _prefInstance;

  SharedPreferences? get prefInstance => (_prefInstance);

  set prefInstance(SharedPreferences? preferences) {
    _prefInstance = preferences;
    notifyListeners();
  }

  set langeuageCode(String languageCode) {
    _prefInstance!.setString('languageCode', languageCode);
    notifyListeners();
  }
}
