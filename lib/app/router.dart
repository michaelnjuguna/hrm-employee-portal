import 'package:employee_portal/presentation/account/profile_screen.dart';
import 'package:employee_portal/presentation/inbox/inbox_screen.dart';
import 'package:employee_portal/presentation/notifications/notifications_screen.dart';
import 'package:employee_portal/presentation/splash_screen.dart';
import 'package:employee_portal/presentation/taskboard/taskboard_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:employee_portal/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        pageBuilder: (context, state) => _fadePage(const SplashScreen()),
      ),
      GoRoute(
        path: '/',
        name: 'dashboard',
        pageBuilder: (context, state) => _fadePage(const DashboardScreen()),
      ),
      GoRoute(
        path: '/taskboard',
        name: 'taskboard',
        pageBuilder: (context, state) => _fadePage(const TaskboardScreen()),
      ),
      GoRoute(
        path: '/inbox',
        name: 'inbox',
        pageBuilder: (context, state) => _fadePage(const InboxScreen()),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder: (context, state) => _fadePage(const ProfileScreen()),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        pageBuilder: (context, state) => _fadePage(const NotificationsScreen()),
      ),
    ],
  );

  static GoRouter config() => _router;

  static CustomTransitionPage _fadePage(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
