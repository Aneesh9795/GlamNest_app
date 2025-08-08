import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamnest_app/Screen/home_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose () {
    otpController.dispose();
    super.dispose();
  }

  void verifyotp() {
    Navigator.pushReplacement(
        context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' OTP Screen',
        style: TextStyle(color: Colors.white),
      ),
        centerTitle: true,
        backgroundColor: Color(0xFF003133),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyotp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF003133),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              child: const Text('Verify OTP',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
