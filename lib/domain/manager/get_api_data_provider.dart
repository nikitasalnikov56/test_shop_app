import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/api/api.dart';
import 'package:shop_app/domain/models/products.dart';

class GetDataApiProvider{
static final apiProvider = Provider<Api>((ref) => Api());
}

class GetDataProductsProvider {
  static final productsProvider = FutureProvider<List<Products>>((ref)async{
   final api = ref.read(GetDataApiProvider.apiProvider);
  return api.getProducts();
 }); 
}