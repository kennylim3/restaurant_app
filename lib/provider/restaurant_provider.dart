import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_list.dart';

import '../api_service.dart';
import '../data/model/search.dart';

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
  late String query = "";
  
  SearchProvider({required this.apiService}) {
    _fetchSearch();
  }

  late Search _searchResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  Search get result => _searchResult;

  ResultState get state => _state;

  Future<dynamic> _fetchSearch() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.searchRestaurant(query);
      if(_state == ResultState.loading){
        _state = ResultState.loading;
        notifyListeners();
        return _message = 'Searching... Please Wait';
      } else if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
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