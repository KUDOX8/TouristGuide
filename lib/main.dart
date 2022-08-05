import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/core/notifiers/preferences_notifier.dart';
import 'package:tourist_guide/core/notifiers/theme_notifier.dart';
import 'package:tourist_guide/core/services/database_service.dart';
import 'package:tourist_guide/l10n/l10n.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_guide/utils/router.dart' as router;
import 'core/notifiers/preferences_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DatabaseService().getPlaces(PlaceNotifier());
  await DatabaseService().setPrefInstance();
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
        ChangeNotifierProvider.value(
          value: ThemeNotifier(),
        ),
        ChangeNotifierProvider.value(value: PreferencesNotifier()),
      ],
      builder: (context, _) {
        final ThemeNotifier themeNotifier =
            Provider.of<ThemeNotifier>(context, listen: true);

        final prefNotifier =
            Provider.of<PreferencesNotifier>(context, listen: true);

        return MaterialApp(
          supportedLocales: L10n.all,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: Locale(prefNotifier.prefInstance!.getString('languageCode')!),
          themeMode: themeNotifier.themeMode,
          theme: MyTheme.lighTheme,
          darkTheme: MyTheme.darkTheme,
          onGenerateRoute: router.geneateRoute,
          initialRoute: homePage,
        );
      },
    );
  }
}
