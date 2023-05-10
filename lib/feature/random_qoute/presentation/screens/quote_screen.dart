import 'package:clean_arch/core/utils/app_colors.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:clean_arch/core/widgets/error_widget.dart' as error_widget;
import 'package:clean_arch/feature/random_qoute/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_arch/feature/random_qoute/presentation/widgets/quote_cotent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text(AppStrings.appName),);
    return RefreshIndicator(
        child: Scaffold(appBar: appBar, body: _buildBodyContent(),),
        onRefresh: () => _getRandomQuote());
  }

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return Center(child: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,),);
            },));
        } else if (state is RandomQuoteIsError) {
          return error_widget.ErrorWidget(onPress: () => _getRandomQuote(),);
        } else if (state is RandomQuoteLoaded) {
          return Column(children: [
            QuoteContent(quote: state.quote),
            InkWell(child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary),
              child: const Icon(
                Icons.refresh, size: 30.0, color: Colors.white,),),
              onTap: () => _getRandomQuote(),)
          ],);
        } else {
          return SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(color: AppColors.primary,),);
            },);
        }
      },);
  }
}
