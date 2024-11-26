import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quantum/src/feature/balance/presentation/screens/balance_screen.dart';
import 'package:quantum/src/feature/balance/presentation/screens/history_screen.dart';
import 'package:quantum/src/feature/balance/presentation/screens/home_screen.dart';
import 'package:quantum/src/feature/balance/presentation/screens/tips_screen.dart';
import 'package:quantum/src/feature/calculator/presentation/screens/calculator_screen.dart';

import '../src/feature/splash/presentation/screens/splash_screen.dart';
import 'root_navigation_screen.dart';
import 'route_value.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _calcNavigatorKey = GlobalKey<NavigatorState>();
final _portfolioNavigatorKey = GlobalKey<NavigatorState>();
final _tipsNavigatorKey = GlobalKey<NavigatorState>();
final _historyNavigatorKey = GlobalKey<NavigatorState>();


final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter buildGoRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteValue.splash.path,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
          child: RootNavigationScreen(
            navigationShell: navigationShell,
          ),
        );
      },
      branches: [
          StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouteValue.home.path,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
         StatefulShellBranch(
          navigatorKey: _calcNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouteValue.calc.path,
              builder: (context, state) => CalculatorScreen(),
            ),
          ],
        ),
         StatefulShellBranch(
          navigatorKey: _portfolioNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouteValue.portfolio.path,
              builder: (context, state) => BalanceScreen(),
            ),
          ],
        ),
         StatefulShellBranch(
          navigatorKey: _tipsNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouteValue.tips.path,
              builder: (context, state) => TipsScreen(),
            ),
          ],
        ),
         StatefulShellBranch(
          navigatorKey: _historyNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouteValue.history.path,
              builder: (context, state) => HistoryScreen(),
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(
          child: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.black,
            child: child,
          ),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteValue.splash.path,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
        ),
      ],
    ),
  ],
);
