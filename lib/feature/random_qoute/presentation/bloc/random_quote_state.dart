part of 'random_quote_cubit.dart';

@immutable
abstract class RandomQuoteState extends Equatable {
  @override
  List<Object?> get props => [];

  const RandomQuoteState();
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteLoaded({required this.quote});

  @override
  List<Object?> get props => [quote];
}

class RandomQuoteIsError extends RandomQuoteState {
  final String msg;

  const RandomQuoteIsError({required this.msg});

  @override
  List<Object?> get props => [msg];
}
