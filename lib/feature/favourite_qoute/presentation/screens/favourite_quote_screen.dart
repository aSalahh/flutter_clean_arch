import 'package:flutter/material.dart';


class FavouriteQuote extends StatefulWidget {
  const FavouriteQuote({Key? key}) : super(key: key);

  @override
  State<FavouriteQuote> createState() => _FavouriteQuoteScreenState();
}

class _FavouriteQuoteScreenState extends State<FavouriteQuote> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('favourite Screen')),
    );
  }
}
