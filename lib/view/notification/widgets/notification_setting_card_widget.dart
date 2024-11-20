import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';

class NotificationSettingCard extends StatelessWidget {
  NotificationSettingCard(
      {super.key,
        required this.title,
        required this.subTitle,
        this.switchValue = false,
        this.onChanged});
  String title, subTitle;
  bool switchValue;
  void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        width: context.mediaQueryWidth,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Transform.scale(
            scale: 0.7,
            child: Switch(
              value: switchValue,
              onChanged: onChanged,
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}