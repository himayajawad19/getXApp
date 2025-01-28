import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_app/controller/product_controller.dart';
import 'package:getx_app/start/product_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Shop extends StatelessWidget {
   Shop({super.key});
    final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xffe5dada),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
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
            icon: const Icon(Icons.search, color: Colors.white),
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
              // selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              // selected: _selectedIndex == 0,
              onTap: () {
                Get.toNamed('/home');
                // _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Shop',
                style: TextStyle(color: Colors.white),
              ),
              // selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                Get.toNamed('/shop');
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.white),
              ),
              // selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app

                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
  
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
                            "All Products",
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
                            physics:
                                const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                            shrinkWrap: true, // Allow GridView inside Column
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
            )),
    );
  }
}