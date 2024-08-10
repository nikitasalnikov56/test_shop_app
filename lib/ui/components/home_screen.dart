import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/manager/get_api_data_provider.dart';
import 'package:shop_app/domain/manager/search_provider.dart';
import 'package:shop_app/domain/models/products.dart';
import 'package:shop_app/ui/components/card_items.dart';
import 'package:shop_app/ui/style/app_colors.dart';
import 'package:shop_app/ui/style/app_style.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchNotifier = ref.read(searchProvider.notifier);
      final products = ref
          .read(GetDataProductsProvider.productsProvider)
          .maybeWhen<List<Products>>(
            data: (products) => products,
            orElse: () => [],
          );
      searchNotifier.search("", products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final filteredProducts = ref.watch(searchProvider);
        final allProducts = ref.watch(GetDataProductsProvider.productsProvider);
        return allProducts.when(
          data: (products) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 80,
                  ),
                  child: TextField(
                    style: AppStyle.fontStyle,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (query) {
                      ref.read(searchProvider.notifier).search(query, products);
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.only(left: 14, right: 14, top: 15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 280,
                      childAspectRatio: 1.8,
                    ),
                    itemBuilder: (context, i) {
                      final product = filteredProducts[i];

                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.black,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: '${product.image}',
                              fit: BoxFit.cover,
                              height: 150,
                              width: 80,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.title.toString(),
                              style: AppStyle.fontStyle.copyWith(fontSize: 14),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description.toString(),
                              style: AppStyle.fontStyle.copyWith(
                                  fontSize: 12,
                                  color: AppColors.black.withOpacity(0.8)),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            CarDItems(product: product, index: i),
                          ],
                        ),
                      );
                    },
                    itemCount: filteredProducts.length,
                  ),
                ),
              ],
            );
          },
          error: (error, stack) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
