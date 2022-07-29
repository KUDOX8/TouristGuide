import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/shared/widgets/place_card.dart';

class PlaceGenerator extends StatefulWidget {
  final List<PlaceModel> placeList;

  const PlaceGenerator({Key? key, required this.placeList}) : super(key: key);

  @override
  State<PlaceGenerator> createState() => _PlaceGeneratorState();
}

class _PlaceGeneratorState extends State<PlaceGenerator> {
  @override
  Widget build(BuildContext context) {
    List<PlaceCard> placeCardList = [];
    for (var place in widget.placeList) {
      placeCardList.add(PlaceCard(place));
    }
    return placeCardList.isEmpty
        ? const Center(
            child: Text('No place to display'),
          )
        : GridView.count(
            cacheExtent: 9999999999,
            childAspectRatio: 0.7 / 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: placeCardList,
          );
  }
}
