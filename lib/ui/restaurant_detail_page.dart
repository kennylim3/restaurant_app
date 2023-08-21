import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';

import '../api_service.dart';
import '../data/model/restaurant_detail.dart';
import '../data/model/restaurant_list.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';
  final Restaurants restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  late Future<RestaurantDetail> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().showRestaurantDetail(widget.restaurant.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<RestaurantDetail>(
          future: _restaurant,
          builder: (context, AsyncSnapshot<RestaurantDetail> snapshot){
            final state = snapshot.connectionState;
            if(state != ConnectionState.done){
              return const Center(child: CircularProgressIndicator());
            } else if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Hero(
                          tag: 'https://restaurant-api.dicoding.dev/images/medium/${snapshot.data!.restaurant.pictureId}',
                          child: Image.network('https://restaurant-api.dicoding.dev/images/medium/${snapshot.data!.restaurant.pictureId}'),
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
                            widget.restaurant.name,
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
                                '${snapshot.data!.restaurant.address}, ${widget.restaurant.city}',
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
                                widget.restaurant.rating.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Category',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: snapshot.data!.restaurant.categories
                                  .map(
                                    (e) => Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.purpleAccent,
                                      ),
                                      child: Text(e.name),
                                    )),
                              )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.restaurant.description,
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
                              children: snapshot.data!.restaurant.menus.foods
                                  .map(
                                    (e) => Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.lightBlueAccent,
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
                              children: snapshot.data!.restaurant.menus.drinks
                                  .map(
                                    (e) => Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.lightBlueAccent,
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
          },
        ),
    );
  }
}
