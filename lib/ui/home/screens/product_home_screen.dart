import 'package:flutter/material.dart';
import 'package:gangapp_flutter/routes/app_pages.dart';
import 'package:gangapp_flutter/ui/home/widgets/product_image.dart';
import 'package:gangapp_flutter/ui/products/controllers/product_controller.dart';
import 'package:gangapp_flutter/ui/theme/color_theme.dart';
import 'package:gangapp_flutter/ui/theme/spaces_theme.dart';
import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Scaffold(
      backgroundColor: Colors.green,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (productController.productsList.value[index].photoUrl !=
                        null)
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: ProductImage(
                            imageUrl: productController
                                .productsList.value[index].photoUrl!,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        width: double.infinity,
                        child: Text(
                            "${productController.productsList.value[index].name}"),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        width: double.infinity,
                        child: Text(
                          "${productController.productsList.value[index].realPrice}",
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              );
            },
            itemCount: productController.productsList.value.length,
          ),
        ),
      ),
    );
  }
}
