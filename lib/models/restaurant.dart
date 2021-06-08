// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Restaurant> restaurantFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restaurantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.types,
    required this.rating,
    required this.ratingCount,
    required this.preparationTime,
    required this.cardPhoto,
    required this.openForOrder,
    required this.openNow,
    required this.openingTimes,
    required this.additionalInfo,
    required this.offerInfo,
    required this.category,
    required this.location,
    required this.someData1,
    required this.someData2,
    required this.newRestaurant,
    required this.promotional,
  });

  String id;
  String name;
  List<String> types;
  double rating;
  int ratingCount;
  String preparationTime;
  String cardPhoto;
  bool openForOrder;
  bool openNow;
  String openingTimes;
  dynamic additionalInfo;
  List<String> offerInfo;
  String category;
  List<double> location;
  dynamic someData1;
  dynamic someData2;
  bool newRestaurant;
  bool promotional;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        types: List<String>.from(json["types"].map((x) => x)),
        rating: json["rating"].toDouble(),
        ratingCount: json["ratingCount"],
        preparationTime: json["preparationTime"],
        cardPhoto: json["cardPhoto"],
        openForOrder: json["openForOrder"],
        openNow: json["openNow"],
        openingTimes: json["openingTimes"],
        additionalInfo: json["additionalInfo"],
        offerInfo: List<String>.from(json["offerInfo"].map((x) => x)),
        category: json["category"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
        someData1: json["someData1"],
        someData2: json["someData2"],
        newRestaurant: json["newRestaurant"],
        promotional: json["promotional"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x)),
        "rating": rating,
        "ratingCount": ratingCount,
        "preparationTime": preparationTime,
        "cardPhoto": cardPhoto,
        "openForOrder": openForOrder,
        "openNow": openNow,
        "openingTimes": openingTimes,
        "additionalInfo": additionalInfo,
        "offerInfo": List<dynamic>.from(offerInfo.map((x) => x)),
        "category": category,
        "location": List<dynamic>.from(location.map((x) => x)),
        "someData1": someData1,
        "someData2": someData2,
        "newRestaurant": newRestaurant,
        "promotional": promotional,
      };
}
