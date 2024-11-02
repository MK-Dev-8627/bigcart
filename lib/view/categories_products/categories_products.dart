import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

import '../../configs/components/custom_appbar.dart';
import 'widgets/product_list_widget.dart';

class CategoriesProductsView extends StatelessWidget {
  const CategoriesProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed to this route
    final Map<String, dynamic>? args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: CustomAppBar(title: '${args!['category']}',autoImplyLeading: true,actionWidgets: [
        IconButton(
            onPressed: (){},
            icon: const ImageIcon(AssetImage(ImageAssets.filters ?? ""))),
      ],),
      body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 10.0,right: 20.0,),
            child: CategoriesProductListWidget()
          )),
    );
  }
}
