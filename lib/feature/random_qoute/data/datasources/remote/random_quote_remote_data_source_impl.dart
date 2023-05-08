import 'dart:convert';

import 'package:clean_arch/core/api/end_points.dart';
import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:clean_arch/feature/random_qoute/data/datasources/remote/random_quote_remote_data_source.dart';
import 'package:clean_arch/feature/random_qoute/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

class RandomQuoteRemoteDataSourceImpl extends RandomQuoteRemoteDataSource {
  http.Client client;
  RandomQuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUrl = Uri.parse(EndPoints.randomQuote);
    final response = await client.get(randomQuoteUrl,
        headers: {AppStrings.contentType: AppStrings.applicationJson});
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
