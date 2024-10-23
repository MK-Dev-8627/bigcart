import 'package:big_cart/configs/extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../configs/constants/constants.dart';
import 'carousel_image_widget.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({
    super.key,
  });

  final CarouselSliderController _controller = CarouselSliderController();

  final List<Widget> imageSliders = Constants.imgList
      .map((item) => CarouselImageWidget(
    image: item,
    index: Constants.imgList.indexOf(item),
  ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      height: context.mediaQueryHeight * 0.25,
      width: context.mediaQueryWidth,

      child: CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {}),
      ),
    );
  }
}