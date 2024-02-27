import 'package:flutter/material.dart';
import 'package:todo_app/view/app_theme.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppTheme.primary,
    );
  }
}
