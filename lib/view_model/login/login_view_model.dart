import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:big_cart/model/user/user_model.dart';
import 'package:big_cart/view_model/services/session_manager/session_controller.dart';

import '../../repository/auth_api/auth_repository.dart';

class LoginViewModel with ChangeNotifier {
  AuthRepository authRepository;
  LoginViewModel({required this.authRepository});

  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;

  setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  //creating getter method to store value of input email
  TextEditingController emailController = TextEditingController();
  String _email = '';
  String get email => _email;

  setEmail(String email) {
    _email = email;
  }

  //creating getter method to store value of input email
  TextEditingController phoneController = TextEditingController();
  String _phone = '';
  String get phone => _phone;

  setPhone(String phone) {
    _phone = phone;
  }

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  setRememberMe(bool rememberMe) {
    _rememberMe = rememberMe;
    notifyListeners();
  }

  //creating getter method to store value of input password
  TextEditingController passwordController = TextEditingController();
  String _password = '';
  String get password => _password;

  setPassword(String password) {
    _password = password;
  }

  Future<UserModel> loginApi(dynamic data) async {
    try {
      setLoginLoading(true);
      // final response = await authRepository.loginApi(data);
      // await SessionController().saveUserInPreference(response);
      // await SessionController().getUserFromPreference();
      setLoginLoading(false);
      return UserModel();
    } catch (e) {
      setLoginLoading(false);
      throw Exception(e);
    }
  }
}
