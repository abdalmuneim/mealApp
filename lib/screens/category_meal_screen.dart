import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_items.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routName = '/category_meal';
  final List<Meal> avilableMeal;
  final List<Meal> favoritMeal;

  CategoryMealScreen(this.avilableMeal, this.favoritMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryId;
  String categoryTitle;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final routArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    categoryMeals = widget.avilableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  // _removeItem(String mealId) {
  //   setState(() {
  //     categoryMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItems(
            favoriteMeals: widget.favoritMeal,
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            // removeItem: _removeItem,
          );
        },
      ),
    );
  }
}
