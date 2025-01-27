import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_app/models/product.dart';
import 'package:getx_app/service/remote_services.dart';


class ProductController extends GetxController{
 ProductController(){
  fetchproducts();
 }
  var productList = <Product>[].obs;

  void fetchproducts() async{
    log("ProductController");
   var products= await RemoteServices.fetchproducts();
if(products != null){
    log("----->ProductController");
  productList.value = products;
  }}
}