import 'package:bloc/bloc.dart';
import 'package:clean_arch/core/error/failures.dart';
import 'package:clean_arch/core/usecases/usecase.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/quote.dart';
import '../../domain/usecases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(response.fold(
        (failure) => RandomQuoteIsError(msg: mapFailureToMessage(failure)),
        (quote) => RandomQuoteLoaded(quote: quote)));
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unExpectedError;
    }
  }
}
