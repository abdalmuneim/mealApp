import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filter_Screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meal_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avilableMeals = DUMMY_MEALS;
  List<Meal> _favoritMeals = [];

  void _togglefavorit(String mealId) {
    final existingIndex = _favoritMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorits(String id) {
    return _favoritMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;

      _avilableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 244, .9),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline1: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoritMeals),
        CategoryMealScreen.routName: (context) =>
            CategoryMealScreen(_avilableMeals, _favoritMeals),
        MealDetailsScreen.routName: (context) => MealDetailsScreen(_togglefavorit, _isMealFavorits),
        FilterScreen.routName: (context) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
