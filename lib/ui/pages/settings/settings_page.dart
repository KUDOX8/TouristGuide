import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/notifiers/favorite_places_notifiers.dart';
import 'package:tourist_guide/core/notifiers/preferences_notifier.dart';
import 'package:tourist_guide/core/notifiers/theme_notifier.dart';
import 'package:tourist_guide/l10n/localization.dart';
import 'package:tourist_guide/utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool isEnglish =
        PreferencesNotifier().prefInstance!.getString('languageCode')! == 'en';
    bool lightSelect = PreferencesNotifier().prefInstance!.getBool('isLight')!;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    final FavoritePlacesNotifier favNotifier =
        Provider.of<FavoritePlacesNotifier>(context);

    double iconsSize = 30;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          context.loc.settings,
          style:
              TextStyle(color: Theme.of(context).appBarTheme.backgroundColor),
        ),
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpansionTile(
                    title: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.dark_mode,
                            color: purple,
                            size: iconsSize,
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: lightPurple),
                          padding: const EdgeInsets.all(5.0),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(context.loc.appearance),
                      ],
                    ),
                    children: [
                      ListTile(
                        title: Text(context.loc.dark),
                        selected: !lightSelect,
                        onTap: () {
                          PreferencesNotifier()
                              .prefInstance!
                              .setBool('isLight', false);
                          themeNotifier.toggleTheme(PreferencesNotifier()
                              .prefInstance!
                              .getBool('isLight')!);
                        },
                      ),
                      ListTile(
                        title: Text(context.loc.light),
                        selected: lightSelect,
                        onTap: () {
                          PreferencesNotifier()
                              .prefInstance!
                              .setBool('isLight', true);
                          themeNotifier.toggleTheme(PreferencesNotifier()
                              .prefInstance!
                              .getBool('isLight')!);
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.language,
                            color: orange,
                            size: iconsSize,
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: lightOrange),
                          padding: const EdgeInsets.all(5.0),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(context.loc.language),
                      ],
                    ),
                    children: [
                      ListTile(
                        title: const Text("العربية"),
                        selected: !isEnglish,
                        onTap: () {
                          PreferencesNotifier().langeuageCode = 'ar';
                          setState(() {
                            isEnglish = !isEnglish;
                          });
                        },
                      ),
                      ListTile(
                        title: const Text("English"),
                        selected: isEnglish,
                        onTap: () {
                          PreferencesNotifier().langeuageCode = 'en';
                          setState(() {
                            isEnglish = !isEnglish;
                          });
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.info,
                            color: cyan,
                            size: iconsSize,
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: lightCyan),
                          padding: const EdgeInsets.all(5.0),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(context.loc.about),
                      ],
                    ),
                    children: const [
                      ListTile(title: Text("Blah ")),
                    ],
                  ),
                  ExpansionTile(
                    title: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.feedback,
                            color: pink,
                            size: iconsSize,
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: lightPink),
                          padding: const EdgeInsets.all(5.0),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(context.loc.feedback),
                      ],
                    ),
                    children: [
                      ListTile(title: Text(context.loc.contactViaEmail)),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          //Todo: Go to form page
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.business),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(context.loc.signYourBusinessWithUs),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        favNotifier.placesID = [];
                      },
                      child: Text(
                        context.loc.clearYourFavorites,
                        style: const TextStyle(color: red),
                      )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    children: [
                      Text(
                        context.loc.madeBy,
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/AlAhsa_logo.png",
                            width: width / 4,
                            height: height / 4,
                          ),
                          Text(
                            "${context.loc.version} 1.0.0 v ",
                            style: const TextStyle(color: grey),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
