import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/db/product_data/product_box.dart';
import 'package:shop_app/domain/db/product_data/product_data.dart';

final favoriteProductsProvider =
    StateNotifierProvider<FavoriteProductsNotifier, List<ProductData>>((ref) {
  return FavoriteProductsNotifier();
});

class FavoriteProductsNotifier extends StateNotifier<List<ProductData>> {
  FavoriteProductsNotifier() : super([]);

  Future<void> addToFavorite(int index, String title, String description,
      String image, dynamic rate) async {
    await ProductBox.productsData.add(
      ProductData(
        title: title,
        description: description,
        image: image,
        rate: rate,
      ),
    );
  }
}
