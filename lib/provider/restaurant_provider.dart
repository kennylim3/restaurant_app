import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';

import '../api_service.dart';
import '../data/model/search.dart';
import 'package:http/http.dart' as http;

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantList _restaurantList;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantList get result => _restaurantList;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.showRestaurantList();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantList = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;
  late String searchQuery = "";

  SearchProvider({required this.apiService, required this.searchQuery}){
    fetchSearch(searchQuery);
  }

  late Search _searchResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  String get query => searchQuery;

  Search get result => _searchResult;

  ResultState get state => _state;

  Future<dynamic> fetchSearch(searchQuery) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.searchRestaurant(searchQuery);
      if(_state == ResultState.loading){
        _state = ResultState.loading;
        notifyListeners();
        return _message = 'Searching... Please Wait';
      } else if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "There's no match to your search";
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _searchResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}