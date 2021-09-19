import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routName = '/categoiesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
                  CategoryItem(catData.id, catData.title, catData.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}
