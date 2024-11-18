import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/color/color.dart';
import '../../../view_model/home/home_view_model.dart';

class RatingWidget extends StatelessWidget {
  RatingWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, _) {
      return SizedBox(
      height: 50,
      width: context.mediaQueryWidth,
      child: Center(
        child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return IconButton(onPressed: (){
                provider.setCurrentStars(index+1);
              }, icon: Icon(
                index < provider.currentStars ? Icons.star : Icons.star_border_outlined,
                color: AppColors.yellowColor,
                // size: 20,
              ));
            }),
      ),

    );});
  }
}
