import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_app/config/routes.dart';
import 'package:getx_app/start/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bazaar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: HomeScreen(), // Initial route
      initialRoute: '/splash',
      getPages: appRoutes(),
    );
  }
}



  