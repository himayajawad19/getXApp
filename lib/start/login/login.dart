import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/controller/login_controller.dart';
import 'package:getx_app/utils/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
 Login({super.key});
final LoginController loginController= Get.put(LoginController());
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: AppConstants.getScreenHeight(context),
                  child: Stack(
                    children: [    
                          Positioned(
                            top: 120.h,
                            left: 130.w,
                            child: Text(
                              "Bazaar",
                              style: GoogleFonts.bonaNova(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 45.sp,
                                ),
                              ),
                            ),
                          ),
                           SizedBox(height: 50.h),
                         Positioned(
                            top: 220.h,
                            child: Container(
                              height:
                                  AppConstants.getScreenHeight(context) * 0.8,
                              width: AppConstants.getScreenWidth(context) ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.4), // Shadow color
                                    blurRadius: 20, // Spread of the shadow
                                    offset: const Offset(0, 4), // Shadow position
                                  ),
                                ],
                                gradient: LinearGradient(
        colors: [
          Colors.black.withOpacity(0.78), 
          Colors.black.withOpacity(0),   
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 28),
                                child: Column(children: [
                                  Text("Welcome Back!", style: TextStyle(
                                  color: Colors.white60, 
                                  fontWeight: FontWeight.w500, 
                                  fontSize: 28.sp),
                                  
                                  ), 
                                  SizedBox(height: 8.h,),
                                  Text("Enter your details below", style: TextStyle(
                                  color: Colors.white60, 
                                  fontWeight: FontWeight.w400, 
                                  fontSize: 16.sp),
                                  ),
                                   SizedBox(
                                      height: 60.h,
                                    ),
                                TextField(
                                  style: const TextStyle(color: Colors.white60),
                                  controller: loginController.emailController,
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                         labelStyle: const TextStyle(
                                            color: Colors.white60),
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[600]),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                         
                                        ),
                                        
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.white60, // Focused border color
                                            width: 1,
                                          ),
                                        ),
                            
                                        contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical:
                                                12), // Padding inside the TextField
                                      ),
                                    )
                                    ,
                                   SizedBox(height: 20.h,),
                                   TextField(
                                    controller: loginController.passwordController,
                                    style: const TextStyle(
                                          color: Colors.white60),
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle:  const TextStyle(color: Colors.white60),
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[600]),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors
                                                .white60, // Focused border color
                                            width: 1,
                                          ),
                                        ),
                                        suffixIcon: const Icon(Icons.remove_red_eye),
                                        contentPadding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 16,
                                            vertical:
                                                12), 
                                                // Padding inside the TextField
                                      ),
                                      
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Align(
  alignment: Alignment.bottomRight,
  child: TextButton(
    onPressed: () {
      // Your action when the button is pressed
    },
    child: const Text(
      "Forgot Password?",
      style: TextStyle(color: Colors.white60),
    ),
  ),
)
,
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                     Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(183, 229, 149, 0),
            borderRadius: BorderRadius.circular(30),
          ),
          child: MaterialButton(
            onPressed: (){ 
              loginController.signInWithEmailPassword(loginController.emailController.text, loginController.passwordController.text, context);
},
            child:  Padding(
              padding: const EdgeInsets.all(16.0),
              child: 
              Text(
                  "Login",
                  style: TextStyle(color: Colors.white60, fontSize: 18.sp),
              
              ),
            ),
          ),),
                                  ],),
                              ),
                            ),
                          )
                          
                        ],),
                ),
              ],
            )
          )
        )));
  }
}