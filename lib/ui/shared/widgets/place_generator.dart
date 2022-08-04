import 'package:flutter/material.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/l10n/localization.dart';
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
    Size _screenSize = MediaQuery.of(context).size;
    print(_screenSize.width);
    List<PlaceCard> placeCardList = [];
    for (var place in widget.placeList) {
      placeCardList.add(PlaceCard(place));
    }
    return placeCardList.isEmpty
        ? Center(
            child: Text(context.loc.noPlaceToDisplay),
          )
        : GridView.count(
            cacheExtent: 9999999999,
            childAspectRatio: 0.7 / 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            scrollDirection: Axis.vertical,
            crossAxisCount: _screenSize.width < 620
                ? 2
                : _screenSize.width < 800
                    ? 3
                    : 4,
            children: placeCardList,
          );
  }
}
