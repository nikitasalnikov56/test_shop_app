import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/db/product_data/product_box.dart';
import 'package:shop_app/domain/db/product_data/product_data.dart';

final deleteFromFavoriteProvider = StateNotifierProvider<DeleteFromFavoriteProducts, List<ProductData>>((ref){
  return DeleteFromFavoriteProducts();
});




class DeleteFromFavoriteProducts extends StateNotifier<List<ProductData>>{
  DeleteFromFavoriteProducts():super([]);

   Future<void> deleteFromFavorite(int index) async {
    await ProductBox.productsData.deleteAt(index);
  }
}