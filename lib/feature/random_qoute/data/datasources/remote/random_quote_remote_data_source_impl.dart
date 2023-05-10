import 'package:clean_arch/core/api/end_points.dart';
import 'package:clean_arch/feature/random_qoute/data/datasources/remote/random_quote_remote_data_source.dart';
import 'package:clean_arch/feature/random_qoute/data/models/quote_model.dart';

import '../../../../../core/api/api_consumer.dart';

class RandomQuoteRemoteDataSourceImpl extends RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuote);
    return QuoteModel.fromJson(response);
  }
}
