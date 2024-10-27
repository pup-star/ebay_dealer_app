import 'package:dealer/views/addItems/add_items.dart';
import 'package:dealer/views/notifications/notify_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/image/sony2.png"),
                      ),
                      title: Container(
                        child: Text(
                          "items",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18),
                        ),
                      ),
                      subtitle: Container(
                        child: Text("Quantity: 3"),
                      ),
                      trailing: Text(
                        "90 \$",
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
