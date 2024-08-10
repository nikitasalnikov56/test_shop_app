import 'package:dio/dio.dart';
import 'package:shop_app/domain/models/products.dart';

class Api {
  //variables
  static final dio = Dio();
  static List<Products> products = [];

//methods
  Future<List<Products>> getProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print(data);
        products = data.map((items) => Products.fromJson(items)).toList();
        return products;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        products = data.map((items) => Products.fromJson(items)).toList();
        return products;
      } else {
        throw Exception('Error: $e');
      }
    }
  }
}
