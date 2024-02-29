import 'package:flutter/material.dart';
import 'package:todo_app/view/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onpressed});
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            fixedSize: Size(MediaQuery.of(context).size.width, 50)),
        onPressed: onpressed,
        child: Text(
          text,
          style: textTheme.bodySmall!.copyWith(color: AppTheme.white),
        ));
  }
}
