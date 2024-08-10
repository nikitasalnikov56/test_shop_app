import 'package:flutter/material.dart';
import 'package:shop_app/ui/routes/app_navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppNavigator.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
