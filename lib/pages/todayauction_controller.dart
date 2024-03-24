import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:liveauction/models/productmodel.dart';
import 'package:intl/intl.dart';

class Todayauctioncontroller extends GetxController {
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  late CollectionReference productcollection;
  List<productmodel>cameproducts=[];
  List<productmodel> todayproduct = [];

  Future<void> onInit()async{
    productcollection=fstore.collection('products');
    await gettodayproduct();
    super.onInit();
  }

  gettodayproduct()async{
    String todaydate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    print(todaydate);
  try {
  QuerySnapshot productsnapshot=await productcollection.get();
  final List<productmodel>retrievedproducts=productsnapshot.docs.map((doc) => productmodel.fromJson(doc.data() as Map<String,dynamic>)).toList();
  cameproducts.clear();
  cameproducts.assignAll(retrievedproducts);
  update();
} catch (e) {
  print("Error shown in todayauction controller ${e}");
}
  todayproduct =cameproducts.where((product) => product.dateAdded==todaydate && product.status==true).toList();
  }
}
