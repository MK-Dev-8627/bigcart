import 'package:big_cart/configs/components/round_button.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:big_cart/view_model/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
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
        body: Center(child: Text('No product data available!')),
      );
    }

    return Scaffold(
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
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                  child: Hero(
                      tag: '${product.name}',
                      child: Image.asset(
                        product.image ?? ImageAssets.apple,
                      )),
                ),
                Container(
                    width: context.mediaQueryWidth,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                Text(
                                  '${product.unit}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            FavButton(product: product, index: index)
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutesName.reviewsView, (route) => true);
                          },
                          child: Row(
                            children: [
                              Text(
                                '${4}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              10.width,
                              starsWidget(context, 4),
                              10.width,
                              Text(
                                '(${2} reviews)',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                        // 20.height,
                        Text(
                          '${product.description}',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        20.height,
                        QuantityWidget(index: index, product: product),
                        20.height,
                        AddToCartButton(),
                        20.height,
                      ],
                    ))
              ],
            ),
          ),
        );
      }),
    ));
  }

  Widget starsWidget(BuildContext context, int stars) {
    return SizedBox(
      height: 50,
      width: 100,
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Icon(
              index < stars ? Icons.star : Icons.star_border_outlined,
              color: AppColors.yellowColor,
              size: 20,
            );
          }),
    );
  }
}
