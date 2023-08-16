import 'package:flutter/material.dart';
import 'package:restaurant_app/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:http/http.dart' as http;

class ListCard extends StatelessWidget{
  final Restaurants restaurants;

  const ListCard({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context){
    return Material(
        child: ListTile(
          leading: Hero(
            tag: 'https://restaurant-api.dicoding.dev/images/medium/${restaurants.pictureId}',
            child: SizedBox(
              width: 100,
              child: Image.network(
                'https://restaurant-api.dicoding.dev/images/medium/${restaurants.pictureId}',
                fit: BoxFit.cover,
                errorBuilder: (ctx, error, _) =>
                const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          title: Text(
            restaurants.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.room,
                    color: Colors.red,
                  ),
                  Text(
                    restaurants.city,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.grade,
                    color: Colors.yellow,
                  ),
                  Text(
                    restaurants.rating.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, RestaurantDetailPage.routeName,
                arguments: restaurants.id);
          },
        ));
  }
}