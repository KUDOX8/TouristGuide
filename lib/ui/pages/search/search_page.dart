import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/shared/widgets/place_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  late List<PlaceModel> placesList;

  CustomSearchDelegate(this.placesList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              close(context, null);
            },
            icon: const Icon(Icons.arrow_back)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<PlaceCard> matchQuery = [];
    for (PlaceModel place in placesList) {
      if (place.placeName.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(PlaceCard(place));
      }
    }

    return GridView.count(
      childAspectRatio: 0.7 / 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      children: matchQuery,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<PlaceCard> matchQuery = [];
    for (PlaceModel place in placesList) {
      if (place.placeName.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(PlaceCard(place));
      }
    }
    return GridView.count(
      childAspectRatio: 0.7 / 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      children: matchQuery,
    );
  }
}
