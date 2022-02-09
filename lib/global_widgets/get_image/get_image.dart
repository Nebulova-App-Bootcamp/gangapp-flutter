import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class GetImage {
  late String urlGetImage;
  final AuthController authController = Get.find();
  final picker = ImagePicker();

  Future _uploadFile(BuildContext context, File imageProfile) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/${authController.firestoreUser.value!.uid}');

    print(storageReference);

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    print(uploadTask);

    await uploadTask.whenComplete(
      () {
        storageReference.getDownloadURL().then((url) {
          urlGetImage = url;
          print(url);
          print(urlGetImage);

          // UserModel _updatedUser = UserModel(
          //   uid: authController.firestoreUser.value!.uid,
          //   email: authController.firestoreUser.value!.email,
          //   name: authController.firestoreUser.value!.name,
          //   photoUrl: url,
          // );
          // authController.updateUser(_updatedUser);
        });
      },
    );
  }

  Future _imgFromGallery(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    print(image!.path);
    _uploadFile(context, File(image.path));
  }

  Future _imgFromCamera(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    print(image!.path);

    _uploadFile(context, File(image.path));
  }

  Future showPicker(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Acceder a la galeria"),
                onTap: () {
                  _imgFromGallery(context);
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("Acceder a la cámara"),
                onTap: () {
                  _imgFromCamera(context);
                  Get.back();
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
