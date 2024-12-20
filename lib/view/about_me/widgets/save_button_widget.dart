import 'package:big_cart/configs/extensions.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../configs/components/round_button.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../configs/utils.dart';
import '../../../configs/validator/app_validator.dart';


class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
        builder: (context, provider, child){
          return CustomButton(
            height: 60,
            width: context.mediaQueryWidth,
            title: 'Save',
            loading: provider.loginLoading ? true : false,
            onPress: (){

              // if(provider.email.isEmpty){
              //   Utils.flushBarErrorMessage('Please enter email', context);
              // }else if(!AppValidator.emailValidator(provider.email.toString())){
              //   Utils.flushBarErrorMessage('Please enter valid email', context);
              // }else if(provider.password.isEmpty){
              //   Utils.flushBarErrorMessage('Please enter password', context);
              // }else if(provider.password.length < 6){
              //   Utils.flushBarErrorMessage('Please enter 6 digit password', context);
              // }else {
              //
              //
              //   Map data = {
              //     'email' : provider.email.toString(),
              //     'password' : provider.password.toString(),
              //   };
              //
              //   // Map data = {
              //   //   'email' : 'eve.holt@reqres.in',
              //   //   'password' : 'cityslicka',
              //   // };
              //
              // // provider.loginApi(data).then((value){
              // //   Navigator.pushNamed(context, RoutesName.home);
              // // }).onError((error, stackTrace){
              // //   Utils.flushBarErrorMessage(error.toString(), context);
              // // });
              //   Navigator.pushNamed(context, RoutesName.home);
              // }
            },
          );
        }
    );
  }
}
