import 'package:flutter/material.dart';
import 'package:restaurant/detail_restaurant.dart';
import 'package:restaurant/list_restaurant.dart';
import 'package:restaurant/styles.dart';
import 'package:restaurant/restaurants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Restaurant',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.white,
              secondary: secondaryColor,
              onBackground: Colors.black,
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
