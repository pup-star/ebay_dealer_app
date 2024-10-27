import 'package:dealer/views/addDetails/add_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Ionicons.chevron_back_circle,
            color: Colors.grey.shade700,
            size: 30,
          ),
        ),
        title: Container(
          child: Text(
            "Types",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Please select some types",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Divider(),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(() => AddDetails());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Image.asset("assets/types/clothes.png"),
                    backgroundColor: Colors.white,
                  ),
                  title: Container(
                    child: Text("Clothes"),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AddDetails());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Image.asset("assets/types/shoe.png"),
                    backgroundColor: Colors.white,
                  ),
                  title: Container(
                    child: Text("Shoe"),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AddDetails());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/types/pants_1.png'),
                    backgroundColor: Colors.white,
                  ),
                  title: Container(
                    child: Text("Pants"),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AddDetails());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/types/hats.png'),
                    backgroundColor: Colors.white,
                  ),
                  title: Container(
                    child: Text("Hats"),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
