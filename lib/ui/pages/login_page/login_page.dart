import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/constants/app_data.dart';
import 'package:shop_app/domain/manager/auth_provider.dart';
import 'package:shop_app/domain/manager/validate_provider.dart';
import 'package:shop_app/ui/components/textformfield_widget.dart';
import 'package:shop_app/ui/style/app_colors.dart';
import 'package:shop_app/ui/style/app_style.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailError = ref.watch(ValidateProvider.emailErrorProvider);
    final passwordError = ref.watch(ValidateProvider.passwordErrorProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 35,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: AppData.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                TextFormFieldWidget(
                  controller: AppData.emailController,
                  hintText: 'Email',
                  errorText: emailError,
                  onChanged: (value) => AuthProvider.validateEmail(ref, value),
                ),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                  controller: AppData.passwordController,
                  hintText: 'Password',
                  errorText: passwordError,
                  obscureText: true,
                  onChanged: (value) =>
                      AuthProvider.validatePassword(ref, value),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 232, 181, 241),
                      foregroundColor: AppColors.black,
                    ),
                    onPressed: () {
                      AuthProvider.loginUser(AppData.emailController.text,
                          AppData.passwordController.text, context, ref);
                    },
                    child: const Text(
                      'Авторизация',
                      style: AppStyle.fontStyle,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      ref.watch(AuthProvider.stateAuthProvider.notifier).state =
                          false;
                    },
                    child: const Text('Нет аккаунта? Зарегистрируйтесь'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
