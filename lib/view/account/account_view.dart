import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../view_model/theme/theme.dart';
import 'widgets/profile_image_widget.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: context.mediaQueryHeight * 0.3,
                width: context.mediaQueryWidth,
                // decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        height: context.mediaQueryHeight * 0.15,
                        width: context.mediaQueryWidth,
                        decoration:
                            BoxDecoration(color: Theme.of(context).cardColor),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: Column(
                        children: [
                          ProfileImageWidget(),
                          20.height,
                          Text(
                            'MK Dev',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'mkdev8627@gmail.com',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.aboutMeView, (route) => true),
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.account),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'About me',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.order),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'My Order',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.favouriteProducts, (route) => true),
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.favourite),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'My Favourite',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.myAddressView, (route) => true),
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.location),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'My Address',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.creditCard),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'Credit Card',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.transactionsView, (route) => true),
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.transactions),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'Transactions',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.notification),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'Notification',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  Consumer<ThemeNotifier>(
                    builder: (key, theme, child) => ListTile(
                      leading: const ImageIcon(
                        AssetImage(ImageAssets.darkMode),
                        color: AppColors.primaryDarkColor,
                      ),
                      title: Text(
                        'Dark Mode',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      trailing: Switch(
                        activeColor: AppColors.primaryColor,
                        value: theme.isDarkMode,
                        onChanged: (value) {
                          theme.onThemeChange(context, value);
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const ImageIcon(
                      AssetImage(ImageAssets.logout),
                      color: AppColors.primaryDarkColor,
                    ),
                    title: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
