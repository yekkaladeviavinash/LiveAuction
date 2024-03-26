// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:liveauction/models/productmodel.dart';
import 'package:intl/intl.dart';

import '../models/datemodel.dart';

class Todayauctioncontroller extends GetxController {
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  late CollectionReference productcollection;
  late CollectionReference datecollection;
  List<productmodel> cameproducts = [];
  List<productmodel> todayproduct = [];
  List<datemodel> dateli = [];
  List<dynamic> productids = [];
  // List<productmodel> todaysproducts = [];

  Future<void> onInit() async {
    productcollection = fstore.collection('products');
    datecollection = fstore.collection('dates');
    await gettodayproduct();
    await gettodayproductdate();
    super.onInit();
  }

  gettodayproduct() async {
    String todaydate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(todaydate);
    try {
      QuerySnapshot productsnapshot = await productcollection.get();
      final List<productmodel> retrievedproducts = productsnapshot.docs
          .map((doc) =>
              productmodel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      cameproducts.clear();
      cameproducts.assignAll(retrievedproducts);
      update();
    } catch (e) {
      print("Error shown in todayauction controller ${e}");
    }
    todayproduct = cameproducts
        .where((product) =>
            product.dateAdded == todaydate && product.status == true)
        .toList();
  }

  int getProductIndexandtime(String productId) {
    return getProducttime(productids.indexOf(productId));
  }

  int getProducttime(int n) {
    if (n == 0) return 20;
    if (n == 1) return 20;
    if (n == 2) return 20;
    if (n == 3) return 20;
    if (n == 4) {
      return 20;
    } else {
      return 0;
    }
  }

  gettodayproductdate() async {
    String todaydate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(todaydate);
    try {
      QuerySnapshot datesnapshot = await datecollection.get();
      final List<datemodel> retrieveddates = datesnapshot.docs
          .map((doc) => datemodel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      dateli.clear();
      dateli.assignAll(retrieveddates);
      update();
    } catch (e) {
      print("Error shown in todayauction controller ${e}");
    }
    Iterable<datemodel> today =
        dateli.where((datess) => datess.date == todaydate);
    for (var dateModel in today) {
      // Check if slots exist and add them to productids
      if (dateModel.slots != null) {
        productids.addAll(dateModel.slots);
      }
    }
  }
}
