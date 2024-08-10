import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/domain/db/product_data/product_box.dart';
import 'package:shop_app/domain/db/product_data/product_data.dart';
import 'package:shop_app/domain/manager/delete_from_favorite.dart';
import 'package:shop_app/ui/style/app_colors.dart';
import 'package:shop_app/ui/style/app_style.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ProductBox.productsData.listenable(),
        builder: (context, Box<ProductData> productsData, _) {
          final allProducts = productsData.values.toList();
          return GridView.builder(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 280,
              childAspectRatio: 1.8,
            ),
            itemBuilder: (context, i) {
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
                      imageUrl: '${allProducts[i].image}',
                      fit: BoxFit.cover,
                      height: 150,
                      width: 80,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      allProducts[i].title.toString(),
                      style: AppStyle.fontStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      allProducts[i].description.toString(),
                      style: AppStyle.fontStyle.copyWith(
                          fontSize: 12,
                          color: AppColors.black.withOpacity(0.8)),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FavoriteCarDItems(allProducts: allProducts, index: i),
                  ],
                ),
              );
            },
            itemCount: allProducts.length,
          );
        });
  }
}

class FavoriteCarDItems extends ConsumerWidget {
  const FavoriteCarDItems({
    super.key,
    required this.allProducts,
    required this.index,
  });
  final List<ProductData> allProducts;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: 'Rating: ',
            style: AppStyle.fontStyle.copyWith(
              fontSize: 12,
              color: AppColors.black.withOpacity(0.8),
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: '${allProducts[index].rate}',
                style: AppStyle.fontStyle,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            ref
                .read(deleteFromFavoriteProvider.notifier)
                .deleteFromFavorite(index);
          },
          icon: const Icon(Icons.delete),
        )
      ],
    );
  }
}
