import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/pages/search/search_page.dart';

import '../../../../core/models/translation.dart';

class SearchBar extends StatelessWidget {
  final Languages language;

  const SearchBar(this.language, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(
            context: context,
            delegate: CustomSearchDelegate(
              placesList: [
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
              ],
              language: language,
            ));
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
            borderSide: BorderSide.none,
          ),
          labelText: translateEnglishToAnotherLanguage("Place", language),
          hintText: translateEnglishToAnotherLanguage(
              "Explore Destinition", language),
        ),
      ),
    );
  }
}
