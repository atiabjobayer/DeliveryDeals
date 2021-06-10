import 'package:flutter/material.dart';
import 'package:quiz/ApiService.dart';
import 'package:quiz/foodItems.dart';
import 'package:quiz/models/restaurant.dart';

class MenuTypes extends StatelessWidget {
  MenuTypes(this.restaurantId, this.restaurantName);

  final String restaurantId;
  final String restaurantName;
  late Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          restaurantName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              FutureBuilder(
                future: Api().getRestaurantDetail(restaurantId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Restaurant data = snapshot.data as Restaurant;
                    restaurant = data;

                    List<String> menuTypes = data.menuTypes;

                    return Column(children: [
                      for (int index = 0;
                          index < (menuTypes as dynamic).length;
                          index++) ...[
                        Column(
                          children: [
                            ListTile(
                              title: Text(menuTypes[index]),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.green[800],
                                size: 20,
                              ),
                              onTap: () {
                                List<MenuItem> foods =
                                    getItemsfromType(menuTypes[index]);

                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return FoodItems(menuTypes[index], foods);
                                  },
                                ));
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ]);
                  } else {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  List<MenuItem> getItemsfromType(String type) {
    List<MenuItem> items = restaurant.menuItems;

    List<MenuItem> target = [];

    for (var i = 0; i < items.length; i++) {
      if (items[i].menuType == type) {
        target.add(items[i]);
      }
    }

    return target;
  }
}
