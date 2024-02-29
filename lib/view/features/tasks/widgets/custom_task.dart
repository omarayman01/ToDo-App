import 'package:flutter/material.dart';
import 'package:todo_app/view/app_theme.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppTheme.white),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 4,
            color: AppTheme.primary,
            margin: const EdgeInsetsDirectional.only(end: 12),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          const Spacer(),
          Container(
            height: 32,
            width: 69,
            // padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme.primary),
            child: Image.asset('assets/images/icon_check.png'),
          )
        ],
      ),
    );
  }
}
