import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  const MealDetailScreen(this.toggleFavorite, this.isFavorite);

  final Function toggleFavorite;
  final Function isFavorite;

  Widget buildSectionHeading(BuildContext context, String heading) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 180,
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((Meal meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
          ),
          buildSectionHeading(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                elevation: 4,
                color: Theme.of(ctx).hintColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSectionHeading(context, 'Steps'),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('#${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(id),
        //() {
        //   Navigator.of(context).pop(id);
        // }),
        child: Icon(isFavorite(id) ? Icons.star : Icons.star_border_outlined,
            color: Theme.of(context).hintColor),
      ),
    );
  }
}
