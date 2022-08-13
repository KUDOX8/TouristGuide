import 'package:flutter/material.dart';

class PopUpMessage extends StatelessWidget {
  static const id = '/pop_up_message';
  final String message;

  const PopUpMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(children: <Widget>[
        const Icon(Icons.error_outline_outlined),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ]),
    );
  }

  void toast() {}
}
