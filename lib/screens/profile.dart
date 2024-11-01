import 'package:dealer/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller.dart/login_controller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String? token = box.read('token');
    if (token == null) {
      return LoginPage();
    }
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: ListTile(
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/logo/nike_logo.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                  title: Text(
                    "Nike",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Container(
                    child: Icon(SimpleLineIcons.user),
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Container(
                    child: Icon(SimpleLineIcons.location_pin),
                  ),
                  title: Text(
                    "Details",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Container(
                    child: Icon(Icons.privacy_tip),
                  ),
                  title: Text(
                    "Privacy",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Container(
                    child: Icon(SimpleLineIcons.settings),
                  ),
                  title: Text(
                    "Setting",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.logout();
                },
                child: ListTile(
                  leading: Container(
                    child: Icon(SimpleLineIcons.logout),
                  ),
                  title: Text(
                    "Log out",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
