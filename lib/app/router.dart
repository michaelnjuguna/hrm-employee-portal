import 'package:employee_portal/presentation/splash_screen.dart';
import 'package:employee_portal/presentation/taskboard/taskboard_screen.dart';
import 'package:go_router/go_router.dart';
// Screens
import 'package:employee_portal/presentation/dashboard/dashboard_screen.dart';

class AppRouter {
  AppRouter._();

  static GoRouter config() {
    return GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/',
          name: 'dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/taskboard',
          name: 'taskboard',
          builder: (context, state) => const TaskboardScreen(),
        ),
      ],
    );
  }
}
