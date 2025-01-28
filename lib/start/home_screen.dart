import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getx_app/controller/product_controller.dart';
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
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor:  Colors.white,
        title:
       Text(
  "Bazaar",
  style: GoogleFonts.bonaNova(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 30,
    ),
  ),
),

automaticallyImplyLeading: false,
        actions: [

           
            
             IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
              onPressed: () {
            Get.toNamed('/shop');
              },
            )
            ],
      ),
      
      drawer: GFDrawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: const <Widget>[
      ListTile(
        title: Text('Item 1'),
        onTap: null,
      ),
      ListTile(
         title: Text('Item 2'),
         onTap: null,
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
  GFSearchBar(
            searchList: productController.list,
            searchQueryBuilder: (query, list) {
              return list
                  .where((item) =>
                      item?.toLfowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            overlaySearchListHeight: 150,
            overlaySearchListItemBuilder: (item) {    
              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
            searchBoxInputDecoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.only(left: 28),
              filled: true,
              fillColor: Colors.grey.shade100,

              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 24.0, left: 16.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),

              ),
            ),
            onItemSelected: (item) {
              // setState(() {
              //   print('$item');
              // });
            },
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
  
  if (productController.imageUrls.isEmpty) {
      return const Center(child: Text("No images available"));
    }
    else {
    return
      GFCarousel(
        autoPlay: true,
    autoPlayInterval: const Duration(milliseconds: 5000),
    autoPlayCurve: Curves.decelerate,
        aspectRatio: 1.7769,
        scrollPhysics: const BouncingScrollPhysics(),
    items:productController.imageUrls.map(
     (url) {
     return 
     Container(
       margin: const EdgeInsets.all(6.0),
       child: ClipRRect(
         borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
             url,
             fit: BoxFit.cover,
              // width: 6000
           ),
        ),
      );
      },
     ).toList(),
    // onPageChanged: (index) {
    //     Obx(()=>  index);
    //   // setState(() {
   
    //   // });
    // }
    );
  }
}

}