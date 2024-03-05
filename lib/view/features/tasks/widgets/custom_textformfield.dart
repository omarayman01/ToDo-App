import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hinttext,
      required this.mxlines,
      required this.controller});

  final String hinttext;
  final int mxlines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hinttext),
      maxLines: mxlines,
      controller: controller,
    );
  }
}
