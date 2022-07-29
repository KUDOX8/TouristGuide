import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/pages/search/search_page.dart';

import '../../../../core/models/Language.dart';

class SearchBar extends StatelessWidget {
  final int languageNumber;

  const SearchBar(this.languageNumber, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(
            context: context,
            delegate: CustomSearchDelegate([
              PlaceModel(
                placeID: '1',
                placeName: "Al-Qara Hill",
                placeType: [""],
                numberOfStars: 5,
                imageURL: "assets/images/Alqara.jpg",
              ),
              PlaceModel(
                placeID: '2',
                placeName: "Jawatha Park",
                placeType: [""],
                numberOfStars: 4.5,
                imageURL: "assets/images/Jawatha_Park.jpg",
              ),
            ]));
      },
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: lightGrey,
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 30,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide.none),
          labelText: Language.languages["Place"]![languageNumber],
          hintText: Language.languages["Explore Destinition"]![languageNumber],
        ),
      ),
    );
  }
}
