import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

import '../../configs/components/custom_appbar.dart';
import 'widgets/product_list_widget.dart';

class FeaturesProductsView extends StatelessWidget {
  const FeaturesProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'Features Products',autoImplyLeading: true,actionWidgets: [
        IconButton(
            onPressed: (){},
            icon: const ImageIcon(AssetImage(ImageAssets.filters ?? ""))),
      ],),
      body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ProductListWidget()
          )),
    );
  }
}
