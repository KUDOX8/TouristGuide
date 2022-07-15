import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextButton(
          style: TextButton.styleFrom(
              fixedSize: const Size.fromWidth(200),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              backgroundColor: Colors.blue[800]),
          onPressed: () {},
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
