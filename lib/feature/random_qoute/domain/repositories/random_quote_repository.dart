import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/quote.dart';

abstract class RandomQuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
