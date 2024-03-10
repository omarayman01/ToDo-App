import 'package:flutter/material.dart';
import 'package:todo_app/view/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onpressed,
      required this.color,
      required this.size});
  final String text;
  final VoidCallback onpressed;
  final Color color;
  final Size size;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: color, fixedSize: size),
        onPressed: onpressed,
        child: Text(
          text,
          style: textTheme.bodySmall!.copyWith(color: AppTheme.white),
        ));
  }
}
