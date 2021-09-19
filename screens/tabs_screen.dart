import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/maindrawer.dart';

import 'favorit_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritMeals;

  TabsScreen(this.favoritMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  _selectedPage(int valeu) {
    setState(() {
      _selectedPageIndex = valeu;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritScreen(widget.favoritMeals),
        'title': 'Favorit',
      },
    ];
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 13,
          unselectedFontSize: 10,
          onTap: _selectedPage,
          items: [
            BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: 'Favorit',
              icon: Icon(Icons.star),
            ),
          ],
        ),
        drawer: MainDrawer());
  }
}
