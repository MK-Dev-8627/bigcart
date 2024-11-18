import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/reviews/widgets/reviews_list_widget.dart';
import 'package:flutter/material.dart';

import '../../configs/assets/image_assets.dart';
import '../../configs/components/custom_appbar.dart';
import 'widgets/add_review_button_widget.dart';
import 'widgets/input_comment_widget.dart';
import 'widgets/rating_widget.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  'What do you think?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                  10.height,
                  Text(
                  'please give your rating by clicking on the stars below',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                  10.height,
                  RatingWidget(),
                  10.height,
                  InputCommentWidget(),
                  20.height,
                  AddReviewButtonWidget(),
              ],))),
    );
  }
}
