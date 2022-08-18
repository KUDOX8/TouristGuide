import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: Image.asset('assets/images/splash_background.png').image,
        fit: BoxFit.cover,
      )),
    );
  }
}
