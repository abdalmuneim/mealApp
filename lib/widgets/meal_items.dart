import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItems extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String title;
  final duration;
  final Complexity complexity;
  final Affordability affordability;
  final favoriteMeals;
  // final Function removeItem;

  const MealItems({
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,
    @required this.favoriteMeals,
    // @required this.removeItem,
  });

  @override
  _MealItemsState createState() => _MealItemsState();
}

class _MealItemsState extends State<MealItems> {
  String get complexityText {
    switch (widget.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'try ';
        break;
    }
  }

  String get affordabilityText {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknowe ';
        break;
    }
  }

  var existingIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                child: Container(
                  width: 280,
                  color: Colors.black38,
                  child: Text('${widget.title}',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(8),
                  ),
                  child: Container(
                    color: Colors.orangeAccent,
                    padding: EdgeInsets.only(left: 5),
                    child: IconButton(
                      padding: EdgeInsets.only(left: 10),
                      icon: Icon(widget.favoriteMeals.any((meal) => meal.id == widget.id) ? Icons.star : Icons.star_border,
                        size: 30,
                        color: Colors.white,
                    ),
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 4),
                      Text('${widget.duration} min'),
                    ]),
                    Row(children: [
                      Icon(Icons.work),
                      SizedBox(width: 4),
                      Text('$complexityText'),
                    ]),
                    Row(children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 4),
                      Text('$affordabilityText'),
                    ]),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routName, arguments: {
      'id': widget.id,
      'title': widget.title,
    }).then((result) {
      // if (result != null) removeItem(result);
    });
  }
}
