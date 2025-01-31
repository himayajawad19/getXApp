
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Initially hidden

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0; 
      });
     
    });
     Future.delayed(const Duration(seconds: 4), () {
      Get.toNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffE59500), Color(0xff02040F), Color(0xffe5dada)],
              stops: [0.1, 1.9, 0.3],
            ),
          ),
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1), 
              opacity: _opacity,
              child: Text(
                "Bazaar",
                style: GoogleFonts.bonaNova(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

