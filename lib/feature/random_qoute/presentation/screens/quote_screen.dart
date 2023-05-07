import 'package:clean_arch/core/utils/app_colors.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:clean_arch/feature/random_qoute/presentation/widgets/quote_cotent.dart';
import 'package:flutter/material.dart';


class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(AppStrings.appName),
    );
    return Scaffold(
      appBar: appBar,
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const QuoteContent(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          padding: EdgeInsets.all(10.0),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
          child: const Icon(
            Icons.refresh,
            size: 30.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
