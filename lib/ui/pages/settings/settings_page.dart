import 'package:flutter/material.dart';
import 'package:tourist_guide/ui/shared/widgets/SelectCards.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
            child: Text(
          "Settings",
          style: TextStyle(color: black),
        )),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Appearance",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlutterSwitch(
                      width: 100.0,
                      height: 55.0,
                      toggleSize: 45.0,
                      value: status7,
                      borderRadius: 30.0,
                      padding: 2.0,
                      activeToggleColor: const Color(0xFF6E40C9),
                      inactiveToggleColor: const Color(0xFF2F363D),
                      activeSwitchBorder: Border.all(
                        color: const Color(0xFF3C1E70),
                        width: 6.0,
                      ),
                      inactiveSwitchBorder: Border.all(
                        color: const Color(0xFFD1D5DA),
                        width: 6.0,
                      ),
                      activeColor: const Color(0xFF271052),
                      inactiveColor: Colors.white,
                      activeIcon: const Icon(
                        Icons.nightlight_round,
                        color: Color(0xFFF8E3A1),
                      ),
                      inactiveIcon: const Icon(
                        Icons.wb_sunny,
                        color: Color(0xFFFFDF5D),
                      ),
                      onToggle: (val) {
                        print("t");
                        setState(() {
                          status7 = val;

                          if (val) {
                            _textColor = Colors.white;
                            _appBarColor = const Color.fromRGBO(22, 27, 34, 1);
                            _scaffoldBgcolor = const Color(0xFF0D1117);
                          } else {
                            _textColor = Colors.black;
                            _appBarColor = const Color.fromRGBO(36, 41, 46, 1);
                            _scaffoldBgcolor = Colors.white;
                          }
                        });
                      },
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children:  [
                //     SelectCard(text: "Light",select: lightSelect, onPressed: () {  },),
                //     SelectCard(text: "Dark",select: darkSelect, onPressed: () {  },),
                //   ],
                // ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Language",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SelectCard(
                      text: "Arabic",
                      select: !isEnglish,
                      onPressed: changeLanguage,
                    ),
                    SelectCard(
                      text: "English",
                      select: isEnglish,
                      onPressed: changeLanguage,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
