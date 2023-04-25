// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:deli_meals_3/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text("No Favorites Yet!"),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          final cm = favoriteMeals[index];
          return MealItem(
            mealId: cm.id,
            imgUrl: cm.imageUrl,
            affordability: cm.affordability,
            complexity: cm.complexity,
            duration: cm.duration,
            title: cm.title,
          );
        },
      );
    }
  }
}
