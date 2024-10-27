import 'package:dealer/views/auth/widget/email_text_widget.dart';
import 'package:dealer/views/auth/widget/password_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _userController = TextEditingController();

  late final TextEditingController _phoneController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _userController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        // title: Center(
        //   child: ReuseableText(
        //     text: "Food Delivery",
        //     style: appStyle(20, kDark, FontWeight.bold),
        //   ),
        // ),
      ),
      body: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      " R E G I S T E R",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    EmailTextField(
                      hintText: "Username",
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        size: 22,
                        color: Colors.grey,
                      ),
                      controller: _userController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    EmailTextField(
                      hintText: "Phone",
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        size: 22,
                        color: Colors.grey,
                      ),
                      controller: _phoneController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    EmailTextField(
                      hintText: "Email",
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 22,
                        color: Colors.grey,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    PasswordTextFeild(
                      controller: _passwordController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text("Login")),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get.to(() => const HomePage());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'R E G I S T E R ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
