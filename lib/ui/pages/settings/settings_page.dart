import 'package:flutter/material.dart';
import 'package:tourist_guide/l10n/localization.dart';

import 'package:tourist_guide/ui/shared/widgets/SelectCards.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:tourist_guide/ui/shared/widgets/SelectCards.dart';
import 'package:tourist_guide/utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool status1 = false;
    bool status2 = true;
    bool status3 = false;
    bool status4 = false;
    bool status5 = false;
    bool status6 = false;
    bool status7 = false;
    bool status8 = false;
    bool isSwitchOn = false;

    Color _textColor = Colors.black;
    Color _appBarColor = const Color.fromRGBO(36, 41, 46, 1);
    Color _scaffoldBgcolor = Colors.white;

    bool isEnglish = true;

    bool darkSelect = false;
    bool lightSelect = true;

    void changeLanguage() {
      setState(() {
        isEnglish = !isEnglish;
      });
    }
    void changeAppearance() {
      setState(() {
        lightSelect = !lightSelect;
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          context.loc.settings,
          style: const TextStyle(color: black),
        )),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children:  [
          ExpansionTile(title: const Text("Appearance"),
            children: [
            ListTile(title: const Text("Dark"),selected:!lightSelect,onTap: () => changeAppearance,),
            ListTile(title: const Text("Light"),selected: lightSelect,onTap: ()=> changeAppearance,),
          ],
          ),
          ExpansionTile(title: const Text("Language"),
            children: [
            ListTile(title: const Text("العربية"),selected:!isEnglish,onTap: () => changeLanguage,),
            ListTile(title: const Text("Light"),selected: lightSelect,onTap: ()=> changeLanguage,),
          ],
          ),
        ],)
      ),
    );
  }


}
