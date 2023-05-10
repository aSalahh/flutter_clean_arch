import 'package:clean_arch/feature/favourite_qoute/presentation/screens/favourite_quote_screen.dart';
import 'package:clean_arch/feature/random_qoute/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_arch/feature/random_qoute/presentation/screens/quote_screen.dart';
import 'package:clean_arch/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favouriteQuotesRoute = '/favouriteQuotesRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<RandomQuoteCubit>(
                  create: (context) => di.sl<RandomQuoteCubit>(),
                  child: const QuoteScreen(),
                ));

      case Routes.favouriteQuotesRoute:
        return MaterialPageRoute(builder: ((context) {
          return const FavouriteQuote();
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
