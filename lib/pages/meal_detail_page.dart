// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:deli_meals_3/models/dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({
    Key? key,
    required this.toggleFav,
    required this.isFavorite,
  }) : super(key: key);

  final Function toggleFav;
  final Function isFavorite;

  static const routeName = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((element) => element.id == mealId);
    final appBar = AppBar(
      title: Text(
        selectedMeal.title,
      ),
    );

    Widget buildContainer(Widget child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: (mediaQuery.size.width) * 0.75,
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.23,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: child,
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFav(mealId),
        child: isFavorite(mealId)
            ? Icon(
                Icons.star,
                color: Theme.of(context).primaryColor,
              )
            : const Icon(
                Icons.star,
                color: Colors.white,
              ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.5,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (contex, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (contex, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              '# ${index + 1}',
                            ),
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        // thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
