// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:deli_meals_3/widgets/meal_item.dart';

import '../models/meal.dart';

class CatMealsPage extends StatefulWidget {
  const CatMealsPage({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  final List<Meal> availableMeals;

  static const routeName = '/cat_meals_page';

  @override
  State<CatMealsPage> createState() => _CatMealsPageState();
}

class _CatMealsPageState extends State<CatMealsPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];

    final catMeals = widget.availableMeals.where(
      (element) {
        return element.categories.contains(catId);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: ListView.builder(
        itemCount: catMeals.length,
        itemBuilder: (context, index) {
          final cm = catMeals[index];
          return MealItem(
            mealId: cm.id,
            imgUrl: cm.imageUrl,
            affordability: cm.affordability,
            complexity: cm.complexity,
            duration: cm.duration,
            title: cm.title,
          );
        },
      ),
    );
  }
}
