import 'package:hive/hive.dart';

part 'product_data.g.dart';

@HiveType(typeId: 1)
class ProductData {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? image;

  @HiveField(3)
  dynamic rate;
  ProductData({this.title, this.description, this.image, this.rate});
}
