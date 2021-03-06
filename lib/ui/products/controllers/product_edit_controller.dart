import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/product_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service_products.dart';
import 'package:get/get.dart';

class ProductEditController extends GetxController {
  TextEditingController nameProduct = TextEditingController();
  TextEditingController originalPrice = TextEditingController();
  TextEditingController realPrice = TextEditingController();
  TextEditingController descriptionProduct = TextEditingController();
  DataBaseProducts dataBaseProducts = DataBaseProducts();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var urlImage = ''.obs;
  var pathImage = ''.obs;
  var productUid = ''.obs;

  Future<bool> createProduct(ProductModel product) async {
    return dataBaseProducts.createNewProduct(product);
  }

  var dropdownValue = ''.obs;
}
