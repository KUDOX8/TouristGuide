import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/l10n/localization.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:tourist_guide/ui/pages/place_details/widgets/navigator_button.dart';
import 'package:tourist_guide/ui/shared/widgets/favorite_button.dart';

class PlaceDetailsPage extends StatefulWidget {
  final DetailedPlaceModel detailedPlaceModel;

  const PlaceDetailsPage({Key? key, required this.detailedPlaceModel})
      : super(key: key);

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: _screenSize.height * 0.39,
                        width: _screenSize.width,
                      ),
                      Container(
                        height: _screenSize.height * 0.35,
                        width: _screenSize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/cool-agility-341013.appspot.com/o/images%2F${widget.detailedPlaceModel.placeName.replaceAll(" ", "%20")}%2F${widget.detailedPlaceModel.imageURL}')
                                .image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: _screenSize.height * 0.50 / 10,
                        left: 25,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: white),
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: grey,
                                  size: 16,
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                          top: _screenSize.height * 0.36,
                          right: _screenSize.width * 0.05,
                          child: FavoriteButton(
                            placeID: widget.detailedPlaceModel.placeID,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.detailedPlaceModel.placeName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.detailedPlaceModel.numberOfStars.toString(),
                        style: const TextStyle(color: grey, fontSize: 10),
                      ),
                      SvgPicture.asset("assets/icons/star.svg", width: 15),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '(${widget.detailedPlaceModel.numberOfReviews} Reviews)',
                        style: const TextStyle(color: grey, fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: _screenSize.height * 0.20,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.detailedPlaceModel.description,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Hours:'),
                      Text(
                        ' OPEN',
                        style: openPlaceStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.loc.price,
                            style: const TextStyle(fontSize: 10),
                          ),
                          Text(
                            '${widget.detailedPlaceModel.price} ${context.loc.sar}',
                            style: const TextStyle(
                                color: priceColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      NavigationButton(
                        url: widget.detailedPlaceModel.url,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
