import 'package:flutter/material.dart';

import 'ApiService.dart';
import 'models/restaurantSummary.dart';

class ShowData extends StatelessWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String postCode = "N6G0L2";
    int searchRadius = 20;

    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: Api().getRestaurants(postCode, searchRadius),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: (data as dynamic).length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text((data as dynamic)[index].name ?? ""),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
