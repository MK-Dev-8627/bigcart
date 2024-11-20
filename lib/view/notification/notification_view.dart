import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/notification/widgets/save_setting_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/assets/image_assets.dart';
import '../../configs/components/custom_appbar.dart';
import '../../configs/routes/routes_name.dart';
import '../../view_model/notification/notification_view_model.dart';
import 'widgets/notification_setting_card_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notification',
        autoImplyLeading: true,
      ),
      body: SafeArea(
        child: Consumer<NotificationViewModel>(
          builder: (context, provider, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                NotificationSettingCard(
                  title: 'Allow Notification',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  switchValue: provider.allowNotification,
                  onChanged: (value) {
                    provider.setAllowNotification(value);
                  },
                ),
                NotificationSettingCard(
                  title: 'Email Notification',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  switchValue: provider.emailNotification,
                  onChanged: (value) {
                    provider.setEmailNotification(value);
                  },
                ),
                NotificationSettingCard(
                  title: 'Order Notification',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  switchValue: provider.orderNotification,
                  onChanged: (value) {
                    provider.setOrderNotification(value);
                  },
                ),
                NotificationSettingCard(
                  title: 'General Notification',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym',
                  switchValue: provider.generalNotification,
                  onChanged: (value) {
                    provider.setGeneralNotification(value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: SaveSettingButtonWidget(),
      ),
    );
  }
}


