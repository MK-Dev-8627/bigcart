import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:big_cart/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../configs/color/color.dart';
import '../../../configs/components/loading_widget.dart';
import '../../../configs/constants/constants.dart';
import '../../../data/response/status.dart';
import '../../../model/product/product_model.dart';
import '../../../view_model/home/home_view_model.dart';
import 'error_widgets.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) =>
          HomeViewModel(homeRepository: getIt())..fetchProductsListApi(),
      child: Consumer<HomeViewModel>(builder: (context, provider, _) {
        return Skeletonizer(
          enabled: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Features Products',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.blackColor),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Skeletonizer(
                  enabled: provider.loading,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.productsList.length,
                    itemBuilder: (context, index) {
                      final product = provider.productsList[index];
                      return GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(
                            context,
                            RoutesName.productDetails,
                            arguments: {'product': product, 'index': index},
                          );
                        },
                        child: _buildProductCard(
                            context, product, provider, index),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product,
      HomeViewModel provider, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
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
                        color: product.disOffer ?? false
                            ? AppColors.redColor.withOpacity(0.5)
                            : AppColors.primaryLightColor,
                      ),
                      child: Text(
                        product.disOffer ?? false
                            ? product.discount ?? ""
                            : 'New',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
              child: Hero(
                  tag: '${product.name}',
                  child: Image.asset(product.image ?? ""))),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  product.price ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.primaryDarkColor),
                ),
                const SizedBox(height: 5),
                Text(
                  product.name ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
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
                Text(
                  '${product.qty}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.blackColor),
                ),
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
                  Text(
                    'Add to cart',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
    );
  }
}
