import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/components/product_card_widget.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:big_cart/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../configs/color/color.dart';
import '../../../model/product/product_model.dart';
import '../../../view_model/home/home_view_model.dart';

class CategoriesProductListWidget extends StatelessWidget {
  const CategoriesProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, _) {
      return Skeletonizer(
        enabled: provider.loading,
        child: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.productsList.length,
          itemBuilder: (context, index) {
            final product = provider.productsList[index];
            return ProductCard(product: product, provider: provider, index: index);
          },
        ),
      );
    });
  }

}
