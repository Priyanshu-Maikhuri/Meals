import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../pages/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  // Function removeMeal;
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    // required this.removeMeal
  });

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
    //     .then((result) {
    //   if (result != null) {
    //     removeMeal(result);
    //   }
    // });
  }

  String get complexityLevel {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityLevel {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    width: 300,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: <Widget>[
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityLevel),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityLevel),
                      ],
                    )
                  ],
                )),
          ])),
    );
  }
}
