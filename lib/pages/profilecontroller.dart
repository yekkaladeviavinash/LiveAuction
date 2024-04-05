import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveauction/models/datemodel.dart';
import 'package:liveauction/models/productmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:liveauction/models/usermodel.dart';

class Profilecontroller extends GetxController {
  final curruser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  late CollectionReference productcollection;
  late CollectionReference usercollection;
  late CollectionReference datecollection;
  List<productmodel> cameproducts = [];
  List<productmodel> sellerproductslist = [];
  List<dynamic> sellerhis = [];
  List<dynamic> wishlt = [];
  List<dynamic> aucthis = [];
  List<productmodel> sellerProducts = [];
  List<productmodel> sellerwishlist = [];
  List<productmodel> sellerAuctionHistory = [];

  List<usermodel> userslist = [];

  Future<void> onInit() async {
    productcollection = fstore.collection('products');
    usercollection = fstore.collection('users');
    await getsellerproducts();
    super.onInit();
  }

  getsellerproducts() async {
    try {
      QuerySnapshot productsnapshot = await productcollection.get();
      final List<productmodel> retrievedproducts = productsnapshot.docs
          .map((doc) =>
              productmodel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      cameproducts.clear();
      cameproducts.assignAll(retrievedproducts);
      QuerySnapshot usersnapshot = await usercollection.get();
      final List<usermodel> retrievedusers = usersnapshot.docs.map((doc) {
        final userData = doc.data();
        if (userData != null) {
          // print(userData as Map<String, dynamic>);
          return usermodel.fromJson(userData as Map<String, dynamic>);
        } else {
          throw Exception('Document data is null');
        }
      }).toList();

      userslist.clear();
      userslist.assignAll(retrievedusers);
      update();
    } catch (e) {
      print("Error shown in seller controller ${e}");
    }
    
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser.toString());
      Iterable<usermodel> curruser = userslist
          .where((user) => user.uid == FirebaseAuth.instance.currentUser!.uid);
      // sellerhis = curruser.first.sellerhistory!;
      sellerhis = curruser.firstOrNull?.sellerhistory ?? [];

      // wishlt = curruser.first.wishlist!;
      wishlt = curruser.firstOrNull?.wishlist?? [];

      // aucthis = curruser.first.auctionhistory!;
      
      aucthis = curruser.firstOrNull?.auctionhistory ?? [];

      sellerproductslist = cameproducts
          .where((product) =>
              product.sid == FirebaseAuth.instance.currentUser!.uid)
          .toList();

      List<String> sellerHistory = sellerhis.cast<String>();
      List<String> WishList = wishlt.cast<String>();
      List<String> auctionHistory = aucthis.cast<String>();
      sellerProducts = cameproducts
          .where((product) => sellerHistory.contains(product.pid))
          .toList();
      sellerwishlist = cameproducts
          .where((product) => WishList.contains(product.pid))
          .toList();
      sellerAuctionHistory = cameproducts
          .where((product) => auctionHistory.contains(product.pid))
          .toList();
    } else {
      // Handle the case when the user is not logged in
      print("User is not logged in");
    }

    // Iterable<usermodel> curruser = userslist
    //     .where((user) => user.uid == FirebaseAuth.instance.currentUser!.uid);
  }


Future<void> deleteProductfromwishlist(String id) async {
    // await productCollection.doc(id).delete();
    print("hellooooooooo");
  }

  refreshPage() async {
    await getsellerproducts();
    update();
  }



}
