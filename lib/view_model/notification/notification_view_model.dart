import 'package:flutter/material.dart';

class NotificationViewModel with ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _allowNotification = false;
  bool get allowNotification => _allowNotification;

  setAllowNotification(bool value) {
    _allowNotification = value;
    notifyListeners();
  }
  bool _emailNotification = false;
  bool get emailNotification => _emailNotification;

  setEmailNotification(bool value) {
    _emailNotification = value;
    notifyListeners();
  }

  bool _orderNotification = false;
  bool get orderNotification => _orderNotification;

  setOrderNotification(bool value) {
    _orderNotification = value;
    notifyListeners();
  }
  bool _generalNotification = true;
  bool get generalNotification => _generalNotification;

  setGeneralNotification(bool value) {
    _generalNotification = value;
    notifyListeners();
  }

}