import 'package:flutter/material.dart';

import '../../../constants.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Container(
          width: 40,
          height: 40,
          color: white,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            size: 25,
            color: red,
          ),
        ),
      ),
    );
  }
}
