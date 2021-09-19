import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = '/meal_detail';

  final Function togglrFavorit;
  final Function isMealFavorits;

  MealDetailsScreen(this.togglrFavorit, this.isMealFavorits);

  @override
  Widget build(BuildContext context) {
    final routArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealId = routArg['id'];
    final mealTitle = routArg['title'];
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealTitle'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => togglrFavorit(mealId),
        child: Icon(isMealFavorits(mealId) ? Icons.star : Icons.star_border),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title(context, 'Intgerident'),
          buildlistView(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(ctx).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              )),
          title(context, 'Steps'),
          buildlistView(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    title: Text(selectedMeal.steps[index]),
                    leading: CircleAvatar(
                      child: Text(
                        '# ${index + 1}',
                      ),
                    ),
                  ),
                  Divider(),
                ]),
              )),
        ]),
      ),
    );
  }

  Widget title(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Text(title, style: Theme.of(ctx).textTheme.headline1),
    );
  }

  Widget buildlistView(BuildContext ctx, Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
