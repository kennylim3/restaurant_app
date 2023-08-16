import 'package:flutter/material.dart';
import 'package:restaurant_app/common/style.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';

import 'data/model/restaurant_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
