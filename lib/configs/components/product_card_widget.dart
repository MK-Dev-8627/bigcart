import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

import '../../model/product/product_model.dart';
import '../../view_model/home/home_view_model.dart';
import '../assets/image_assets.dart';
import '../color/color.dart';
import '../routes/routes_name.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      required this.product,
      required this.provider,
      required this.index});
  Product product;
  HomeViewModel provider;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(
          context,
          RoutesName.productDetails,
          arguments: {'product': product, 'index': index},
        );
      },
      child: _buildProductCard(context, product, provider, index),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product,
      HomeViewModel provider, int index) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                product.showLabel ?? false
                    ? Container(
                        padding: const EdgeInsets.all(5),
                         decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10)),
                          color: product.disOffer ?? false
                              ? AppColors.redColor.withOpacity(0.3)
                              : AppColors.primaryLightColor.withOpacity(0.5),
                        ),
                        child: Text(
                          product.disOffer ?? false
                              // ? "- ${100} %"
                              ? "- ${(product.discount ??0.0) * 100} %"
                              : 'New',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: product.disOffer ?? false
                                        ? AppColors.redColor
                                        : AppColors.primaryDarkColor,
                                  ),
                        ),
                      )
                    : const SizedBox.shrink(),
                IconButton(
                  onPressed: () =>
                      provider.setFavProduct(product.isFav ?? false, index),
                  icon: Icon(
                    product.isFav ?? false
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: product.isFav ?? false ? AppColors.redColor : null,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Hero(
                tag: '${product.name}',
                child: Image.asset(product.image ?? ""),
              ),
            ),
            5.height,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "${Constants.currency} ${product.price}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.primaryDarkColor),
                  ),
                  5.height,
                  Text(
                    product.name ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  5.height,
                  Text(
                    product.unit ?? "",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const Divider(height: 2, thickness: 2),
            _buildCartControls(context, product, provider, index),
          ],
        ),
      ),
    );
  }

  Widget _buildCartControls(BuildContext context, Product product,
      HomeViewModel provider, int index) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10.0),
      child: product.isAdded ?? false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => provider.removeProductQty(index),
                  icon: const ImageIcon(AssetImage(ImageAssets.minus),
                      size: 20, color: AppColors.primaryDarkColor),
                ),
                Text('${product.qty}',
                    style: Theme.of(context).textTheme.titleLarge),
                IconButton(
                  onPressed: () => provider.addProductQty(index),
                  icon: const ImageIcon(AssetImage(ImageAssets.plus),
                      size: 30, color: AppColors.primaryDarkColor),
                ),
              ],
            )
          : GestureDetector(
              onTap: () =>
                  provider.setAddToCart(product.isAdded ?? false, index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageIcon(AssetImage(ImageAssets.cart),
                      color: AppColors.primaryDarkColor),
                  const SizedBox(width: 10),
                  Text('Add to cart',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
    );
  }
}
