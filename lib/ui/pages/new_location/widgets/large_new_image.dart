import 'dart:io';

import 'package:flutter/material.dart';

class LargeNewImage extends StatelessWidget {
  final String imagePath;
  const LargeNewImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return imagePath.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.file(
              File(imagePath),
              width: screenSize.width * 0.7,
              height: screenSize.height * 0.3,
              fit: BoxFit.fill,
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
              color: Colors.grey[300],
            ),
            height: 200,
            width: 300,
            child: const Center(child: Text('Please upload image')),
          );
  }
}
