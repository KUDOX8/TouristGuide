import 'package:flutter/material.dart';
import 'package:tourist_guide/utils/constants.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  List<Map> type = [
    {'text': 'All', 'isSelected': true},
    {'text': 'Restaurant', 'isSelected': false},
    {'text': 'Cafe', 'isSelected': false},
    {'text': 'Historical', 'isSelected': false},
    {'text': 'Shops', 'isSelected': false},
  ];
  TextStyle notSelectedStyle = const TextStyle(color: grey);
  TextStyle selectedStyle = const TextStyle(color: black);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: type.length,
        itemBuilder: ((context, index) {
          Map typeData = type[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              color: typeData['isSelected'] ? catgSelect : transparent,
              child: TextButton(
                child: Text(typeData['text'],
                    style: typeData['isSelected']
                        ? selectedStyle
                        : notSelectedStyle),
                onPressed: () {
                  setState(() {
                    for (var element in type) {
                      element['isSelected'] = false;
                    }
                    typeData['isSelected'] = true;
                  });
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
