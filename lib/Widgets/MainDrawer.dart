import 'package:flutter/material.dart';
import 'package:restrant_app/Screens/FillterScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String title, tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          color: Theme.of(context).accentColor,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor),
          ),
        ),
        buildListTile(Icons.restaurant, 'Meal', () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile(Icons.settings, 'Filter', () {
          Navigator.of(context).pushReplacementNamed(FillterScreen.routeName);
        })
      ]),
    );
  }
}
