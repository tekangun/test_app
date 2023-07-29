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
    this.borderColor,
    this.textColor,
    this.borderRadius,
  });

  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final double? borderRadius;
  final Color? borderColor;
  final Color? textColor;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: (textColor ?? Colors.white).withOpacity(.9),
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
            color: (textColor ?? Colors.white).withOpacity(.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.circular(borderRadius ?? 50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.circular(borderRadius ?? 50.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(borderRadius ?? 50.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(borderRadius ?? 50.0),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: (textColor ?? Colors.white).withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
