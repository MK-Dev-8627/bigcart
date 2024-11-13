import 'package:big_cart/configs/utils.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../configs/assets/image_assets.dart';
import '../../../configs/color/color.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, provider, child) {
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryDarkColor,
                  image: provider.imageFile.path == ''
                      ? const DecorationImage(
                          image: AssetImage(ImageAssets.mkDev),
                        )
                      : DecorationImage(
                          image: FileImage(provider.imageFile),
                          fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: InkWell(
                onTap: () {
                  Utils.showImagePickerDialog(context, galleryTap: () {
                    provider
                        .pickFile(ImageSource.gallery)
                        .then((value) => Navigator.pop(context));
                  }, cameraTap: () {
                    provider
                        .pickFile(ImageSource.camera)
                        .then((value) => Navigator.pop(context));
                  });
                },
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
    });
  }
}
