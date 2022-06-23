import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/place_model.dart';

class PlaceCard extends StatelessWidget {
  final PlaceModel placeModel;
  const PlaceCard(this.placeModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
      width: 170,
      height: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(placeModel.imageURL),
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
              placeModel.placeName,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 45,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromRGBO(77, 86, 82, 1.0)),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/star.svg"),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  placeModel.numberOfStars.toString(),
                  /* 
                  We get A RenderFlex overflowed in the above line.
                  The error is caused when outputting a double value, I believe
                  that issue is caused because there is place for only for
                  2 character
                  try  3.toString(),
                  and (3.5).toString(),
                  and "3.",
                  to understand the bug.
                  */
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
