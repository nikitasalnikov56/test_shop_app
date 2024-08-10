import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/domain/db/product_data/product_data.dart';

abstract class ProductBox{
  static final Box<ProductData> productsData = Hive.box<ProductData>('products');
}