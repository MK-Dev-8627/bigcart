import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view_model/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../configs/components/round_button.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../configs/utils.dart';
import '../../../configs/validator/app_validator.dart';


class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupViewModel>(
        builder: (context, provider, child){
          return CustomButton(
            height: 60,
            width: context.mediaQueryWidth,
            title: 'Sign up',
            loading: provider.signupLoading ? true : false,
            onPress: (){
              print('**************************');
              print("email: ${provider.email} , phone: ${provider.phone} , password: ${provider.password}");

              if(provider.email.isEmpty){
                Utils.flushBarErrorMessage('Please enter email', context);
              }else if(!AppValidator.emailValidator(provider.email.toString())){
                Utils.flushBarErrorMessage('Please enter valid email', context);
              }else if(provider.phone.isEmpty){
                Utils.flushBarErrorMessage('Please enter phone', context);
              }else if(provider.password.isEmpty){
                Utils.flushBarErrorMessage('Please enter password', context);
              }else if(provider.password.length < 6){
                Utils.flushBarErrorMessage('Please enter 6 digit password', context);
              }else {


                Map data = {
                  'email' : provider.email.toString(),
                  'phone' : provider.phone.toString(),
                  'password' : provider.password.toString(),
                };

                // Map data = {
                //   'email' : 'eve.holt@reqres.in',
                //   'password' : 'cityslicka',
                // };

              provider.signupApi(data).then((value){
                print(data.toString());
                // Navigator.pushNamed(context, RoutesName.login);
                Utils.toastMessage('Successfully registered!');
              }).onError((error, stackTrace){
                Utils.flushBarErrorMessage(error.toString(), context);
              });

              }
            },
          );
        }
    );
  }
}
