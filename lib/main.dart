import 'package:flutter/material.dart';

import '../pages/filters_screen.dart';
import '../pages/tabs_screen.dart';
import './pages/meal_detail_screen.dart';
import './pages/category_meals_screen.dart';
import './pages/categories_screen.dart';
import './models/meal.dart';
import './dummy_data.dart';
import '../pages/about_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterdData) {
    setState(() {
      filters = filterdData;

      _availableMeals = dummyMeals.where((meal) {
        if (filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    (existingIndex >= 0)
        ? {
            setState(() {
              _favoriteMeals.removeAt(existingIndex);
            })
          }
        : {
            setState(() {
              _favoriteMeals
                  .add(dummyMeals.firstWhere((meal) => mealId == meal.id));
            })
          };
  }

  bool _isFavorite(mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        hintColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                // fontWeight: FontWeight.bold
              ),
            ),
      ),
      //home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_toggleFavorites, _isFavorite),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(currentFilters: filters, setFilters: _setFilters),
        AboutScreen.routeName: (_) => const AboutScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
        // print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      },
    );
  }
}
