import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/notifiers/cafe_notifier.dart';
import 'package:tourist_guide/core/notifiers/restaurant_notifier.dart';
import 'package:tourist_guide/core/notifiers/shop_notifier.dart';
import 'package:tourist_guide/ui/pages/home/home_page.dart';
import 'package:tourist_guide/ui/pages/place_details/place_details_page.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:tourist_guide/utils/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CafeNotifier()),
        ChangeNotifierProvider.value(value: RestaurantNotifier()),
        ChangeNotifierProvider.value(value: ShopNotifier()),
      ],
      child: const MaterialApp(
        onGenerateRoute: router.geneateRoute,
        initialRoute: homePage,
      ),
    );
  }
}
