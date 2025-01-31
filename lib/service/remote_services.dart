import 'package:getx_app/models/product.dart';
import 'package:getx_app/models/single_product.dart';
import 'package:getx_app/utils/app_constants.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static var client = http.Client();

static Future<List<Product>?> fetchproducts() async {
var response = await client.get(Uri.parse(
        'https://fakestoreapi.com/products?limit=1000'));
          if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<SingleProduct?> fetchitem() async {
    var response = await client
        .get(Uri.parse('https://fakestoreapi.com/products/${AppConstants.id}'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return singleProductFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}