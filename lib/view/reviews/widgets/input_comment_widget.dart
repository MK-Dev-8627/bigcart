import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/shipping/shipping_view_model.dart';

class InputCommentWidget extends StatelessWidget {
  const InputCommentWidget(
      {Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Tell us about your experience',
        controller: provider.commentController,
        focusNode: null,
        keyboardType: TextInputType.text,
        minLines: 5,
        // fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
        },
        onChanged: (value) {
          provider.setComment(value!);
        },
        // prefixIcon: Icon(Icons.message,size: 30,),
      );

    });
  }
}
