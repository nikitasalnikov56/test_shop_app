import 'package:hive/hive.dart';

part 'hive_data.g.dart';

@HiveType(typeId: 0)
class HiveData {

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? password;

  HiveData({this.name, this.email, this.password});
}
