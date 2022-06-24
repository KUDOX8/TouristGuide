import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_guide/ui/pages/place_details/widgets/navigator_button.dart';
import 'package:tourist_guide/ui/shared/widgets/favorite_button.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: _screenSize.height * 0.35,
                  width: _screenSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Jawatha_Park.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey,
                            size: 16,
                          )),
                    ),
                  ),
                ),
                Positioned(
                    top: _screenSize.height * 0.33,
                    right: _screenSize.width * 0.05,
                    child: const FavoriteButton()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Jawatha Park',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  '4.5',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                SvgPicture.asset("assets/icons/star.svg", width: 15),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  '(325 Riviews)',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do'
              'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut'
              'enim ad minim veniam, quis nostrud exercitation ullamco laboris'
              'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor'
              'in reprehenderit in voluptate velit esse cillum dolore eu'
              'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non'
              'proident, sunt in culpa qui officia deserunt mollit anim id'
              'est laborum.',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text('Hours: open'),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      '10 SAR',
                      style: TextStyle(
                          color: Colors.greenAccent[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                NavigationButton(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
