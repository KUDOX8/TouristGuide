import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationButton extends StatelessWidget {
  final String url;

  const NavigationButton(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextButton(
          style: TextButton.styleFrom(
              fixedSize: const Size.fromWidth(200),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              backgroundColor: goButtonColor),
          onPressed: () async {
            final uri = Uri.parse(url);
            if (await launchUrl(uri)) {
              throw 'Could not launch $uri';
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Go Now!',
                style: TextStyle(color: white),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: white,
              )
            ],
          ),
        ));
  }
}
