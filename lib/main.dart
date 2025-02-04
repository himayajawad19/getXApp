import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_app/config/routes.dart';
import 'package:getx_app/drawer/home_screen.dart';
import 'package:getx_app/firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     Size designSize = const Size(402, 874);
    return 
    ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Bazaar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        ),
        home: HomeScreen(), // Initial route
        initialRoute: '/splash',
        getPages: appRoutes(),
      ),
    );
  }
}



  