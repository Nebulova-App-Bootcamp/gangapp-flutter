import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gangapp_flutter/models/user_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service.dart';

class DatabaseUsers {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String _collection = "users";
  static FirestoreService _service = FirestoreService(_collection);

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.uid!).set({
        "uid": user.uid,
        "email": user.email,
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static mergeUserData(UserModel user) {
    Map<String, dynamic> data = {
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "photoURL": user.photoUrl,
    };
    _service.merge(user.uid!, data);
  }
}
