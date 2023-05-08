import 'dart:convert';

import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:clean_arch/feature/random_qoute/data/datasources/local/random_quote_local_data_source.dart';
import 'package:clean_arch/feature/random_qoute/data/models/quote_model.dart';
import 'package:clean_arch/feature/random_qoute/domain/entities/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomQuoteLocalDataSourceImp implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quoteModel));
  }

  @override
  Future<Quote> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
