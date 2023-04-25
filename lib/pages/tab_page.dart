// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:deli_meals_3/pages/category_page.dart';
import 'package:deli_meals_3/pages/favorite_page.dart';

import '../models/meal.dart';
import 'side_drawer_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({
    Key? key,
    required this.favMeals,
  }) : super(key: key);

  final List<Meal> favMeals;

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  late List<Map<String, Object>> pages;

  @override
  void initState() {
    pages = [
      {
        'page': const CategoryPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritePage(
          favoriteMeals: widget.favMeals,
        ),
        'title': 'Fovorites',
      },
    ];
    super.initState();
  }

  int selectedIndex = 0;

  void onSelectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onPressedHamburger(BuildContext context) {
    Navigator.of(context)
        .pushNamed(DrawerPage.routeName, arguments: "This was passed ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          pages[selectedIndex]['title'] as String,
        ),
      ),
      // bruh wth there is default drawer noice
      drawer: const Drawer(
        child: DrawerPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: onSelectPage,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'All',
            icon: Icon(
              Icons.category,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: pages[selectedIndex]['page'] as Widget,
    );

    /// Nav Bar at top
    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Meals"),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'All',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favorite',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         HomePage(),
    //         FavoritePage(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
