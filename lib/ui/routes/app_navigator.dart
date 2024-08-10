import 'package:go_router/go_router.dart';
import 'package:shop_app/ui/pages/auth_page/auth_page.dart';
import 'package:shop_app/ui/pages/home_page/home_page.dart';
import 'package:shop_app/ui/pages/login_page/login_page.dart';
import 'package:shop_app/ui/pages/register_page/register_page.dart';
import 'package:shop_app/ui/routes/app_routes.dart';

abstract class AppNavigator {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
  static GoRouter get router => _router;
}
