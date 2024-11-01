import 'dart:convert';

import 'package:dealer/models/order_recieve_model.dart';
import 'package:dealer/views/addItems/add_items.dart';
import 'package:dealer/views/auth/login_page.dart';
import 'package:dealer/views/notifications/notify_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<OrderRecieveModel>> ListItems = getPostApi();
  static Future<List<OrderRecieveModel>> getPostApi() async {
    final box = GetStorage();

    final dealerId = box.read('userId');
    print(dealerId);
    var url = Uri.parse(
        "http://localhost:8000/api/order/dealerId/${dealerId}?orderStatus=Preparing");
    final response = await http.get(url);
    final List body = jsonDecode(response.body);
    return body.map((e) => OrderRecieveModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String? token = box.read('token');
    if (token == null) {
      return LoginPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 75, child: Image.asset('assets/image/ebay.png')),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                Get.to(() => NotifyPage());
              },
              icon: Badge(
                label: Text("9"),
                child: Icon(
                  Icons.notifications,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => AddItems());
              },
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 26,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Container(
                        child: Text(
                          "Add Items",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Recieve new orders",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<OrderRecieveModel>>(
              future: ListItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  final posts = snapshot.data!;
                  return buildPosts(posts);
                } else {
                  return const Text("No data available");
                }
              },
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 20,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //           leading: CircleAvatar(
            //             backgroundColor: Colors.white,
            //             child: Image.asset("assets/image/sony2.png"),
            //           ),
            //           title: Container(
            //             child: Text(
            //               "items",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.normal, fontSize: 18),
            //             ),
            //           ),
            //           subtitle: Container(
            //             child: Text("Quantity: 3"),
            //           ),
            //           trailing: Text(
            //             "90 \$",
            //             style: TextStyle(fontSize: 15),
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildPosts(List<OrderRecieveModel> posts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(post.imageProduct)),
            title: Container(
              child: Text(
                "items",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
            ),
            subtitle: Container(
              child: Text("Quantity: 0"),
            ),
            trailing: Text(
              "90 \$",
              style: TextStyle(fontSize: 15),
            ),
          ),
        );
      },
    );
  }
}
