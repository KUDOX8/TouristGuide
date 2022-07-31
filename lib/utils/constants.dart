import 'package:flutter/material.dart';

//Colors
const Color red = Colors.red;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color white = Colors.white;
const Color transparent = Colors.transparent;

const Color selectedCategory = Color.fromARGB(185, 235, 238, 243);

const Color priceColor = Color.fromRGBO(0, 230, 118, 1);
Color? goButtonColor = Colors.blue[800];

const Color lightBlack = Color.fromRGBO(77, 86, 82, 1.0);
const Color lightGrey = Color.fromARGB(132, 234, 241, 241);
Color darkBackgroundColor = Colors.grey.shade900;

// Text Styles
TextStyle notSelectedStyle = const TextStyle(color: grey);
TextStyle selectedStyle = const TextStyle(color: black);
TextStyle menuItemTextStyle = const TextStyle(fontSize: 14);
TextStyle titleTextStyle = const TextStyle(color: black);
TextStyle openPlaceStyle = TextStyle(color: Color.fromARGB(255, 37, 223, 49));

// Icons
Icon exitIcon = const Icon(
  Icons.exit_to_app,
  size: 25,
);
Icon settingsIcon = const Icon(
  Icons.settings,
  size: 25,
);
Icon favoriteIcon = const Icon(
  Icons.favorite_border,
  size: 25,
);
//Routes
const String homePage = '/';
const String placeDetailsPage = '/placeDetailsPage';
const String favoritePage = '/favoritePage';
const String settingsPage = '/settingsPage';
