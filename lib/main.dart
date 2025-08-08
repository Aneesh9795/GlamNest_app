import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamnest_app/Screen/login_screen.dart';
import 'package:glamnest_app/provider/login_provider.dart';
import 'package:provider/provider.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
   return  MultiProvider(
     providers : [
       ChangeNotifierProvider(create: (_) => LoginProvider()),
     ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: const LoginScreen(),
     )
   );
  }
}