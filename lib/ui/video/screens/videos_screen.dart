import 'package:flutter/material.dart';
import 'package:gangapp_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40.0,
        ),
        onPressed: () {
          Get.toNamed(Routes.VIDEOSFORM);
        },
      ),
      body: Center(
        child: Text("Videos Page"),
      ),
    );
  }
}
