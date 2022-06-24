class PlaceModel {
  final int placeID;
  final String placeName;
  final String placeType;
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
  final String description;
  final List<String> showImagesURL;

  DetailedPlaceModel({
    required this.numberOfReviews,
    required this.description,
    required this.showImagesURL,
    required int placeID,
    required String placeName,
    required String placeType,
    required double numberOfStars,
    required String imageURL,
  }) : super(
            placeID: placeID,
            placeName: placeName,
            placeType: placeType,
            numberOfStars: numberOfStars,
            imageURL: imageURL);
}
