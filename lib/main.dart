import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/core/services/database_service.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:tourist_guide/utils/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  await DatabaseService().getPlaces(PlaceNotifier());
  FlutterNativeSplash.remove();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PlaceNotifier()),
        ChangeNotifierProvider.value(value: FavoritePlacesNotifier()),
      ],
      child: const MaterialApp(
        onGenerateRoute: router.geneateRoute,
        initialRoute: homePage,
      ),
    );
  }
}
