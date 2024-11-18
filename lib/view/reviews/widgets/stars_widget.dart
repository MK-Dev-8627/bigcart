import 'package:flutter/material.dart';

import '../../../configs/color/color.dart';

class StarsWidget extends StatelessWidget {
  StarsWidget({super.key, required this.stars});
  int stars;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 120,
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
