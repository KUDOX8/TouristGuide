import 'package:flutter/material.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:tourist_guide/ui/pages/search/search_page.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(
            context: context,
            delegate: CustomSearchDelegate(PlaceNotifier().placeList));
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
          labelText: 'Place',
          hintText: 'Explore Destinition',
        ),
      ),
    );
  }
}
