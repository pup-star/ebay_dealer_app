import 'dart:io';

import 'package:dealer/main_screen.dart';
import 'package:dealer/views/auth/widget/email_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  File? _image;
  //File? _file;
  final picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
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
                    height: 240,
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
                    controller: titleController,
                    hintText: "Price",
                    prefixIcon: const Icon(Icons.abc),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  child: EmailTextField(
                    maxLength: 150,
                    controller: titleController,
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
                      //uploadImage();
                      Get.offAll(() => MainScreen());
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




//chevron_back_circle
