import 'package:restaurant_app/data/model/restaurant_list.dart';

class Search {
  bool error;
  int founded;
  List<Restaurants> restaurants;

  Search({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<Restaurants>.from(json["restaurants"].map((x) => Restaurants.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "founded": founded,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}