import 'package:clean_arch/core/error/failures.dart';
import 'package:clean_arch/core/usecases/usecase.dart';
import 'package:clean_arch/feature/random_qoute/domain/entities/quote.dart';
import 'package:dartz/dartz.dart';

import '../repositories/random_quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final RandomQuoteRepository randomQuoteRepository;

  GetRandomQuote({required this.randomQuoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      randomQuoteRepository.getRandomQuote();
}
