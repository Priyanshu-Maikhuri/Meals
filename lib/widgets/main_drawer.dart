import 'package:flutter/material.dart';

import '../pages/filters_screen.dart';
import '../pages/about_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildTile(BuildContext context, icon, String text) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        onTap: () {
          if (text == 'Meals') {
            Navigator.of(context).pushReplacementNamed('/');
          } else if (text == 'Filters') {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          } else if (text == 'About us') {
            Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 130,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).hintColor,
              alignment: Alignment.centerLeft,
              child: const Text('Cooking Up!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.pink,
                  ))),
          const SizedBox(
            height: 20,
          ),
          buildTile(context, Icons.restaurant_menu, 'Meals'),
          buildTile(context, Icons.filter_alt, 'Filters'),
          // buildTile(context, Icons.settings, 'Settings'),
          const Spacer(),
          buildTile(context, Icons.info, 'About us')
        ],
      ),
    );
  }
}
