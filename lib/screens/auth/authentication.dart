
import 'package:ecommerce_int2/screens/auth/login.dart';
import 'package:ecommerce_int2/screens/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  Authentication({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return const MainPage();
    } else {
      return const LoginPage();
    }
  }
}
