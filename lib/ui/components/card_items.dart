import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/domain/manager/add_to_favorite_provider.dart';
import 'package:shop_app/domain/models/products.dart';
import 'package:shop_app/ui/style/app_colors.dart';
import 'package:shop_app/ui/style/app_style.dart';

class CarDItems extends StatelessWidget {
  const CarDItems({
    super.key,
    required this.product,
    required this.index,
  });

  final Products product;
  final int index;
  @override
  Widget build(BuildContext context) {
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
                text: '${product.rating?.rate}',
                style: AppStyle.fontStyle,
              ),
            ],
          ),
        ),
        AddToFavoriteButton(
          product: product,
          index: index,
          title: product.title.toString(),
          description: product.description.toString(),
          image: product.image.toString(),
          rate: product.rating?.rate,
        ),
      ],
    );
  }
}

class AddToFavoriteButton extends ConsumerWidget {
  const AddToFavoriteButton({
    super.key,
    required this.product,
    required this.index,
    required this.title,
    required this.description,
    required this.image,
    required this.rate,
  });
  final Products product;
  final int index;
  final String title;
  final String description;
  final String image;
  final dynamic rate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref
            .read(favoriteProductsProvider.notifier)
            .addToFavorite(index, title, description, image, rate);
      },
      icon: const Icon(Icons.favorite_border),
    );
  }
}
