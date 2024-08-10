import 'package:flutter/widgets.dart';

class AppData {
  //controllers
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final searchController = TextEditingController();

  static final _formKey = GlobalKey<FormState>();
  static GlobalKey<FormState> get formKey => _formKey;
}
