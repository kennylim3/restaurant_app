import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';

import '../data/model/restaurant_detail.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(restaurant.pictureId),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundColor: secondaryColor,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.room,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.grade,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.categories
                          .map(
                            (e) => Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                              child: Text(e.name),
                            )),
                      )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    restaurant.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Menus',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Foods :',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus.foods
                          .map(
                            (e) => Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.lightBlue,
                                  ),
                                  child: Text(e.name),
                                )),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Drinks :',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus.drinks
                          .map(
                            (e) => Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.lightBlue,
                                  ),
                                  child: Text(e.name),
                                )),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
