import 'package:astronomy/app/presentation/screens/apod_today_screen.dart';
import 'package:astronomy/app/presentation/screens/last_10_screen.dart';
import 'package:astronomy/ui/templates/template.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final routes = GoRouter(
  navigatorKey: _rootNavigator,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => ApodTodayScreen(key: state.pageKey),
    ),
    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (context, state, child) => Template(
        key: state.pageKey,
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/',
          name: 'apod',
          pageBuilder: (context, state) => MaterialPage(
            child: ApodTodayScreen(key: state.pageKey),
          ),
        ),
        GoRoute(
          path: '/last10',
          name: 'last10',
          pageBuilder: (context, state) => MaterialPage(
            child: Last10Screen(key: state.pageKey),
          ),
        ),
      ],
    ),
  ],
);
