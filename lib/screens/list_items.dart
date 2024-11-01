import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dealer/tabs/tab_clothes.dart';
import 'package:dealer/tabs/tab_hats.dart';
import 'package:dealer/tabs/tab_pants.dart';
import 'package:dealer/tabs/tab_shoes.dart';
import 'package:dealer/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String? token = box.read('token');
    if (token == null) {
      return LoginPage();
    }
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                ButtonsTabBar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        child: Text(
                          "Clothes",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "Shoes",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "Pants",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "Hants",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: TabClothes(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TabShoe(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TabPants(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TabHat(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
