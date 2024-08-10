import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/manager/auth_provider.dart';
import 'package:shop_app/ui/pages/login_page/login_page.dart';
import 'package:shop_app/ui/pages/register_page/register_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(AuthProvider.stateAuthProvider);
    if (auth) {
      return const LoginPage();
    } else {
      return const RegisterPage();
    }
  }
}
