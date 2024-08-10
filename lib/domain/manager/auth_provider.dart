import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/domain/constants/controllers_clear.dart';
import 'package:shop_app/domain/db/user_data/hive_data.dart';
import 'package:shop_app/domain/manager/get_user_data_db_provider.dart';
import 'package:shop_app/domain/manager/validate_provider.dart';
import 'package:shop_app/ui/routes/app_routes.dart';

class AuthProvider {
  static final stateAuthProvider = StateProvider<bool>((ref) {
    return true;
  });

  static Future<void> registerUser(String name, String email, String password,
      BuildContext context, WidgetRef ref) async {
    var box = Hive.box<HiveData>('userBox');
    var user = HiveData(name: name, email: email, password: password);
    await box.add(user).then((val) {
      var settingsBox = Hive.box<String>('settingsBox');
      settingsBox.put('currentUserEmail', email);
      ref.read(currentUserEmailProvider.notifier).state = email;
      ControllersClear.controllersClear();
      context.go(AppRoutes.home);
    });
  }

  static Future<bool> loginUser(String email, String password,
      BuildContext context, WidgetRef ref) async {
    var box = Hive.box<HiveData>('userBox');
    var user = box.values.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => HiveData(),
    );

    if (user.email != null) {
      var settingsBox = Hive.box<String>('settingsBox');
      settingsBox.put('currentUserEmail', email);
      ref.read(currentUserEmailProvider.notifier).state = email;
      context.go(AppRoutes.home);
      return true;
    }

    return false;
  }

  static void validateName(WidgetRef ref, String? value) {
    if (value == null || value.isEmpty) {
      ref.read(ValidateProvider.nameErrorProvider.notifier).state =
          'Name cannot be empty';
    } else {
      ref.read(ValidateProvider.nameErrorProvider.notifier).state = null;
    }
  }

  static void validateEmail(WidgetRef ref, String? value) {
    if (value == null || value.isEmpty) {
      ref.read(ValidateProvider.emailErrorProvider.notifier).state =
          'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      ref.read(ValidateProvider.emailErrorProvider.notifier).state =
          'Enter a valid email';
    } else {
      ref.read(ValidateProvider.emailErrorProvider.notifier).state = null;
    }
  }

  static void validatePassword(WidgetRef ref, String? value) {
    if (value == null || value.isEmpty) {
      ref.read(ValidateProvider.passwordErrorProvider.notifier).state =
          'Password cannot be empty';
    } else if (value.length < 6) {
      ref.read(ValidateProvider.passwordErrorProvider.notifier).state =
          'Password must be at least 6 characters long';
    } else {
      ref.read(ValidateProvider.passwordErrorProvider.notifier).state = null;
    }
  }

  static Future<void> logout(BuildContext context, WidgetRef ref) async {
    ref.read(stateAuthProvider.notifier).state = true;

    ControllersClear.controllersClear();

    context.go(AppRoutes.auth);
  }
}
