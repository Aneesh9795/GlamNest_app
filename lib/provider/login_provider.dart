import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  String selectedMode = 'phone'; // default value
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  // Properly implemented getters:
  bool get isPhoneSelected => selectedMode == 'phone';
  bool get isEmailSelected => selectedMode == 'email';

  void changeMode(String mode) {
    selectedMode = mode;
    notifyListeners();
  }

  void clearInput() {
    phoneController.clear();
    emailController.clear();
    notifyListeners();
  }

  void sendOtp() {
    if (selectedMode == 'phone') {
      print('Sending OTP to phone: ${phoneController.text}');
    } else {
      print('Sending OTP to email: ${emailController.text}');
    }
  }
}
