import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/place_notifier.dart';
import 'package:tourist_guide/core/notifiers/preferences_notifier.dart';
import 'package:tourist_guide/core/notifiers/theme_notifier.dart';
import 'package:tourist_guide/l10n/l10n.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tourist_guide/utils/initialization.dart';
import 'package:tourist_guide/utils/router.dart' as router;
import 'core/notifiers/preferences_notifier.dart';
import 'core/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DatabaseService().setPrefInstance();

  FlutterNativeSplash.remove();

  runApp(const ProviderScope(child: MyApp()));
}

final themeNotifier =
    ChangeNotifierProvider<ThemeNotifier>((ref) => ThemeNotifier());
final prefNotifier =
    ChangeNotifierProvider<PreferencesNotifier>((ref) => PreferencesNotifier());
final favoriteNotifier = ChangeNotifierProvider<FavoritePlacesNotifier>(
    (ref) => FavoritePlacesNotifier());
final placeNotifier =
    ChangeNotifierProvider<PlaceNotifier>(((ref) => PlaceNotifier()));

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // final _initialize = Initialization.initialize();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeNotifier);
    final pref = ref.watch(prefNotifier);

    return FutureBuilder(
      future: Initialization.initialize(ref),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          return MaterialApp(
            supportedLocales: L10n.all,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: Locale(pref.prefInstance!.getString('languageCode')!),
            themeMode: theme.themeMode,
            theme: MyTheme.lighTheme,
            darkTheme: MyTheme.darkTheme,
            onGenerateRoute: router.geneateRoute,
            initialRoute: homePage,
          );
        } else {
          return MaterialApp();
        }
      },
    );
  }
}
