import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/notifiers/cafe_notifier.dart';
import 'package:tourist_guide/core/notifiers/restuarant_notifier.dart';
import 'package:tourist_guide/core/notifiers/shop_notifier.dart';
import 'package:tourist_guide/ui/pages/home/home.dart';
import 'package:tourist_guide/ui/pages/place_details/place_details.dart';

void main() {
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
        ChangeNotifierProvider.value(value: RestuarantNotifier()),
        ChangeNotifierProvider.value(value: ShopNotifier()),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
