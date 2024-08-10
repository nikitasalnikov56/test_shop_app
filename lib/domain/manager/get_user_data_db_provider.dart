import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/domain/db/user_data/hive_data.dart';

// Провайдер для хранения текущего email пользователя
final currentUserEmailProvider = StateProvider<String?>((ref) {
  var settingsBox = Hive.box<String>('settingsBox');
  return settingsBox.get('currentUserEmail');
});

// Провайдер для извлечения данных текущего пользователя
final currentUserProvider = Provider<HiveData>((ref) {
  var userBox = Hive.box<HiveData>('userBox');
  var currentUserEmail = ref.watch(currentUserEmailProvider);

  if (currentUserEmail == null) {
    return HiveData(); // Возвращаем пустой объект, если email не найден
  }

  return userBox.values.firstWhere(
    (user) => user.email == currentUserEmail,
    orElse: () => HiveData(),
  );
});
