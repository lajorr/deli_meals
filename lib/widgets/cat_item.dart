// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../pages/cat_meals_page.dart';

class CatItem extends StatelessWidget {
  const CatItem({
    Key? key,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  final String title;
  final Color color;
  final String id;

  void onSelectItem(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return CatMealsPage(
    //         title: title,
    //       );
    //     },
    //   ),
    // );

    Navigator.of(context).pushNamed(
      CatMealsPage.routeName,
      arguments: {
        'title': title,
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => onSelectItem(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
