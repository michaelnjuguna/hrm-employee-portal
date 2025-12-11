import 'package:employee_portal/presentation/taskboard/taskboard_screen.dart';
import 'package:go_router/go_router.dart';
// Screens
import 'package:employee_portal/presentation/dashboard/dashboard_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
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

  static GoRouter config() => _router;
}
