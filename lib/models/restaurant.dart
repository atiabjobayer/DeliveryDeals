// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.types,
    required this.rating,
    required this.ratingCount,
    required this.reviewsCount,
    required this.preparationTime,
    required this.preparationTimeInMinutes,
    required this.openingTimes,
    required this.openingTimesInReadable,
    required this.openNow,
    required this.openForOrder,
    required this.additionalInfo,
    required this.breakfast,
    required this.noAlchohol,
    required this.lunch,
    required this.dinner,
    required this.dineInAllow,
    required this.vegOnly,
    required this.phoneNumbers,
    required this.emails,
    required this.offerInfo,
    required this.galleryPhotos,
    required this.bgPhoto,
    required this.cardPhoto,
    required this.logoPhoto,
    required this.ratings,
    required this.menuTypes,
    required this.menuItems,
    required this.googleMapLocation,
    required this.location,
    required this.happyHour,
  });

  String id;
  String name;
  Address address;
  List<String> types;
  double rating;
  int ratingCount;
  int reviewsCount;
  String preparationTime;
  int preparationTimeInMinutes;
  String openingTimes;
  String openingTimesInReadable;
  bool openNow;
  bool openForOrder;
  String additionalInfo;
  bool breakfast;
  bool noAlchohol;
  bool lunch;
  bool dinner;
  bool dineInAllow;
  bool vegOnly;
  List<String> phoneNumbers;
  List<String> emails;
  List<String> offerInfo;
  List<String> galleryPhotos;
  String bgPhoto;
  String cardPhoto;
  String logoPhoto;
  List<Rating> ratings;
  List<String> menuTypes;
  List<MenuItem> menuItems;
  String googleMapLocation;
  List<double> location;
  dynamic happyHour;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        types: List<String>.from(json["types"].map((x) => x)),
        rating: json["rating"].toDouble(),
        ratingCount: json["ratingCount"],
        reviewsCount: json["reviewsCount"],
        preparationTime: json["preparationTime"],
        preparationTimeInMinutes: json["preparationTimeInMinutes"],
        openingTimes: json["openingTimes"],
        openingTimesInReadable: json["openingTimesInReadable"],
        openNow: json["openNow"],
        openForOrder: json["openForOrder"],
        additionalInfo: json["additionalInfo"],
        breakfast: json["breakfast"],
        noAlchohol: json["noAlchohol"],
        lunch: json["lunch"],
        dinner: json["dinner"],
        dineInAllow: json["dineInAllow"],
        vegOnly: json["vegOnly"],
        phoneNumbers: List<String>.from(json["phoneNumbers"].map((x) => x)),
        emails: List<String>.from(json["emails"].map((x) => x)),
        offerInfo: List<String>.from(json["offerInfo"].map((x) => x)),
        galleryPhotos: List<String>.from(json["galleryPhotos"].map((x) => x)),
        bgPhoto: json["bgPhoto"],
        cardPhoto: json["cardPhoto"],
        logoPhoto: json["logoPhoto"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        menuTypes: List<String>.from(json["menuTypes"].map((x) => x)),
        menuItems: List<MenuItem>.from(
            json["menuItems"].map((x) => MenuItem.fromJson(x))),
        googleMapLocation: json["googleMapLocation"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
        happyHour: json["happyHour"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address.toJson(),
        "types": List<dynamic>.from(types.map((x) => x)),
        "rating": rating,
        "ratingCount": ratingCount,
        "reviewsCount": reviewsCount,
        "preparationTime": preparationTime,
        "preparationTimeInMinutes": preparationTimeInMinutes,
        "openingTimes": openingTimes,
        "openingTimesInReadable": openingTimesInReadable,
        "openNow": openNow,
        "openForOrder": openForOrder,
        "additionalInfo": additionalInfo,
        "breakfast": breakfast,
        "noAlchohol": noAlchohol,
        "lunch": lunch,
        "dinner": dinner,
        "dineInAllow": dineInAllow,
        "vegOnly": vegOnly,
        "phoneNumbers": List<dynamic>.from(phoneNumbers.map((x) => x)),
        "emails": List<dynamic>.from(emails.map((x) => x)),
        "offerInfo": List<dynamic>.from(offerInfo.map((x) => x)),
        "galleryPhotos": List<dynamic>.from(galleryPhotos.map((x) => x)),
        "bgPhoto": bgPhoto,
        "cardPhoto": cardPhoto,
        "logoPhoto": logoPhoto,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "menuTypes": List<dynamic>.from(menuTypes.map((x) => x)),
        "menuItems": List<dynamic>.from(menuItems.map((x) => x.toJson())),
        "googleMapLocation": googleMapLocation,
        "location": List<dynamic>.from(location.map((x) => x)),
        "happyHour": happyHour,
      };
}

class Address {
  Address({
    required this.addressLine1,
    required this.addressLine2,
    required this.postalCode,
    required this.city,
    required this.province,
    required this.country,
  });

  String addressLine1;
  dynamic addressLine2;
  String postalCode;
  String city;
  String province;
  String country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        postalCode: json["postalCode"],
        city: json["city"],
        province: json["province"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "postalCode": postalCode,
        "city": city,
        "province": province,
        "country": country,
      };
}

class MenuItem {
  MenuItem({
    required this.id,
    required this.name,
    required this.details,
    required this.promoTitle,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.newItem,
    required this.showPromotion,
    required this.notAvailable,
    required this.quantity,
    required this.menuType,
    required this.spicyType,
    required this.showPopup,
    required this.popupTitle,
    required this.popupMenuOptions,
    required this.additionalInfo,
  });

  String id;
  String name;
  String details;
  dynamic promoTitle;
  String image;
  double price;
  double oldPrice;
  bool newItem;
  bool showPromotion;
  bool notAvailable;
  double quantity;
  String menuType;
  dynamic spicyType;
  bool showPopup;
  dynamic popupTitle;
  dynamic popupMenuOptions;
  dynamic additionalInfo;

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        promoTitle: json["promoTitle"],
        image: json["image"],
        price: json["price"].toDouble(),
        oldPrice: json["oldPrice"].toDouble(),
        newItem: json["newItem"],
        showPromotion: json["showPromotion"],
        notAvailable: json["notAvailable"],
        quantity: json["quantity"],
        menuType: json["menuType"],
        spicyType: json["spicyType"],
        showPopup: json["showPopup"],
        popupTitle: json["popupTitle"],
        popupMenuOptions: json["popupMenuOptions"],
        additionalInfo: json["additionalInfo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "promoTitle": promoTitle,
        "image": image,
        "price": price,
        "oldPrice": oldPrice,
        "newItem": newItem,
        "showPromotion": showPromotion,
        "notAvailable": notAvailable,
        "quantity": quantity,
        "menuType": menuType,
        "spicyType": spicyType,
        "showPopup": showPopup,
        "popupTitle": popupTitle,
        "popupMenuOptions": popupMenuOptions,
        "additionalInfo": additionalInfo,
      };
}

class Rating {
  Rating({
    required this.name,
    required this.createdDate,
    required this.rating,
    required this.comments,
  });

  String name;
  String createdDate;
  int rating;
  dynamic comments;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        name: json["name"],
        createdDate: json["createdDate"],
        rating: json["rating"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "createdDate": createdDate,
        "rating": rating,
        "comments": comments,
      };
}
