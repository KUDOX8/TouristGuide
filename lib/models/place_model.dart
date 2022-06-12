class PlaceModel {
  final String placeID;
  final String placeName;
  final String placeType;
  final int numberOfStars;
  final int numberOfReviews;

  final String imageURL;

  PlaceModel(
      {required this.placeName,
      required this.placeType,
      required this.placeID,
      required this.imageURL,
      required this.numberOfStars,
      required this.numberOfReviews});
}
