import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/assets/image_assets.dart';
import '../../../configs/color/color.dart';
import '../../../model/product/product_model.dart';
import '../../../view_model/home/home_view_model.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.product,
    required this.index,
  });

  final Product? product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, _) {
        return IconButton(
          onPressed: () {
            provider.setFavProduct(product!.isFav ?? false, index);
            // print(product.isFav);
            provider.notifyListeners();
          },
          icon: Icon(
            product!.isFav ?? false ? Icons.favorite : Icons.favorite_border,
            color: product!.isFav ?? false ? AppColors.redColor : null,
          ),
        );
      },
    );
  }
}