import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/assets/image_assets.dart';
import '../../../configs/color/color.dart';
import '../../../model/product/product_model.dart';
import '../../../view_model/home/home_view_model.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
    required this.index,
    required this.product,
  });

  final int index;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, _) {
        return Container(
          height: 60,
          width: context.mediaQueryWidth,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.whiteColor, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => provider.removeProductQty(index),
                    icon: const ImageIcon(AssetImage(ImageAssets.minus),
                        size: 20, color: AppColors.primaryDarkColor),
                  ),
                  const VerticalDivider(
                    width: 2,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      '${product!.qty}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.blackColor),
                    ),
                  ),
                  const VerticalDivider(
                    width: 2,
                    thickness: 2,
                  ),
                  IconButton(
                    onPressed: () => provider.addProductQty(index),
                    icon: const ImageIcon(AssetImage(ImageAssets.plus),
                        size: 20, color: AppColors.primaryDarkColor),
                  ),
                ],
              )
            ],
          ),
        );},);
  }
}