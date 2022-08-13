import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/ui/shared/widgets/favorite_button.dart';

class PlaceCard extends StatefulWidget {
  final PlaceModel placeModel;

  const PlaceCard(this.placeModel, {Key? key}) : super(key: key);

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, placeDetailsPage,
          arguments: widget.placeModel),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: CachedNetworkImageProvider(widget.placeModel.imageURL),
              fit: BoxFit.cover,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: lightBlack,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                widget.placeModel.placeName,
                textScaleFactor: 1.5,
                style: const TextStyle(color: white, fontSize: 10),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: lightBlack),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        width: 15,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.placeModel.numberOfStars.toString(),
                        textScaleFactor: 1.5,
                        style: const TextStyle(color: white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                FavoriteButton(placeID: widget.placeModel.placeID),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
