import 'dart:io';

import 'package:dealer/main_screen.dart';
import 'package:dealer/views/auth/widget/email_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';

class HatsDetails extends StatefulWidget {
  const HatsDetails({super.key, required this.hats});

  final String hats;

  @override
  State<HatsDetails> createState() => _HatsDetailsState();
}

class _HatsDetailsState extends State<HatsDetails> {
  File? _image;
  //File? _file;
  final picker = ImagePicker();

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future choiceImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    //final name = File(pickedImage!.name);

    if (pickedImage == null) return;
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future<dynamic> uploadImage() async {
    final box = GetStorage();

    // final accessToken = box.read("token");
    final userId = box.read("userId");
    final dealerName = box.read("dealerName");

    // Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $accessToken'
    // };

    final uri = Uri.parse('http://localhost:8000/api/item/add');
    final request = http.MultipartRequest('POST', uri);

    request.fields['dealerId'] = userId;
    request.fields['title'] = titleController.text;
    request.fields['price'] = priceController.text;
    request.fields['description'] = descriptionController.text;
    request.fields['type'] = widget.hats;
    request.fields['dealerName'] = dealerName;

    if (_image == null) {
      return Get.snackbar(
        " Sorry, No Image Selected!!!",
        "please Select One",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Ionicons.fast_food_outline),
      );
    }

    var pic = await http.MultipartFile.fromPath("imageUrl", _image!.path);

    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploded');
      Get.snackbar("Succussfully", "Uplaod Items");
      Get.offAll(() => const MainScreen());
    } else {
      print('Image Not Uploded');
    }
    setState(() {});
  }

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
            size: 30,
            color: Colors.grey.shade600,
          ),
        ),
        title: Text(
          "Add Info",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    choiceImage();
                  },
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: _image != null
                        ? Image.file(_image!.absolute, fit: BoxFit.cover)
                        : const Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 40,
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        " * Plaese selete at least one picture",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: EmailTextField(
                    maxLength: 30,
                    controller: titleController,
                    hintText: "Title",
                    prefixIcon: const Icon(Icons.abc),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  child: EmailTextField(
                    maxLength: 10,
                    controller: priceController,
                    hintText: "Price",
                    prefixIcon: const Icon(Icons.abc),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  child: EmailTextField(
                    maxLength: 150,
                    controller: descriptionController,
                    hintText: "Description",
                    prefixIcon: const Icon(Icons.abc),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      uploadImage();
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
