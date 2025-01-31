import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Bazaar",
          style: GoogleFonts.bonaNova(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
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
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Get.toNamed('/shop');
            },
          )
        ],
      ),
      drawer: GFDrawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffE59500), Color(0xff02040F), Color(0xffe5dada)],
              stops: [0.1, 1.9, 0.3],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ListTile(
                  title: Text(
                    "Bazaar",
                    style: GoogleFonts.bonaNova(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  onTap: null,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ListTile(
                        leading: const Icon(Icons.home,
                            size: 27, color: Colors.white),
                        title: const Text('Home',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        onTap: () {
                          Get.toNamed('/home');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ListTile(
                          leading: const Icon(Icons.shopping_bag_rounded,
                              size: 27, color: Colors.white),
                          title: const Text('Shop',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          onTap: () => Get.toNamed('/shop')),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ListTile(
                        leading:
                            Icon(Icons.phone, size: 27, color: Colors.white),
                        title: Text('Contact Us',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        onTap: null,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                  color: Colors.white70,
                  thickness: 1,
                  indent: 15,
                  endIndent: 15),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListTile(
                  leading: Icon(Icons.settings, size: 27, color: Colors.white),
                  title: Text('Settings',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  onTap: null,
                ),
              ),
              const Divider(
                  color: Colors.white70,
                  thickness: 1,
                  indent: 15,
                  endIndent: 15),
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 20),
                child: ListTile(
                  leading: Icon(Icons.logout, size: 27, color: Colors.white),
                  title: Text('Log Out',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  onTap: null,
                ),
              ),
            ],
          ),
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