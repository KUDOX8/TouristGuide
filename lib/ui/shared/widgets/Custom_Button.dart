import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: height*.02,),
        TextButton(
          onPressed: onPressed,
          child:  Text(text,
              style: TextStyle(color:color)),
        ),
      ],
    );
  }
}