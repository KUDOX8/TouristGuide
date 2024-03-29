class PlaceModel {
  final String placeID;
  final String placeName;
  final List<dynamic> placeType;
  final double numberOfStars;
  final String imageURL;

  PlaceModel({
    required this.placeName,
    required this.placeType,
    required this.placeID,
    required this.numberOfStars,
    required this.imageURL,
  });
}

class DetailedPlaceModel extends PlaceModel {
  final int numberOfReviews;
  final double price;
  final String description;
  final String url;
  final List<String> showImagesURL;

  DetailedPlaceModel.fromPlaceModel({
    required PlaceModel placeModel,
    required this.numberOfReviews,
    required this.price,
    required this.description,
    required this.url,
    required this.showImagesURL,
  }) : super(
            placeID: placeModel.placeID,
            placeName: placeModel.placeName,
            placeType: placeModel.placeType,
            numberOfStars: placeModel.numberOfStars,
            imageURL: placeModel.imageURL);

  DetailedPlaceModel({
    required this.numberOfReviews,
    required this.price,
    required this.description,
    required this.url,
    required this.showImagesURL,
    required String placeID,
    required String placeName,
    required List<String> placeType,
    required double numberOfStars,
    required String imageURL,
  }) : super(
            placeID: placeID,
            placeName: placeName,
            placeType: placeType,
            numberOfStars: numberOfStars,
            imageURL: imageURL);
}
