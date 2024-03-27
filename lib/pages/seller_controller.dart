// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveauction/models/datemodel.dart';
import 'package:liveauction/models/productmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:liveauction/models/productmodel.dart';
import 'package:intl/intl.dart';

// import '../models/datemodel.dart';

class Sellercontroller extends GetxController {
  final curruser = FirebaseAuth.instance.currentUser;
  final item_name = TextEditingController();
  final description = TextEditingController();
  final base_price = TextEditingController();
  final item_image = TextEditingController();
  String item_category = '';
  DateTime? datechosen;
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  late CollectionReference productcollection;
  late CollectionReference usercollection;
  late CollectionReference datecollection;
  List<datemodel> alldates = [];
  List<productmodel> cameproducts = [];
  List<productmodel> productsshowinui1 = [];
  List<productmodel> productsshowinui2 = [];
  List<productmodel> productsshowinui3 = [];
  List<productmodel> productsshowinui4 = [];
  List<productmodel> productsshowinui5 = [];
  List<productmodel> productsshowinui6 = [];
  List<productmodel> productsshowinui7 = [];

  Future<void> onInit() async {
    // if(selectedcategory!=''){
    productcollection = fstore.collection('products');
    usercollection = fstore.collection('users');
    datecollection = fstore.collection('dates');
    // }
    await getproduct();
    await fillAllDatesList();
    await setValuesDefault();
    super.onInit();
  }

  addproduct() async {
    if (item_category != '') {
      DocumentReference doc = productcollection.doc();
      // DocumentReference date=productcollection.doc();
      productmodel myproduct = productmodel(
          pname: item_name.text.trim(),
          pdesc: description.text.trim(),
          pprice: base_price.text.trim(),
          sid: FirebaseAuth.instance.currentUser!.uid,
          pid: doc.id,
          pimage: item_image.text.trim(),
          pcategory: item_category,
          status: false,
          registeredusers: [],
          dateAdded: datechosen.toString().substring(0, 10));
      final myproductjson = myproduct.toJson();
      doc.set(myproductjson);
      try {
        await usercollection
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'sellerhistory': FieldValue.arrayUnion([doc.id]),
        });
        addSlot(datechosen.toString().substring(0, 10), doc.id);
      } catch (e) {
        print("Error in seller controller add product document: $e");
      } finally {
        setValuesDefault();
      }

      Get.snackbar('Success', 'added succesfully', colorText: Colors.green);
    } else {
      print('this is null given by sellercontroller add product');
    }
  }

  getproduct() async {
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
      print("Error shown in seller controller ${e}");
    }
    productsshowinui1 = cameproducts
        .where((product) =>
            product.pcategory == 'collectibles' && product.status == true)
        .toList();
    productsshowinui2 = cameproducts
        .where((product) =>
            product.pcategory == 'antiques' && product.status == true)
        .toList();
    productsshowinui3 = cameproducts
        .where(
            (product) => product.pcategory == 'art' && product.status == true)
        .toList();
    productsshowinui4 = cameproducts
        .where((product) =>
            product.pcategory == 'electronics' && product.status == true)
        .toList();
    productsshowinui5 = cameproducts
        .where(
            (product) => product.pcategory == 'books' && product.status == true)
        .toList();
    productsshowinui6 = cameproducts
        .where(
            (product) => product.pcategory == 'sport' && product.status == true)
        .toList();
    productsshowinui7 = cameproducts
        .where((product) =>
            product.pcategory == 'others' && product.status == true)
        .toList();
  }

  Future<void> fillAllDatesList() async {
    try {
      // Query Firestore for all documents in the "dates" collection
      QuerySnapshot datesSnapshot = await fstore.collection('dates').get();
      // Map each document to a YourModel object and add it to the alldates list
      alldates = datesSnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return datemodel(
          id: doc.id,
          date: data['date'] ??
              '', // Assuming date is stored as 'date' field in Firestore
          slots: List.from(data['slots']),
        );
      }).toList();
      // Update UI
      update();
    } catch (e) {
      print("Error fetching dates: $e");
    }
  }

  void checkSlotAvailability(String selectedDate) async {
    // Check if the selected date is already in the alldates list
    // final existingDate =
    // alldates.firstWhereOrNull((date) => date.date == selectedDate);
    final existingDateIndex =
        alldates.indexWhere((date) => date.date == selectedDate);
    if (existingDateIndex != -1) {
      // Check if all slots are filled
      if (alldates[existingDateIndex].slots.length == 5) {
        // Show snackbar indicating no slots available
        Get.snackbar(
            'No Slots Available', 'All slots for this date are filled.');
      } else {
        // Slots are available
        // Call function to add the seller's id to slots for this date
        Get.snackbar('Slots Available', '');
      }
      fillAllDatesList();
    } else {
      // Date is not present, call function to create a new document
      Get.snackbar('Slots Available', '');
      createNewDocument(selectedDate);
    }
  }

  void createNewDocument(String date) {
    DocumentReference doc = datecollection.doc();
    datemodel myproduct = datemodel(date: date, id: doc.id, slots: []);
    final myproductjson = myproduct.toJson();
    doc.set(myproductjson);
    fillAllDatesList();
  }

  void addSlot(String selectedDate, String pid) async {
    // Find the index of the existing date in the alldates list
    final existingDateIndex =
        alldates.indexWhere((date) => date.date == selectedDate);
    if (existingDateIndex != -1) {
      // Get.snackbar(existingDateIndex.toString(), '');
      // Add seller's id to the slots for this date
      // alldates[existingDateIndex].slots.add(pid);
      String dateid = alldates[existingDateIndex].id;
      await datecollection.doc(dateid).update({
        'slots': FieldValue.arrayUnion([pid]),
      });
      // Get.snackbar('this is','');
      // Update the alldates list
      fillAllDatesList();
      update();
    } else {
      // Get.snackbar('Error in addslot','');
      print('error in addf slot function');
    }
  }

  setValuesDefault() async {
    item_name.clear();
    description.clear();
    base_price.clear();
    item_image.clear();
    item_category = 'collectibles';
    // datechosen = DateFormat("yyyy-MM-dd").format(DateTime.now()) as DateTime?;
    String formattedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
     datechosen = DateTime.tryParse(formattedDate);
    update();
  }
}
