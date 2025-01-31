import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_app/models/product.dart';
import 'package:getx_app/service/remote_services.dart';


class ProductController extends GetxController{
  var productList = <Product>[].obs;
  var isProductListEmpty = false.obs;
  var list = <String>[].obs;
   
 
  void fetchproducts() async{
  isProductListEmpty.value = true;
   var products= await RemoteServices.fetchproducts();
    if(products != null){
      log("Fetched products: ${products.length}");
      productList.value = products;
      isProductListEmpty.value = false;
     list.value = products.map((items){return items.title;}).toList();

    }
    else{
      isProductListEmpty.value = true;
    }
  }

  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1557167668-6eb71e76b603?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z3VjY2l8ZW58MHwwfDB8fHww',
    'https://images.unsplash.com/photo-1624796037770-c57cb79a567a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Z3VjY2l8ZW58MHwwfDB8fHww',
    'https://images.unsplash.com/photo-1609178016676-dfbdbdeaddbb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNoYW5uZWx8ZW58MHwwfDB8fHww',
    'https://images.unsplash.com/photo-1588992370249-1b0fcaf6249b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGRpb3J8ZW58MHwwfDB8fHww',
    'https://images.unsplash.com/photo-1622127209712-358cd618abd5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGRpb3J8ZW58MHwwfDB8fHww',
  ];

 

    @override
  void onInit() {
    super.onInit();
    fetchproducts(); // Automatically fetch products when the controller initializes
  }
}