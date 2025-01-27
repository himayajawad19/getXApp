import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_app/controller/product_controller.dart';
import 'package:getx_app/start/product_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xffe5dada),
      appBar: AppBar(
        backgroundColor:  Colors.black,
        title:
       Text(
  "Bazaar",
  style: GoogleFonts.bonaNova(
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  ),
),
leading:   IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Navigate to the search screen
            },
          ),
centerTitle: true,
        actions: [

        
             IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Navigate to the search screen
              },
            )
            ],
      ),
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Featured Products",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                )),
              ),
            ),
        Expanded(
          child: Padding(padding: const EdgeInsets.all(10), 
                child: 
                Obx(
                  ()=> GridView.builder(
                            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,childAspectRatio: 0.9), 
                            itemCount: productController.productList.length,
                  itemBuilder: (context, index){
                            return ProductTile(productController.productList[index]);
                  }),
                )),
        )],)
    );
  }
}