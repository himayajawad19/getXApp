import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controller/item_controller.dart';

class Item extends StatelessWidget {
   Item({super.key});
  final ItemController productController = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(80),
          ),
          child: MaterialButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: 
              Obx(
                ()=> Text(
                  "Add to Cart ${'\$'}${productController.item.value.price ??""}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Product Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        
        ),
    automaticallyImplyLeading: true,
       centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
             
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 360,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Obx(() {
  if (productController.item.value.image != null) {
    return Image.network(
      productController.item.value.image!,
      fit: BoxFit.contain,
    );
  } else {
    return const CircularProgressIndicator(color: Color(0x00ffadda),);
  }
}),

                
      
              ),
              ),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: Column(
                 children: [
                   Obx(()=> Text(productController.item.value.category ??"", style: TextStyle(color: Colors.grey.withOpacity(0.7), fontWeight: FontWeight.w500),)),
                   const SizedBox(height: 5,),
                     Obx(
                       ()=> Text(
                        textAlign: TextAlign.center,
                             productController.item.value.title ??"",
                                           style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                                 ),
                     ),
                               const SizedBox(height: 5,),
                               Obx(()
                                 => Text(
                                  textAlign: TextAlign.center,
                                                     productController.item.value.description ??"",
                                                     style: TextStyle(
                                                       
                                                         color: Colors.grey.withOpacity(0.7),
                                                         fontWeight: FontWeight.w400),
                                 ),
                               ),
                 ],
               ),
             ),
              ]),)

    );
  }
}