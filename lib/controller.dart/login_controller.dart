import 'dart:convert';

import 'package:dealer/main_screen.dart';
import 'package:dealer/models/login_response_model.dart';
import 'package:dealer/screens/home_page.dart';
import 'package:dealer/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final box = GetStorage();
  //final controller = Get.put(NotificationsController());

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void loginFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse('http://localhost:8000/api/authDealer/login');

    final box = GetStorage();
    //String accessToken = box.read("token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      //'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: data);

      print(response.statusCode);

      if (response.statusCode == 200) {
        LoginResponse data = loginResponseFromJson(response.body);

        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write("token", data.token);
        box.write("userId", data.id);
        box.write("dealerName", data.username);

        setLoading = false;

        Get.snackbar(
          "You are successfully login",
          "Enjoy your awesome experience",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          icon: Icon(Ionicons.fast_food_outline),
        );

        Get.offAll(() => MainScreen());
      } else {
        Get.snackbar(
          "Failed login",
          "Please try again",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logout() {
    box.erase();
    Get.offAll(
      //() => MainScreen(),
      () => LoginPage(),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 900),
    );
  }

  LoginResponse? getUserInfo() {
    String? userId = box.read('userId');
    String? data;
    if (userId != null) {
      data = box.read(userId.toString());
    }
    if (data != null) {
      return loginResponseFromJson(data);
    }
    return null;
  }
}
