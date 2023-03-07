import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/auto_size_text/auto_size_text_page.dart';
import 'package:flutter_ui_test/color_bloc/ui/color_bloc_page.dart';
import 'package:flutter_ui_test/next_bank_page/next_bank_page_bloc.dart';
import 'package:flutter_ui_test/next_bank_page/ui/home_page/next_bank_page.dart';
import 'package:flutter_ui_test/poker_game/poker_game_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> routes = [
  GoRoute(
    path: 'ColorBlocPage',
    builder: (BuildContext context, GoRouterState state) {
      return ColorBlocPage();
    },
  ),
  GoRoute(
    path: 'PokerGamePage',
    builder: (BuildContext context, GoRouterState state) {
      return PokerGamePage();
    },
  ),
  GoRoute(
    path: 'AutoSizeTextPage',
    builder: (BuildContext context, GoRouterState state) {
      return AutoSizeTextPage();
    },
  ),
  GoRoute(
    path: 'NextBankPage',
    builder: (BuildContext context, GoRouterState state) {
      return NextBankPage();
    },
  ),
];

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<NextBankPageBloc>(
          create: (context) => NextBankPageBloc(),
          child: NextBankPage(),
        );
      },
      routes: routes,
    ),
  ],
);
