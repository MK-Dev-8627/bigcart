import 'package:flutter/material.dart';

import '../../../configs/assets/image_assets.dart';
import '../../../configs/color/color.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: AppColors.primaryDarkColor, width: 3)),
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryDarkColor,
                  image: DecorationImage(image: AssetImage(ImageAssets.mkDev))),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryDarkColor),
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
                child: const Center(
                  child: ImageIcon(
                    AssetImage(ImageAssets.camera),
                    color: AppColors.primaryDarkColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
