import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/domain/db/user_data/hive_data.dart';

abstract class HiveBox {
  static final Box<HiveData> userBox = Hive.box<HiveData>('userBox');

}
