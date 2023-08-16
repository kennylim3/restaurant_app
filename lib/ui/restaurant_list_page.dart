import 'package:flutter/material.dart';
import 'package:restaurant_app/list_card.dart';

import '../api_service.dart';
import '../data/model/restaurant_list.dart';

class RestaurantListPage extends StatefulWidget {
  static const routeName = '/restaurant_list';
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late Future<RestaurantList> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().showRestaurantList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Restaurant',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'Recommendations for you!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
        ],
      )),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context){
    return FutureBuilder<RestaurantList>(
      future: _restaurant,
      builder: (context, AsyncSnapshot<RestaurantList> snapshot){
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.restaurants.length,
              itemBuilder: (context, index) {
                var restaurants = snapshot.data?.restaurants[index];
                return ListCard(restaurants: restaurants!);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Material(
                child: Text(snapshot.error.toString()),
              ),
            );
          } else {
            return const Material(child: Text(''));
          }
        }
      },
    );
  }
}
