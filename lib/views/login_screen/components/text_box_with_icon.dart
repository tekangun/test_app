import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBoxWithIcon extends StatelessWidget {
  const TextBoxWithIcon({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
    required this.controller,
  });

  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter the "$hintText"';
          } else if (isEmail && GetUtils.isEmail(value ?? '') == false) {
            return 'Please enter a valid email';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(50.0),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
