import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view_model/shopping_cart/shopping_cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../configs/components/round_button.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../configs/utils.dart';
import '../../../configs/validator/app_validator.dart';


class MakePaymentButtonWidget extends StatelessWidget {
  const MakePaymentButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartViewModel>(
        builder: (context, provider, child){
          return CustomButton(
            height: 60,
            width: context.mediaQueryWidth,
            title: 'Make Payment',
            // loading: provider.loading ? true : false,
            onPress: (){
                // Navigator.pushNamedAndRemoveUntil(context, RoutesName.shippingView, (route) => true);
            },
          );
        }
    );
  }
}
