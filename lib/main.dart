import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/domain/db/product_data/product_data.dart';
import 'package:shop_app/domain/db/user_data/hive_data.dart';
import 'package:shop_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(HiveDataAdapter());
  Hive.registerAdapter(ProductDataAdapter());
  await Hive.openBox<HiveData>('userBox');
  await Hive.openBox<ProductData>('products');
  await Hive.openBox<String>('settingsBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
