import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:flutter/material.dart';

import '../../configs/components/custom_appbar.dart';
import 'widgets/product_list_widget.dart';

class FavouriteProductsView extends StatelessWidget {
  const FavouriteProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products',
        autoImplyLeading: true,
        actionWidgets: [
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(AssetImage(ImageAssets.filters ?? ""))),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FavouriteProductListWidget(),
        ),
      ),
    );
  }
}
