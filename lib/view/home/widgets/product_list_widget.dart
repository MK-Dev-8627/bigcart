import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/extensions.dart';
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
import '../../../view_model/home/home_view_model.dart';
import 'error_widgets.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) =>
          HomeViewModel(homeRepository: getIt())..fetchProductsListApi(),
      child: Consumer<HomeViewModel>(builder: (context, provider, _) {
        return Column(
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
                InkWell(
                    onTap: () {}, child: const Icon(Icons.arrow_forward_ios))
              ],
            ),
            10.height,
            SizedBox(
              width: context.mediaQueryWidth,
              child: Skeletonizer(
                enabled: provider.loading,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.productsList.length,
                  itemBuilder: (context, index) {
                    final product = provider.productsList.elementAt(index);
                    return Container(
                      // height: 100,
                      // width: 80,
                      margin: const EdgeInsets.only(right: 10),
                      // padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
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
                                              ? AppColors.redColor
                                                  .withOpacity(0.5)
                                              : AppColors.primaryLightColor),
                                      child: Text(
                                        product.disOffer ?? false
                                            ? product.discount ?? ""
                                            : 'New',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: product.disOffer ?? false
                                                    ? AppColors.redColor
                                                    : AppColors
                                                        .primaryDarkColor),
                                      ),
                                    )
                                  : SizedBox.shrink(),
                              IconButton(
                                  onPressed: () {
                                    provider.setFavProduct(
                                        product.isFav ?? false, index);
                                  },
                                  icon: product.isFav ?? false
                                      ? Icon(
                                          Icons.favorite,
                                          color: AppColors.redColor,
                                        )
                                      : Icon(Icons.favorite_border))
                            ],
                          ),
                          Expanded(child: Image.asset(product.image ?? "")),
                          5.height,
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  product.price ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: AppColors.primaryDarkColor),
                                ),
                                5.height,
                                Text(
                                  product.name ?? "",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                5.height,
                                Text(
                                  product.unit ?? "",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          5.height,
                          const Divider(
                            height: 2,
                            thickness: 2,
                          ),
                          5.height,
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(10.0),
                            child: product.isAdded ?? false
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.remove,
                                            color: AppColors.primaryDarkColor,
                                          )),
                                      Text(
                                        '1',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!.copyWith(color: AppColors.blackColor),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: AppColors.primaryDarkColor,
                                          ))
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const ImageIcon(
                                          AssetImage(ImageAssets.cart),
                                          color: AppColors.primaryDarkColor,
                                        ),
                                        10.width,
                                        Text(
                                          'Add to cart',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!.copyWith(color: AppColors.blackColor),
                                        )
                                      ],
                                    ),
                                  ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            20.height
          ],
        );
      }),
    );
  }
}
