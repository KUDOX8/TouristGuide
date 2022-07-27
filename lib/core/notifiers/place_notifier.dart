import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';

class PlaceNotifier extends ChangeNotifier {
  static final PlaceNotifier _placeNotifier = PlaceNotifier._internal();

  factory PlaceNotifier() => _placeNotifier;

  PlaceNotifier._internal() {}
  List<PlaceModel> _placeList = [];

  UnmodifiableListView<PlaceModel> get placeList =>
      UnmodifiableListView(_placeList);

  set placeList(List<PlaceModel> placesList) {
    _placeList = placesList;

    notifyListeners();
  }
}
