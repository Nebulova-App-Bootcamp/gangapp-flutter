import 'package:get/get.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service_products.dart';
import 'package:gangapp_flutter/models/product_model.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> productsList = Rx<List<ProductModel>>([]);
  @override
  void onReady() {
    productsList.bindStream(DataBaseProducts().productsStream());
    super.onReady();
  }
}
