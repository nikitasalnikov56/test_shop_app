import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidateProvider {
  static final nameErrorProvider = StateProvider<String?>((ref) => null);
  static final emailErrorProvider = StateProvider<String?>((ref) => null);
  static final passwordErrorProvider = StateProvider<String?>((ref) => null);
}
