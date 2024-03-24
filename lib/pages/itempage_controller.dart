import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  late CollectionReference productcollection;
  late CollectionReference usercollection;
  FirebaseFirestore fStore = FirebaseFirestore.instance;

  @override
  void onInit() {
    productcollection = fStore.collection('products');
    usercollection= fStore.collection('users');
    super.onInit();
  }

  Future<void> registerUser(String? pid) async {
    try {
      if (pid != null) {
        await productcollection.doc(pid).update({
          'registeredusers': FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
        });
        await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
          'auctionhistory': FieldValue.arrayUnion([pid]),
        });
        Get.snackbar('Success', 'Registered successfully', colorText: Colors.green);
      } else {
        throw Exception("Product ID is null");
      }

    } catch (e) {
      print("Error in ItemController registerUser: $e");
      Get.snackbar('Error', 'Failed to register', colorText: Colors.red);
    }
  }


  Future<void> addtowishlist(String? pid) async {
    try {
      if (pid != null) {
        await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
          'wishlist': FieldValue.arrayUnion([pid]),
        });
        Get.snackbar('Success', 'Added to wishlist successfully', colorText: Colors.green);
      } else {
        throw Exception("Product ID is null");
      }

    } catch (e) {
      print("Error in ItemController2 registerUser: $e");
      Get.snackbar('Error', 'Failed to register', colorText: Colors.red);
    }
  }
}
