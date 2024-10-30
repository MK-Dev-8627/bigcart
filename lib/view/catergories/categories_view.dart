import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

import '../../configs/components/custom_appbar.dart';
import 'widgets/categories_list_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'Categories',autoImplyLeading: true,actionWidgets: [
        IconButton(
            onPressed: (){},
            icon: const ImageIcon(AssetImage(ImageAssets.filters ?? ""))),
      ],),
      body:  SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.height,
              const CategoriesListWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
