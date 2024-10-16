import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:big_cart/model/user/user_model.dart';
import 'package:big_cart/view_model/services/session_manager/session_controller.dart';

import '../../repository/auth_api/auth_repository.dart';

class SignupViewModel with ChangeNotifier {
  AuthRepository authRepository;
  SignupViewModel({required this.authRepository});

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setSignupLoading(bool value) {
    _signupLoading = value;
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

  clearFormData(){
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      setSignupLoading(true);
      Timer(const Duration(seconds: 10), () {
        clearFormData();
        return data;});
      setSignupLoading(false);
    } catch (e) {
      setSignupLoading(false);
      throw Exception(e);
    }
  }
}
