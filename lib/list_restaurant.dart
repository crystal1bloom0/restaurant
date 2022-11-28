import 'package:flutter/material.dart';
import 'package:restaurant/detail_restaurant.dart';
import 'package:restaurant/restaurants.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ristorante Six'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/restaurants.json'),
        builder: (context, snapshot) {
          Colors.black;
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurant[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Hero(
      tag: restaurant.pictureId,
      child: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
    ),
    title: Text(restaurant.name),
    trailing: Text('rating ${restaurant.rating}'),
    subtitle: Text(restaurant.city),
    onTap: () {
      Navigator.pushNamed(context, RestaurantDetailPage.routeName,
          arguments: restaurant);
    },
  );
}
