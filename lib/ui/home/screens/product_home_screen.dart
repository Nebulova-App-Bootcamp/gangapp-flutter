import 'package:flutter/material.dart';
import 'package:gangapp_flutter/routes/app_pages.dart';
import 'package:gangapp_flutter/ui/products/controllers/product_controler.dart';
import 'package:gangapp_flutter/ui/theme/color_theme.dart';
import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: 40.0,
        ),
        onPressed: () {
          Get.toNamed(Routes.PRODUCTFORM);
        },
      ),
      body: Center(
        child: Column(
          children: [
            Text("Home Product"),
            FloatingActionButton(onPressed: () {
              print(productController.productsList.value.first.description);
              print(productController.productsList.value[1].description);
              print(productController.productsList.value[2].description);
            })
          ],
        ),
      ),
    );
  }
}
