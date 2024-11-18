import 'package:big_cart/view/reviews/widgets/reviews_list_widget.dart';
import 'package:flutter/material.dart';

import '../../configs/assets/image_assets.dart';
import '../../configs/components/custom_appbar.dart';

class WriteReviewsView extends StatelessWidget {
  const WriteReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const CustomAppBar(
        title: 'Write Reviews',
        autoImplyLeading: true,
      ),
      body:  SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
                Text(
                  'What do you think?',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],))),
    );
  }
}
