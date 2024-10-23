import 'package:flutter/material.dart';

import '../../../configs/color/color.dart';
import '../../../configs/constants/constants.dart';

class CarouselImageWidget extends StatelessWidget {
  CarouselImageWidget(
      {super.key, required this.image, this.text, this.index = 0});
  String image;
  String? text;
  int? index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Image.asset(image, fit: BoxFit.cover, width: 10000.0),
            Positioned(
                left: 50,
                bottom: 50,
                child: Text(
                  text ?? '20% off on your\nfirst purchase',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryDarkColor),
                )),
            Positioned(
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Constants.imgList.asMap().entries.map((entry) {
                  return Container(
                    width: index == entry.key ? 25.0 : 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: index == entry.key
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        borderRadius: index == entry.key
                            ? BorderRadius.circular(5)
                            : null,
                        color:
                        // (Theme.of(context).brightness == Brightness.dark
                        //         ? Colors.white
                        //
                        AppColors.primaryDarkColor
                            .withOpacity(index == entry.key ? 0.9 : 0.4)),
                  );
                }).toList(),
              ),
            ),
          ])),
    );
  }
}