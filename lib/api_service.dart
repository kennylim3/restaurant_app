import 'dart:convert';

import 'data/model/restaurant_detail.dart';
import 'data/model/restaurant_list.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantList> showRestaurantList() async {
    final response = await http.get(Uri.parse("${_baseUrl}list"));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetail> showRestaurantDetail(String id) async{
    final response = await http.get(Uri.parse("${_baseUrl}detail/$id"));
    if(response.statusCode == 200){
      return RestaurantDetail.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to load restaurant's detail");
    }
  }
}