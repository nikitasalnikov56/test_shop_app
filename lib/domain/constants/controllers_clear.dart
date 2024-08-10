import 'package:shop_app/domain/constants/app_data.dart';

class ControllersClear {
  static Future<void> controllersClear() async {
   
    AppData.nameController.clear();
    AppData.emailController.clear();
    AppData.passwordController.clear();
  }
}
