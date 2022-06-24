import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_guide/core/models/place_model.dart';

class PlaceCard extends StatefulWidget {
  final PlaceModel placeModel;
  const PlaceCard(this.placeModel, {Key? key}) : super(key: key);

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(widget.placeModel.imageURL),
            fit: BoxFit.cover,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(77, 86, 82, 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              widget.placeModel.placeName,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromRGBO(77, 86, 82, 1.0)),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/star.svg", width: 15),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.placeModel.numberOfStars.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  width: 29,
                  height: 29,
                  color: Colors.white,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        size: 15,
                        color: Colors.red,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
