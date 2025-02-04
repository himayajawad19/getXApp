import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/product.dart';
import 'package:getx_app/utils/app_constants.dart';


class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){  AppConstants.id= product.id;
        Get.toNamed('/item', );},
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
      
                    child: Image.network(
                      product.image ,
                      fit: BoxFit.contain,
                    ),
                  ),
             SizedBox(height: 8.h),
              Text(
                product.title,
                maxLines: 2,
                style:
                    TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w400, fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
              ),
             SizedBox(height: 8.h),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff840032),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${'\$'}${product.price.toString() ??""}",
                          style: TextStyle(color: Colors.white,fontSize: 13.sp),
                        ),
                       
                      ],
                    ),
                  ),
                     SizedBox(width: 2.w),
                     
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE59500),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.shopping_bag_outlined,color: Colors.white, size: 18.sp),
                            Text(
                              "Buy",
                              style: TextStyle(color: Colors.white, fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
