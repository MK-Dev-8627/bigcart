import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:big_cart/model/user/user_model.dart';
import 'package:big_cart/view_model/services/session_manager/session_controller.dart';
import 'package:image_picker/image_picker.dart';

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
  TextEditingController nameController = TextEditingController();
  String _name = '';
  String get name => _name;

  setName(String name) {
    _name = name;
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
//creating getter method to store value of input newPassword
  TextEditingController newPasswordController = TextEditingController();
  String _newPassword = '';
  String get newPassword => _newPassword;

  setNewPassword(String newPassword) {
    _newPassword = newPassword;
  }
//creating getter method to store value of input confirmPassword
  TextEditingController confirmPasswordController = TextEditingController();
  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;

  setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
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
  // File? imageFile;
  File _imageFile = File('');
  File get imageFile => _imageFile;


  Future<void> pickFile(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? xFile = await imagePicker.pickImage(
        imageQuality: 50,
        maxHeight: 400,
        maxWidth: 400,
        preferredCameraDevice: CameraDevice.front,
        source: source);
    if (xFile == null) return;
    _imageFile = File(xFile.path);
    notifyListeners();
  }
}
