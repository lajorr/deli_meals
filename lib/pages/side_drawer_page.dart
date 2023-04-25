import 'package:flutter/material.dart';

import 'filter_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});
  static const routeName = '/drawer_page';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    Widget buildListTile(
        {required String label,
        required IconData icon,
        required Function() tapHandler}) {
      return ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      );
    }

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: (media.size.height - media.padding.top) * 0.25,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              alignment: Alignment.center,
              child: const Text(
                'Cooking Up!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: (media.size.height - media.padding.top) * 0.03,
            ),
            buildListTile(
              label: 'Meals',
              icon: Icons.restaurant,
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            buildListTile(
              label: 'Filter',
              icon: Icons.settings,
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed(FilterPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
