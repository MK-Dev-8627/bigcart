import 'package:flutter/material.dart';
import '../color/color.dart';

//custom round button component, we will used this widget show to show button
// this widget is generic, we can change it and this change will appear across the app
class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  final double? height, width;
  CustomButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.height = 60,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            // color: AppColors.buttonColor,
            gradient: AppColors.buttonGradient,
            boxShadow: [
              AppColors.buttonShadow,
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.whiteColor),
                    // style: const TextStyle(color: AppColors.whiteColor),
                  )),
      ),
    );
  }
}
