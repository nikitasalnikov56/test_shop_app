// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/manager/get_api_data_provider.dart';
import 'package:shop_app/domain/models/products.dart';

class SearchNotifier extends StateNotifier<List<Products>> {

  SearchNotifier(super.products);

  void search(String query, List<Products> allProducts) {
    if (query.isEmpty) {
      state = allProducts;
    }
    else{
      state = allProducts
          .where(
            (product) =>
                product.title!.toLowerCase().contains(query.toLowerCase()) ||
                product.description!
                    .toLowerCase()
                    .contains(query.toLowerCase()),
          )
          .toList();
    } 
  }

 
}

final searchProvider = StateNotifierProvider<SearchNotifier, List<Products>>(
  (ref) {
    final products = ref
        .watch(GetDataProductsProvider.productsProvider)
        .maybeWhen<List<Products>>(
          data: (products) => products,
          orElse: () => [],
        );
    return SearchNotifier(products);
  },
);
