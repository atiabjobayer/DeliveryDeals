import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import 'ApiService.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> urls = [
    "food1",
    "food2",
    "food3",
  ];

  final List<String> options = [
    "Most Popular",
    "Fast Food",
    "Desserts",
    "Flowers",
    "Alcohol",
    "Catering",
  ];

  @override
  Widget build(BuildContext context) {
    String postCode = "N6G0L2";
    int searchRadius = 50;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        foregroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Guest User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Orders'),
              leading: Icon(Icons.list),
            ),
            // ListTile(
            //   title: Text('Payment'),
            //   leading: Icon(Icons.credit_card),
            // ),
            // ListTile(
            //   title: Text('Refer & Earn'),
            //   leading: Icon(Icons.share),
            // ),
            ListTile(
              title: Text('Loyalty Points'),
              leading: Icon(Icons.summarize_outlined),
            ),
            // ListTile(
            //   title: Text('Notifications'),
            //   leading: Icon(Icons.notifications),
            // ),
            // ListTile(
            //   title: Text('Address Book'),
            //   leading: Icon(Icons.pin_drop),
            // ),
            // ListTile(
            //   title: Text('Chat Support'),
            //   leading: Icon(Icons.chat),
            // ),
            // ListTile(
            //   title: Text('Announcements'),
            //   leading: Icon(Icons.announcement),
            // ),
            // ListTile(
            //   title: Text('More'),
            //   leading: Icon(Icons.more_horiz),
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ALL MERCHANTS',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Address Full',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            )
          ],
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: CarouselSlider.builder(
                    slideBuilder: (index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/" + urls[index] + ".jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    slideIndicator: CircularSlideIndicator(
                      padding: EdgeInsets.only(bottom: 10),
                      currentIndicatorColor: Colors.white,
                      indicatorBackgroundColor: Colors.white54,
                    ),
                    itemCount: urls.length),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                "http://source.unsplash.com/random/100x100"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            options[index],
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                ),
              ),
              FutureBuilder(
                future: Api().getRestaurants(postCode, searchRadius),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    return Column(
                      children: [
                        for (int index = 0;
                            index < (data as dynamic).length;
                            index++) ...[
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  data[index].cardPhoto,
                                  width: 100,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      data[index].category,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.delivery_dining,
                                          size: 15,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          data[index].preparationTime,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Order Now",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
