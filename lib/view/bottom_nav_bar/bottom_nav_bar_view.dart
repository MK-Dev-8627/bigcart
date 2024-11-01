import 'dart:math';

// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../favourite_products/favourite_products.dart';
import '../home/home_view.dart';

class CurvedBottomNavBar extends StatefulWidget {
  @override
  _CurvedBottomNavBarState createState() => _CurvedBottomNavBarState();
}

class _CurvedBottomNavBarState extends State<CurvedBottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      HomeView(),
      Center(
        child: Text('Account'),
      ),
      FavouriteProductsView(),
      Center(
        child: Text('Cart'),
      ),
    ];
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: bottomBarPages[_page],
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          items: <Widget>[
            ImageIcon(AssetImage(ImageAssets.home),
                color: _page == 0 ? AppColors.whiteColor : AppColors.textColor,
                size: 30),
            ImageIcon(AssetImage(ImageAssets.account),
                color: _page == 1 ? AppColors.whiteColor : AppColors.textColor,
                size: 30),
            ImageIcon(AssetImage(ImageAssets.favourite),
                color: _page == 2 ? AppColors.whiteColor : AppColors.textColor,
                size: 30),
            ImageIcon(AssetImage(ImageAssets.cart),
                color: _page == 3 ? AppColors.whiteColor : AppColors.textColor,
                size: 30)
          ],
          color: AppColors.whiteColor,
          buttonBackgroundColor: AppColors.primaryDarkColor,
          backgroundColor: AppColors.backgroundColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ));
    // body: Container(
    //   color: AppColors.backgroundColor,
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(_page.toString(), style: TextStyle(fontSize: 160)),
    //         ElevatedButton(
    //           child: Text('Go To Page of index 1'),
    //           onPressed: () {
    //             final CurvedNavigationBarState? navBarState =
    //                 _bottomNavigationKey.currentState;
    //             navBarState?.setPage(0);
    //           },
    //         )
    //       ],
    //     ),
    //   ),
    // ));
  }
}
