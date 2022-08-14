import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/ui/pages/new_location/widgets/navigator_button.dart';

import '../../../core/notifiers/theme_notifier.dart';
import '../../../utils/constants.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
          color: themeNotifier.isDarkMode ? darkBackgroundColor : white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: const [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
                Text(
                  'Thank You!',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(''),
              ]),
              NavigatorButton(
                  title: 'Home Page',
                  onTap: () =>
                      Navigator.popUntil(context, (route) => route.isFirst))
            ],
          )),
    );
  }
}
