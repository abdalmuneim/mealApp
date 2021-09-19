import 'package:flutter/material.dart';
import '../screens/filter_Screen.dart';
import '../dummy_data.dart';

class MainDrawer extends StatelessWidget {
  final List<String> meals = DUMMY_CATEGORIES.map((e) {
    return e.title;
  }).toList();

  @override
  Widget build(BuildContext context) {
    Widget listTile(String title, Icon icon, Function fun, List sub) {
      return ListTile(
        onTap: fun,
        leading: icon,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        subtitle: Text(
          "$sub",
          style: TextStyle(fontSize: 11),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 150,
            width: double.infinity,
            child: Center(
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
          listTile('Meal', Icon(Icons.restaurant), () {
            Navigator.of(context).pushReplacementNamed('/');
          }, meals),
          listTile('Filter', Icon(Icons.settings), () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routName);
          }, ['add filter']),
        ],
      ),
    );
  }
}
