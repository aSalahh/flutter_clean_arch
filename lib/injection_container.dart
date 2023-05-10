import 'package:clean_arch/core/network/network_info.dart';
import 'package:clean_arch/feature/random_qoute/data/datasources/local/random_quote_local_data_source.dart';
import 'package:clean_arch/feature/random_qoute/data/datasources/local/random_quote_local_data_source_imp.dart';
import 'package:clean_arch/feature/random_qoute/data/datasources/remote/random_quote_remote_data_source.dart';
import 'package:clean_arch/feature/random_qoute/data/datasources/remote/random_quote_remote_data_source_impl.dart';
import 'package:clean_arch/feature/random_qoute/data/repositories/random_quote_repository_impl.dart';
import 'package:clean_arch/feature/random_qoute/domain/repositories/random_quote_repository.dart';
import 'package:clean_arch/feature/random_qoute/domain/usecases/get_random_quote.dart';
import 'package:clean_arch/feature/random_qoute/presentation/cubit/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features-----------------------------------------------------------
  //1.bloc
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  //2.useCases
  sl.registerLazySingleton(() => GetRandomQuote(randomQuoteRepository: sl()));
  //2.repository
  sl.registerLazySingleton<RandomQuoteRepository>(() =>
      RandomQuoteRepositoryImpl(
          networkInfo: sl(),
          randomQuoteLocalDataSource: sl(),
          randomQuoteRemoteDataSource: sl()));

  //2.dataSource
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImp(sharedPreferences: sl()));

  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(client: sl()));
  // core-----------------------------------------------------------------
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(connectionChecker: sl()));
  // external-------------------------------------------------------------------
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
