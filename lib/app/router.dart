import 'package:go_router/go_router.dart';
// Screens
import 'package:employee_portal/features/dashboard/presentation/dashboard_screen.dart';

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
    ],
  );

  static GoRouter config() => _router;
}
