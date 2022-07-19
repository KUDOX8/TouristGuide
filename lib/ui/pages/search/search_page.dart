import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/shared/widgets/place_card.dart';
import 'package:tourist_guide/ui/shared/widgets/place_generator.dart';

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
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<PlaceModel> matchQuery = [];
    for (PlaceModel place in placesList) {
      if (place.placeName.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(place);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PlaceGenerator(placeList: matchQuery),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<PlaceModel> matchQuery = [];
    for (PlaceModel place in placesList) {
      if (place.placeName.toLowerCase().contains(query.toLowerCase().trim())) {
        matchQuery.add(place);
      }
    }

    return matchQuery.isEmpty
        ? const Center(
            child: Text('No place to display'),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceGenerator(placeList: matchQuery),
          );
  }
}
