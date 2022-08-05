import 'package:flutter/material.dart';
import 'package:tourist_guide/core/notifiers/preferences_notifier.dart';
import 'package:tourist_guide/utils/constants.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode themeMode = PreferencesNotifier().prefInstance!.getBool('isLight')!
      ? ThemeMode.light
      : ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isLight) {
    themeMode = isLight ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBackgroundColor,
    primaryColor: white,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(
      color: white,
    ),
    appBarTheme: const AppBarTheme(color: white),
    hintColor: white,
  );

  static final lighTheme = ThemeData(
      scaffoldBackgroundColor: white,
      primaryColor: lightGrey,
      colorScheme: const ColorScheme.light(),
      iconTheme: const IconThemeData(color: grey),
      appBarTheme: const AppBarTheme(color: black),
      hintColor: grey);
}
