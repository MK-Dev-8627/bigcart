import 'package:flutter/material.dart';

import '../assets/image_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final Widget? leading;
  final Widget? center;
  final bool autoImplyLeading;
  final List<Widget>? actionWidgets;
  const CustomAppBar({
    Key? key,
    this.title,
    this.center,
    this.leading,
    this.actionWidgets,
    this.centerTitle = true,
    this.autoImplyLeading = false,
    this.leadingWidth = 70,
    this.appbarHeight = 70,
  }) : super(key: key);
  final bool centerTitle;
  final double? leadingWidth;
  final double appbarHeight;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: autoImplyLeading,
      leadingWidth: leadingWidth,
      leading: autoImplyLeading ?  null : Padding(
        padding:  const EdgeInsetsDirectional.only(start: 20),
        child: leading,
      ),
      title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: center ??
              Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  // style: TxtStyle.appbarTitleStyle,
                  style:  Theme.of(context).textTheme.titleLarge,
              )
      ),
      actions: actionWidgets,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(appbarHeight);
}

