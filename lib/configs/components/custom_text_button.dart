import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      this.textColor = AppColors.linkColor,
      required this.title,
      required this.onPress,
      this.loading = false})
      : super(key: key);

  final bool loading;
  final String title;
  final VoidCallback onPress;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(
            color: textColor,
          ))
        : Center(
            child: TextButton(
            onPressed: onPress,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: textColor),
            ),
          ));
  }
}
