import 'package:flutter/material.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/utils/constants.dart';
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

            delegate: CustomSearchDelegate(PlaceNotifier().placeList,language: language));

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
