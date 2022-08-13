import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tourist_guide/l10n/localization.dart';
import 'package:tourist_guide/utils/constants.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PopupMenuEntry> _menuEntry = [
      PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            leading: Icon(
              Icons.favorite_border,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              context.loc.favorite,
              style: menuItemTextStyle,
            ),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, favoritePage);
            },
          )),
      PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            leading: Icon(
              Icons.add_business_outlined,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              context.loc.newEvent,
              style: menuItemTextStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, contactIformationPage);
            },
          )),
      PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              context.loc.settings,
              style: menuItemTextStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsPage);
            },
          )),
      PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 25,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                context.loc.exit,
                style: menuItemTextStyle,
              ),
              onTap: () {
                Navigator.pop(context);
                exit(0);
              }))
    ];
    return PopupMenuButton(
      itemBuilder: (context) => _menuEntry,
      onSelected: (val) {},
    );
  }
}
