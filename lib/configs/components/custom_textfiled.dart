
import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final int maxLines, minLines;
  final double borderRadius;
  bool obscureText;
  bool isCircular;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  void Function(String?)? onChanged;
  void Function(String?)? onFieldSubmitted;
  TextInputType? keyboardType;
  Color? fillColor =  AppColors.backgroundColor;

  CustomTextField({
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.isCircular = true,
    this.fillColor,
    this.maxLines = 5,
    this.minLines = 1,
    this.borderRadius = 5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: obscureText?1:maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        hintText: hintText,
        fillColor: fillColor,
        filled: true,
        border: isCircular
            ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none
            )
            : null,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 2,
            )
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
