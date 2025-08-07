import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool isEmailSelected  = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    double fieldWidth = MediaQuery.of(context).size.width *0.85;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Center(
            child: Text("Welcome To GlamNest",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        isEmailSelected = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isEmailSelected ? Colors.white:Colors.blue,
                    ),
                    child: Text("Phone Number"),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: fieldWidth  / 2 - 5,
               child:  ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isEmailSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isEmailSelected ? Colors.blue: Colors.white,
                  ),
                  child: Text("Email"),
                ),
                ),
              ],
            ),
            SizedBox(height: 30),
            isEmailSelected
            ? TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            )
            : SizedBox(
            width: 300,
                child:TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: "Enter your phone number ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    prefixIcon: Icon(Icons.phone)
                  ),
                ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: fieldWidth,
                child: ElevatedButton(
              onPressed: (){
              String value = isEmailSelected
                  ? _emailController.text
                  : _phoneController.text;
              print("User entered: $value");
            },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                child: Text("Send OTP",style: TextStyle(color: Colors.white),),

            ),
            )
          ],
        ),
      ),
    );
  }
}
