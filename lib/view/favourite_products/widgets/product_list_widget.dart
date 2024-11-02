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

class FavouriteProductListWidget extends StatefulWidget {
  const FavouriteProductListWidget({super.key});

  @override
  State<FavouriteProductListWidget> createState() => _FavouriteProductListWidgetState();
}

class _FavouriteProductListWidgetState extends State<FavouriteProductListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Schedule fetchFavProductsList to run after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeViewModel>(context, listen: false);
      provider.fetchFavProductsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, _) {
      print('FavScreen:   ${provider.favProductsList}');
      return Skeletonizer(
        enabled: provider.loading,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.favProductsList.length,
          itemBuilder: (context, index) {
            final product = provider.favProductsList[index];
            return ProductCard(product: product, provider: provider, index: index);
          },
        ),
      );
    });
  }

}
