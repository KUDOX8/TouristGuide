import 'package:flutter/material.dart';
import 'package:tourist_guide/l10n/localization.dart';
import 'package:tourist_guide/utils/constants.dart';

class CategoriesBar extends StatefulWidget {
  final Function editList;
  const CategoriesBar(this.editList, {Key? key}) : super(key: key);

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  List<Map<String, Object>> type = [
    {'text': 'All', 'isSelected': true},
    {'text': 'Restaurant', 'isSelected': false},
    {'text': 'Park', 'isSelected': false},
    {'text': 'Cafe', 'isSelected': false},
    {'text': 'Historical', 'isSelected': false},
    {'text': 'Shop', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      context.loc.all,
      context.loc.restaurant,
      context.loc.park,
      context.loc.cafe,
      context.loc.historical,
      context.loc.shop
    ];

    return SizedBox(
      height: 50,
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
              color: typeData['isSelected'] ? selectedCategory : transparent,
              child: TextButton(
                child: Text(names[index],
                    style: typeData['isSelected']
                        ? selectedStyle
                        : notSelectedStyle),
                onPressed: () {
                  setState(
                    () {
                      for (var element in type) {
                        element['isSelected'] = false;
                      }
                      typeData['isSelected'] = true;
                    },
                  );
                  widget.editList(
                    typeData['text'],
                    true,
                    typeData['isSelected'],
                  );
                },
                onLongPress: () {
                  if (typeData['text'] != "All") {
                    setState(
                      () {
                        type[0]['isSelected'] = false;
                        typeData['isSelected'] = !typeData['isSelected'];
                      },
                    );
                    widget.editList(
                      typeData['text'],
                      false,
                      typeData['isSelected'],
                    );
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
