import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz/models/location.dart';
import 'package:quiz/models/restaurantSummary.dart';

import 'models/restaurant.dart';

class Api {
  Future<Location> _getLocationFromPost(String postCode) async {
    final response = await http.post(
        Uri.parse(
            "https://prod-clientapi.easygocart.com/easygo/restaurants/getLocationOnPostalCode/$postCode"),
        headers: {
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      print(response.body.toString());
      return locationFromJson(response.body);
    } else {
      throw Exception('Error: ' + response.body.toString());
    }
  }

  Future<List<RestaurantSummary>> _getRestaurantsFromLocation(
      Location location, int searchRadius) async {
    final response = await http.post(
        Uri.parse(
            'https://prod-clientapi.easygocart.com/easygo/restaurants/getRestaurants'),
        body: jsonEncode({
          'latitude': location.latitude.toString(),
          'longitude': location.longitude.toString(),
          'maxDistance': searchRadius.toString(),
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        });

    if (response.statusCode == 200) {
      return restaurantSummaryFromJson(response.body);
    } else {
      throw Exception('Error: ' + response.body.toString());
    }
  }

  Future<List<RestaurantSummary>> getRestaurants(
      String postCode, int searchRadius) async {
    Location pinLocation = await _getLocationFromPost(postCode);

    return _getRestaurantsFromLocation(pinLocation, searchRadius);
  }

  getRestaurantDetail(String id) async {
    final response = await http.get(
        Uri.parse(
            "https://prod-clientapi.easygocart.com/easygo/restaurants/getRestaurantDetails/$id"),
        headers: {
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      print(response.body.toString());
      return restaurantFromJson(response.body);
    } else {
      throw Exception('Error: ' + response.body.toString());
    }
  }
}
