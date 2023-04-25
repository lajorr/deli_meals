// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../pages/side_drawer_page.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({
    Key? key,
    required this.saveFilters,
    required this.currentFilter,
  }) : super(key: key);

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  static const routeName = '/filter_page';

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var isGlutenFree = false;
  var isVegan = false;
  var isLactoseFree = false;
  var isVegetarian = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilter['gluten']!;
    isVegan = widget.currentFilter['vegan']!;
    isLactoseFree = widget.currentFilter['lactose']!;
    isVegetarian = widget.currentFilter['vegetarian']!;

    super.initState();
  }

  Widget buildFilterTile({
    required bool filterValue,
    required String title,
    required String subtitle,
    required Function(bool) updateValue,
  }) {
    return SwitchListTile(
      value: filterValue,
      onChanged: updateValue,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': isGlutenFree,
                'vegan': isVegan,
                'lactose': isLactoseFree,
                'vegetarian': isVegetarian,
              };
              // this function is calls the function in main.dart
              widget.saveFilters(
                selectedFilters, // this is passing data for filter data
              );
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: const DrawerPage(),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                "Adjust Your Meal Selection.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildFilterTile(
                  filterValue: isGlutenFree,
                  title: "Gluten Free",
                  subtitle: 'Only Include Gluten Free Meal',
                  updateValue: (value) {
                    setState(() {
                      isGlutenFree = value;
                    });
                  },
                ),
                buildFilterTile(
                  filterValue: isVegetarian,
                  title: "Vegetarian",
                  subtitle: 'Only Include Vegetarian Meal',
                  updateValue: (value) {
                    setState(() {
                      isVegetarian = value;
                    });
                  },
                ),
                buildFilterTile(
                  filterValue: isVegan,
                  title: "Vegan",
                  subtitle: 'Only Include Vegan Meal',
                  updateValue: (value) {
                    setState(() {
                      isVegan = value;
                    });
                  },
                ),
                buildFilterTile(
                  filterValue: isLactoseFree,
                  title: "Lactose Free",
                  subtitle: 'Only Include Lactose Free Meal',
                  updateValue: (value) {
                    setState(() {
                      isLactoseFree = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
