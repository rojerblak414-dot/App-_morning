import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/restaurant_model.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  final CollectionReference restaurantsCollection = FirebaseFirestore.instance
      .collection("restaurants");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant List Page"),

        backgroundColor: Colors.cyan,
      ),

      body: StreamBuilder(
        stream: restaurantsCollection.snapshots(),

        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("ມີບາງຢ່າງຜິດພາດເກີດຂື້ນ");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text("ບໍ່ມີຂໍ້ມູນຮ້ານອາຫານ");
          }

          final List<Restaurant> restaurantList = snapshot.data!.docs.map((
            doc,
          ) {
            return Restaurant.fromFirestore(doc);
          }).toList();

          return ListView.builder(
            itemCount: restaurantList.length,

            itemBuilder: (context, index) {
              final restaurant = restaurantList[index];

              return Card(
                elevation: 3,

                child: ListTile(
                  title: Text(restaurant.name),

                  subtitle: Text(restaurant.address),

                  trailing: Text(restaurant.tel),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
