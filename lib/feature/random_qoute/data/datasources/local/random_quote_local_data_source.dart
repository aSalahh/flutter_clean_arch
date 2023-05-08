import 'package:clean_arch/feature/random_qoute/data/models/quote_model.dart';

import '../../../domain/entities/quote.dart';

abstract class RandomQuoteLocalDataSource {
  Future<Quote> getLastRandomQuote();

  Future<void> cacheQuote(QuoteModel quoteModel);
}
