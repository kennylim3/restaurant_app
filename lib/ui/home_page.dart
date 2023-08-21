import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';

import '../api_service.dart';

class HomePage extends StatefulWidget{
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _widget = ChangeNotifierProvider<RestaurantProvider>(
    create: (_) => RestaurantProvider(apiService: ApiService()),
    child: const RestaurantListPage(),
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _widget,
    );
  }
}