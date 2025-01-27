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
    return
     Scaffold(
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
    body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: centerDisplayCard(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Featured Products",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: productController.productList.isEmpty
                    ? const Center(child: Text("No data found"))
                    : Obx(
                        () => GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: productController.productList.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                                productController.productList[index]);
                          },
                        ),
                      ),
              ),
            ],
          ),
        )
    );
  }

Widget centerDisplayCard() {
    return SizedBox(
      height: 200, // Set a fixed height for the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: productController.imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200, // Make sure the height matches the SizedBox height
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(productController.imageUrls[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}