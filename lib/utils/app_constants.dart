
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

static int id=0;
static getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
static getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
