import 'package:dealer/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void registrationFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse('http://localhost:8000/api/authDealer/register');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);

      print(response.statusCode);

      if (response.statusCode == 200) {
        //var data = successModelFromJson(response.body);

        setLoading = false;

        Get.offAll(() => LoginPage());

        Get.snackbar(
          "You are successfully registered", "Welcome",
          //data.message,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          icon: Icon(Ionicons.fast_food_outline),
        );
      } else {
        //var error = apiErrorFromJson(response.body);

        Get.snackbar(
          "Failed to register", "Please try again",
          //error.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
