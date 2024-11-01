import 'dart:convert';

import 'package:dealer/models/clothes_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class TabClothes extends StatefulWidget {
  const TabClothes({super.key});

  @override
  State<TabClothes> createState() => _TabClothesState();
}

class _TabClothesState extends State<TabClothes> {
  Future<List<ClothesModel>> ListItems = getPostApi();
  static Future<List<ClothesModel>> getPostApi() async {
    final box = GetStorage();

    final dealerId = box.read('userId');
    print(dealerId);
    var url =
        Uri.parse("http://localhost:8000/api/item/get/${dealerId}/clothes");
    final response = await http.get(url);
    final List body = jsonDecode(response.body);
    return body.map((e) => ClothesModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ClothesModel>>(
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

  Widget buildPosts(List<ClothesModel> posts) {
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
                  child: Image.network(post.imageUrl),
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
