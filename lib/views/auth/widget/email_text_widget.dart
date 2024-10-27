import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    this.onEditingComplete,
    this.keyboardType,
    this.initiaValue,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.maxLength,
  });

  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initiaValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      maxLength: maxLength,
      initialValue: initiaValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter valid data";
        } else {
          return null;
        }
      },
      //style: appStyle(12, kDark, FontWeight.normal),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
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
            borderSide: BorderSide(color: Colors.grey, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
