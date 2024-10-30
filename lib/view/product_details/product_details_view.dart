import 'package:big_cart/configs/components/round_button.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/assets/image_assets.dart';
import '../../configs/color/color.dart';
import '../../configs/components/custom_appbar.dart';
import '../../main.dart';
import '../../model/product/product_model.dart';
import 'widgets/add_to_cart_button.dart';
import 'widgets/fav_button.dart';
import 'widgets/quantity_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed to this route
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // Ensure args and product are not null before proceeding
    final Product? product = args?['product'] as Product?;
    final int index = args?['index'] ?? 0;
    print(index);
    // Early return if no product is found
    if (product == null) {
      return const Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(child: Text('No product data available!')),
      );
    }

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: ChangeNotifierProvider(
          create: (BuildContext context) =>
              HomeViewModel(homeRepository: getIt())..fetchProductsListApi(),
          child: Consumer<HomeViewModel>(builder: (context, provider, _) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: context.mediaQueryHeight * 0.4,
                      width: context.mediaQueryWidth,
                      decoration:
                          const BoxDecoration(color: AppColors.whiteColor),
                      child: Hero(
                        tag: '${product.name}',
                        child: Image.asset(
                          product.image ?? ImageAssets.apple,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      height: context.mediaQueryHeight * 0.6,
                      width: context.mediaQueryWidth,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${product.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: AppColors.primaryDarkColor),
                                  ),
                                  Text(
                                    '${product.name}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                  Text(
                                    '${product.unit}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              FavButton(product: product, index: index),
                            ],
                          ),
                          20.height,
                          Text(
                            '${product.description}',
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          20.height,
                          QuantityWidget(index: index, product: product),
                          20.height,
                          AddToCartButton(),
                          20.height,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ));
  }
}



