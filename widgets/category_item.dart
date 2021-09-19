import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Text(title, style: Theme.of(context).textTheme.headline1),
      ),
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
    );
  }

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routName, arguments: {
      'id': id,
      'title': title,
    });
  }
}
