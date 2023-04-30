import 'package:clean_arch/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children: [
          Text(
              'dfdsds dsssssss sssss ssssss sssss sssss sssssss ssssssss ssssss sssssssss ssssssss sssss ssssdfsffffffff ffffffffffffdfd',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text('Bill Gates',
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
