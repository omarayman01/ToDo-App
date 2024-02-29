import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hinttext, required this.mxlines});

  final String hinttext;
  final int mxlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hinttext),
      maxLines: mxlines,
    );
  }
}
