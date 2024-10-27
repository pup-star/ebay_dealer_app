import 'package:dealer/views/auth/register_page.dart';
import 'package:dealer/views/auth/widget/email_text_widget.dart';
import 'package:dealer/views/auth/widget/password_text_field.dart';
import 'package:dealer/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Center(child: Text("")),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 180,
            ),
            const Center(
                child: Text(
              "L O G I N",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  EmailTextField(
                    hintText: "Enter Email",
                    prefixIcon: const Icon(
                      Icons.mail,
                      size: 22,
                      color: Colors.grey,
                    ),
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PasswordTextFeild(
                    controller: _passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(
                                () => const RegistrationPage(),
                              );
                            },
                            child: const Text("Register")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const MainScreen());
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      'L o g I n ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
