import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldWidth = MediaQuery.of(context).size.width * 0.85;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Welcome to GlamNest",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 40),

                /// Toggle buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: textFieldWidth / 2 - 8,
                      child: ElevatedButton(
                        onPressed: () {
                          loginProvider.changeMode('phone');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: loginProvider.isPhoneSelected
                              ? Colors.blue
                              : Colors.white,
                          foregroundColor: loginProvider.isPhoneSelected
                              ? Colors.white
                              : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Phone"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: textFieldWidth / 2 - 8,
                      child: ElevatedButton(
                        onPressed: () {
                          loginProvider.changeMode('email');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: loginProvider.isPhoneSelected
                              ? Colors.white
                              : Colors.blue,
                          foregroundColor: loginProvider.isPhoneSelected
                              ? Colors.black
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Email"),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Conditional TextField
                SizedBox(
                  width: textFieldWidth,
                  child: TextField(
                    controller: loginProvider.isPhoneSelected
                        ? loginProvider.phoneController
                        : loginProvider.emailController,
                    keyboardType: loginProvider.isPhoneSelected
                        ? TextInputType.phone
                        : TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: loginProvider.isPhoneSelected
                          ? "Enter your phone number"
                          : "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// Send OTP Button
                SizedBox(
                  width: textFieldWidth,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      loginProvider.sendOtp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
