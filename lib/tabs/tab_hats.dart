import 'dart:convert';

import 'package:dealer/models/hats_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class TabHat extends StatefulWidget {
  const TabHat({super.key});

  @override
  State<TabHat> createState() => _TabHatState();
}

class _TabHatState extends State<TabHat> {
  Future<List<HatsModel>> ListItems = getPostApi();
  static Future<List<HatsModel>> getPostApi() async {
    final box = GetStorage();

    final dealerId = box.read('userId');
    print(dealerId);
    var url = Uri.parse("http://localhost:8000/api/item/get/${dealerId}/hats");
    final response = await http.get(url);
    final List body = jsonDecode(response.body);
    return body.map((e) => HatsModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<HatsModel>>(
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
    );
  }

  Widget buildPosts(List<HatsModel> posts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            //Get.to(() => DetailPage(clothes: post));
          },
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.network(
                    post.imageUrl,
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/profile/hm.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(post.dealerName),
                  trailing: Text(
                    "\$ ${post.price}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
