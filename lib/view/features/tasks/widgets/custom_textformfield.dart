import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_model/settings_provider.dart';

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
    SettingsProvider settings = Provider.of<SettingsProvider>(context);
    return TextFormField(
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: settings.textThemeColor)),
      maxLines: mxlines,
      controller: controller,
    );
  }
}
