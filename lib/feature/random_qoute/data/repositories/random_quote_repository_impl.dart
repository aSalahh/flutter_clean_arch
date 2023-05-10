import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/error/failures.dart';

import 'package:clean_arch/feature/random_qoute/domain/entities/quote.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/random_quote_repository.dart';
import '../datasources/local/random_quote_local_data_source.dart';
import '../datasources/remote/random_quote_remote_data_source.dart';

class RandomQuoteRepositoryImpl extends RandomQuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  RandomQuoteRepositoryImpl({required this.networkInfo,required this.randomQuoteRemoteDataSource,
     required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
