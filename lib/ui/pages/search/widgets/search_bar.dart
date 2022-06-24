import 'package:flutter/material.dart';
class SearchBar extends StatelessWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      decoration: InputDecoration(
      
        filled: true,
        fillColor: const Color.fromARGB(132, 234, 241, 241),
        prefixIcon: const Icon(Icons.search_rounded,size: 30,),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(14.0),borderSide: BorderSide.none),
          
        labelText: 'Place',
        hintText: 'Explore Destinition',           
      ),
    );
  }
}