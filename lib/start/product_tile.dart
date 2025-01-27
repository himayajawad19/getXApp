import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/models/product.dart';


class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            const SizedBox(height: 8),
            Text(
              product.title,
              maxLines: 2,
              style:
                  const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w400, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
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
                    "${'\$'}${product.price.toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                 
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
