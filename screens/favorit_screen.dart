import 'package:flutter/material.dart';
import 'package:meal_app1/widgets/meal_items.dart';
import '../models/meal.dart';

class FavoritScreen extends StatelessWidget {
  static const routName = '/favoritScreen';

  final List<Meal> favoritMeals;
  FavoritScreen(this.favoritMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritMeals.isEmpty) {
      return Center(
          child: Text(
        'you have no favort yet - start adding some!',
        style: TextStyle(color: Colors.blue, fontSize: 20),
      ));
    } else {
      return ListView.builder(
        itemCount: favoritMeals.length,
        itemBuilder: (ctx, index) {
          return MealItems(
            favoriteMeals: favoritMeals,
            id: favoritMeals[index].id,
            imageUrl: favoritMeals[index].imageUrl,
            title: favoritMeals[index].title,
            duration: favoritMeals[index].duration,
            complexity: favoritMeals[index].complexity,
            affordability: favoritMeals[index].affordability,

            // removeItem: _removeItem,
          );
        },
      );
    }
  }
}
