import 'package:dealer/controller.dart/password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordTextFeild extends StatelessWidget {
  const PasswordTextFeild({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(
      () => TextFormField(
        cursorColor: Colors.black,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        obscureText: passwordController.password,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter valid password";
          } else {
            return null;
          }
        },
        //style: appStyle(12, kDark, FontWeight.normal),
        decoration: InputDecoration(
          hintText: "password",
          prefixIcon: const Icon(
            CupertinoIcons.lock_circle,
            size: 26,
            color: Colors.grey,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              passwordController.setPassword = !passwordController.password;
            },
            child: Icon(
              passwordController.password
                  ? Icons.visibility
                  : Icons.visibility_off,
              size: 26,
              color: Colors.grey,
            ),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(6),
          hintStyle: const TextStyle(
              fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: .5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: .5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: .5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: .5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: .5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: .5),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}
