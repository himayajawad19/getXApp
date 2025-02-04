import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginController  extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailPassword(String email, String password, BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.toNamed('/home');
      log(userCredential.user!.email??"");
      return userCredential.user;
    } catch (e) {
      return showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange.withOpacity(0.2),
      contentTextStyle:    TextStyle(
                color: Colors.white,
                fontSize: 16.sp, 
                fontWeight: FontWeight.w500,
              ),
      content: const Text(
        "Invalid user credentials",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();  // Close the dialog
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
        ),
      ],
    );

      },);
    }
  }
}