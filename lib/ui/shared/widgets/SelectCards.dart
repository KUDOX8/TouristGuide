import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';



class SelectCard extends StatelessWidget{


   const SelectCard({Key? key, required this.text, required this.select, required this.onPressed}) : super(key: key);

  final String text;
  final bool select;
   final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 75,
        decoration:  BoxDecoration(color: lightGrey,borderRadius: BorderRadius.circular(10.0),),
        child:  Center(child: Text(text,style:  TextStyle(fontSize: 20, color: select? Colors.deepOrangeAccent:black)),),
      ),
    );
  }
}