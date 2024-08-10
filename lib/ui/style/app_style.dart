import 'package:flutter/widgets.dart';
import 'package:shop_app/ui/style/app_colors.dart';

abstract class AppStyle {
  AppStyle._();

  static const fontStyle = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Ubuntu',
  );
}
