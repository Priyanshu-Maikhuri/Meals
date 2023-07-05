import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoryMealsScreen({super.key, required this.availableMeals});
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // const displayedMealsScreen(this.id, this.title);
  bool loadedInitState = false;
  List<Meal>? displayedMeals;
  String? categoryTitle;

  @override
  void didChangeDependencies() {
    if (!loadedInitState) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals
          .where((Meal meal) => meal.categories.contains(categoryId))
          .toList();
      loadedInitState = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String id) {
  //   setState(() {
  //     displayedMeals!.removeWhere((Meal meal) => meal.id == id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
            // removeMeal: _removeMeal,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
