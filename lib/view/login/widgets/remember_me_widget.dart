import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/color/color.dart';
import '../../../view_model/login/login_view_model.dart';

class RememberMeSwitchWidget extends StatelessWidget {
  const RememberMeSwitchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
        builder: (context, provider, child) {
          return Row(
            children: [
              Transform.scale(
                scale: 0.6,
                child: Switch(
                    activeColor: AppColors.primaryDarkColor,
                    value: provider.rememberMe,
                    onChanged: (value) =>
                        provider.setRememberMe(value)),
              ),
              Text(
                'Remember Me',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          );
        });
  }
}