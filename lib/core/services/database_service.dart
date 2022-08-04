import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_guide/core/models/place_model.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/core/notifiers/preferences_notifier.dart';

class DatabaseService {
  final FirebaseFirestore _storeInstance = FirebaseFirestore.instance;

  void addPlace(DetailedPlaceModel placeModel) {
    _storeInstance.collection('places').add({
      'placeName': placeModel.placeName,
      'placeType': placeModel.placeType,
      'numberOfStars': placeModel.numberOfStars,
      'numberOfReviews': placeModel.numberOfReviews,
      'description': placeModel.description,
      'imagePath': placeModel.imageURL,
    });
  }

  Future getPlaces(PlaceNotifier placeNotifier) async {
    QuerySnapshot placesSnapshot =
        await _storeInstance.collection('places').get();

    List<PlaceModel> _placeList = [];

    for (var place in placesSnapshot.docs) {
      PlaceModel placeModel = PlaceModel(
        placeName: place.get('placeName'),
        placeType: place.get('placeType'),
        placeID: place.id,
        imageURL: place.get('imagePath'),
        numberOfStars: double.parse(place.get('numberOfStars').toString()),
      );

      _placeList.add(placeModel);
    }

    PlaceNotifier().placeList = _placeList;
  }

  void getPlacesID(FavoritePlacesNotifier _favoriteNotifier) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (!pref.containsKey('favorite')) {
      pref.setStringList('favorite', []);
    }

    _favoriteNotifier.placesID = pref.getStringList('favorite')!;
  }

  void setPlacesID(List<String> placesID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setStringList('favorite', placesID);
  }

  void setPrefInstance() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    PreferencesNotifier().prefInstance = pref;

    if (!pref.containsKey('isLight')) {
      pref.setBool('isLight', true);
    }

    if (!pref.containsKey('languageCode')) {
      pref.setString('languageCode', 'en');
    }
  }
}
