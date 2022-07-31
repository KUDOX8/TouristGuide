import 'package:flutter/material.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/l10n/localization.dart';
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
            delegate:
                CustomSearchDelegate(placesList: PlaceNotifier().placeList));
      },
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: lightGrey,
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          labelText: context.loc.place,
          labelStyle: TextStyle(color: Theme.of(context).hintColor),
          hintText: context.loc.exploreDestinition,
        ),
      ),
    );
  }
}
