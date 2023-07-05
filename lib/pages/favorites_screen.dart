import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  const Favorites(this.favoriteMeals);
  final favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('No favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals![index].id,
            title: favoriteMeals![index].title,
            imageUrl: favoriteMeals![index].imageUrl,
            duration: favoriteMeals![index].duration,
            complexity: favoriteMeals![index].complexity,
            affordability: favoriteMeals![index].affordability,
          );
        },
        itemCount: favoriteMeals!.length,
      );
    }
  }
}
