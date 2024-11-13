import 'package:big_cart/configs/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../model/address/address_model.dart';

class ShippingViewModel with ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _saveForLater = false;
  bool get saveForLater => _saveForLater;

  setSaveForLater(bool saveForLater) {
    _saveForLater = saveForLater;
    notifyListeners();
  }



  //creating getter method to store value of input email
  TextEditingController nameController = TextEditingController();
  String _name = '';
  String get name => _name;

  setName(String name) {
    _name = name;
    notifyListeners();
  }
  //creating getter method to store value of input email
  TextEditingController emailController = TextEditingController();
  String _email = '';
  String get email => _email;

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  //creating getter method to store value of input email
  TextEditingController phoneController = TextEditingController();
  String _phone = '';
  String get phone => _phone;

  setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }


  //creating getter method to store value of input address
  TextEditingController addressController = TextEditingController();
  String _address = '';
  String get address => _address;

  setAddress(String address) {
    _address = address;
    notifyListeners();
  }
//creating getter method to store value of input zipCode
  TextEditingController zipCodeController = TextEditingController();
  String _zipCode = '';
  String get zipCode => _zipCode;

  setZipCode(String zipCode) {
    _zipCode = zipCode;
    notifyListeners();
  }
//creating getter method to store value of input city
  TextEditingController cityController = TextEditingController();
  String _city = '';
  String get city => _city;

  setCity(String city) {
    _city = city;
    notifyListeners();
  }
  //creating getter method to store value of input country
  TextEditingController countryController = TextEditingController();
  String _country = '';
  String get country => _country;

  setCountry(String country) {
    _country = country;
    notifyListeners();
  }

  //creating getter method to store value of input cardHolderName
  TextEditingController cardHolderNameController = TextEditingController();
  String _cardHolderName = '';
  String get cardHolderName => _cardHolderName;

  setCardHolderName(String cardHolderName) {
    _cardHolderName = cardHolderName;
    notifyListeners();
  }
//creating getter method to store value of input cardNumber
  TextEditingController cardNumberController = TextEditingController();
  String _cardNumber = '';
  String get cardNumber => _cardNumber;

  setCardNumber(String cardNumber) {
    _cardNumber = cardNumber;
    notifyListeners();
  }
  //creating getter method to store value of input monthYear
  TextEditingController monthYearController = TextEditingController();
  String _monthYear = '';
  String get monthYear => _monthYear;

  setMonthYear(String monthYear) {
    _monthYear = monthYear;
    notifyListeners();
  }
//creating getter method to store value of input cvv
  TextEditingController cvvController = TextEditingController();
  String _cvv = '';
  String get cvv => _cvv;

  setCvv(String cvv) {
    _cvv = cvv;
    notifyListeners();
  }

  List<bool> isSelected = [true, false,false];
  List<String> btnLabels = ['PayPal', 'Master Card','Visa Card'];

  void setIsSelected(List<bool> bools){
    isSelected = bools;
    notifyListeners();
  }

  String getSelectedValue() {
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i]) {
        return btnLabels[i];
      }
    }
    return '';
  }

  List<MyAddress> _myAddressList = [];
  List<MyAddress> get myAddressList => _myAddressList;

  setMyAddressList(List<MyAddress> value) {
    _myAddressList = value;
    print('_myAddressList:  $_myAddressList');
    notifyListeners();
  }

  Future<void> fetchMyAddressList() async {
    setLoading(true);
    _myAddressList = [];
    _myAddressList = Constants.myAddressList;
    Future.delayed(const Duration(seconds: 2))
        .then((value) => setLoading(false));

    notifyListeners();
  }

  void showInput(int index){
    final address = _myAddressList.elementAt(index);
    address.toggleShow();
    notifyListeners();
  }

  }
