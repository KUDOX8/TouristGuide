import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
      width: 170,
      height: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: const DecorationImage(
            image: AssetImage("assets/Alqara.jpg"),
            fit: BoxFit.cover,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(77, 86, 82, 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              "Al-Qara hill",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              width: 45,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: const Color.fromRGBO(77, 86, 82, 1.0)),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/star.svg"),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text("5", style: TextStyle(color: Colors.white)),
                ],
              ))
        ],
      ),
    );
  }
}