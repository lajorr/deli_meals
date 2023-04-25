import 'package:deli_meals_3/models/dummy_data.dart';
import 'package:deli_meals_3/pages/side_drawer_page.dart';
import 'package:flutter/material.dart';

import '../widgets/cat_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2.5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CatItem(
                id: dummyCategories[index].id,
                title: dummyCategories[index].title,
                color: dummyCategories[index].color);
          }),
    );
  }
}
