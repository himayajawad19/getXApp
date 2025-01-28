import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_app/controller/product_controller.dart';
import 'package:getx_app/drawer/shop/shop.dart';
import 'package:getx_app/start/product_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

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
     leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Open the drawer
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
centerTitle: true,
        actions: [

             IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
              onPressed: () {
            Get.toNamed('/shop');
              },
            )
            ],
      ),
         drawer: Drawer(
          width: 300,
        backgroundColor: Colors.black,
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: [
              ListTile(
                title: Text(
                "Bazaar",
                style: GoogleFonts.bonaNova(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

            ListTile(
              title: const Text('Home', style: TextStyle(color: Colors.white),),
              onTap: () {
                Get.toNamed('/home');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Shop', style: TextStyle(color: Colors.white),),
              // selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
              Get.toNamed('/shop');
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact Us', style: TextStyle(color: Colors.white),),

              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        ),
      body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: centerDisplayCard(),
    ),
    Obx(() {
      // Single Obx for both `isProductListEmpty` and `productList`
      if (productController.isProductListEmpty.value) {
        return Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                      enabled: true,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.9,
                          ),
                          itemCount:
                              4, // Placeholder count (e.g., 4 shimmer tiles)
                          itemBuilder: (context, index) {
                            // Placeholder tile for shimmer effect
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ),
                    );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                shrinkWrap: true, // Allow GridView inside Column
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.9,
                ),
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    productController.productList[index],
                  );
                },
              ),
            ),
          ],
        );
      }
    }),
  ],
)
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