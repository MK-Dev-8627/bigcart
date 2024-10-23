import 'package:big_cart/configs/assets/image_assets.dart';
import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';
import '../../../view_model/home/home_view_model.dart';

class InputSearchWidget extends StatelessWidget {
  final FocusNode focusNode;
  const InputSearchWidget({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, child) {
      return CustomTextField(
          hintText: 'Search keywords...',
          controller: provider.searchController,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          onFieldSubmitted: (value) {},
          onChanged: (value) {
            provider.setSearch(value!);
          },
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(ImageAssets.filters),
            ),
          ));

      /*  TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: focusNode,
            decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)
            ),
            onFieldSubmitted: (value){
              Utils.fieldFocusChange(context, focusNode, passwordFocusNode);
            },
            onChanged: (value){
              provider.setEmail(value);
            },
          );*/
    });
  }
}
