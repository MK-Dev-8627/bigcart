import 'package:big_cart/configs/color/color.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../configs/components/custom_textfiled.dart';
import '../../../configs/utils.dart';

class InputNameWidget extends StatelessWidget {
  final FocusNode focusNode, emailFocusNode;
  const InputNameWidget(
      {Key? key, required this.focusNode, required this.emailFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, provider, child) {
      return CustomTextField(
        hintText: 'Name',
        // labelText: 'Email',
        controller: provider.nameController,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        fillColor: Theme.of(context).cardColor,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(context, focusNode, emailFocusNode);
        },
        onChanged: (value) {
          provider.setName(value!);
        },
        prefixIcon: Icon(Icons.account_circle_outlined,size: 30,),
      );

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
