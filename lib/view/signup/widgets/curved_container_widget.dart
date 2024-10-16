import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

import '../../../configs/color/color.dart';

class CurvedContainer extends StatelessWidget {
  CurvedContainer({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: context.mediaQueryHeight * 0.6,
      width: context.mediaQueryWidth,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
