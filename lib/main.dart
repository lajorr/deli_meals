import 'package:deli_meals_3/models/dummy_data.dart';
import 'package:deli_meals_3/pages/filter_page.dart';
import 'package:deli_meals_3/pages/tab_page.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'pages/cat_meals_page.dart';
import 'pages/meal_detail_page.dart';
import 'pages/side_drawer_page.dart';

import 'pages/category_page.dart';

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
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = dummyMeals;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    print('Saved??');
    setState(() {
      filters = filterData;
      availableMeals = dummyMeals.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorites(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(
          dummyMeals.firstWhere(
            (meal) => meal.id == mealId,
          ),
        );
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 30,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 20,
              ),
              displayLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
      ),
      // home: TabPage(favMeals: favoriteMeals),
      routes: {
        '/': (context) => TabPage(favMeals: favoriteMeals),
        CatMealsPage.routeName: (context) => CatMealsPage(
              availableMeals: availableMeals,
            ),
        DrawerPage.routeName: (context) => const DrawerPage(),
        MealDetailPage.routeName: (context) => MealDetailPage(
              toggleFav: toggleFavorites,
              isFavorite: isMealFavorite,
            ),
        FilterPage.routeName: (context) => FilterPage(
              currentFilter: filters,
              saveFilters: setFilters,
            ),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const CategoryPage()),
    );
  }
}
