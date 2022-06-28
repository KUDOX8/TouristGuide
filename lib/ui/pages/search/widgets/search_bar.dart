import 'package:flutter/material.dart';
import 'package:tourist_guide/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: lightGrey,
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 30,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.0), borderSide: BorderSide.none),
        labelText: 'Place',
        hintText: 'Explore Destinition',
      ),
    );
  }
}
