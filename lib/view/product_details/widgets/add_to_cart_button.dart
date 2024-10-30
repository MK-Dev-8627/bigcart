import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

import '../../../configs/assets/image_assets.dart';
import '../../../configs/color/color.dart';
import '../../../configs/components/round_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isSuffix: true,
      suffixIcon: const ImageIcon(
        AssetImage(ImageAssets.cart),
        color: AppColors.whiteColor,
      ),
      title: 'Add to Cart',
      onPress: () {},
      width: context.mediaQueryWidth,
    );
  }
}