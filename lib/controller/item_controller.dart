
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_app/models/single_product.dart';
import 'package:getx_app/service/remote_services.dart';

class ItemController extends GetxController{
  var item = SingleProduct().obs;
     var isProductListEmpty = false.obs;
    
    void fetchproduct() async {
    var products = await RemoteServices.fetchitem();
    if (products != null) {
      item.value = products;
       isProductListEmpty.value = true;
      log(item.value.toString());
    } else {
       isProductListEmpty.value = true;
     log("An error occurred while fetching");
    }
  }
    @override
  void onInit() {
    super.onInit();
    fetchproduct(); // Fetch product when controller initializes
  }
}