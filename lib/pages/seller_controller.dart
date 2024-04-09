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
import 'package:liveauction/models/usermodel.dart';
// import '../models/datemodel.dart';

class Sellercontroller extends GetxController {
  final curruser = FirebaseAuth.instance.currentUser;
  final item_name = TextEditingController();
  final description = TextEditingController();
  final base_price = TextEditingController();
  final item_image = TextEditingController();
  String item_category = '';
  DateTime? datechosen;
  final locationchosen = TextEditingController();
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
  bool userreg=false;
  bool userwish=false;
List<usermodel> userslist = [];
  List<dynamic> aucthis = [];
  List<dynamic> wishthis=[];

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
          dateAdded: datechosen.toString().substring(0, 10),
          location: locationchosen.text.trim(),
          ptime: 0,
          );

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
            product.pcategory == 'Articrafts' && product.status == true)
        .toList();
    productsshowinui2 = cameproducts
        .where((product) =>
            product.pcategory == 'Antiques' && product.status == true)
        .toList();
    productsshowinui3 = cameproducts
        .where(
            (product) => product.pcategory == 'Books' && product.status == true)
        .toList();
    productsshowinui4 = cameproducts
        .where((product) =>
            product.pcategory == 'Collectibles' && product.status == true)
        .toList();
    productsshowinui5 = cameproducts
        .where(
            (product) => product.pcategory == 'Electronics' && product.status == true)
        .toList();
    productsshowinui6 = cameproducts
        .where(
            (product) => product.pcategory == 'Sports' && product.status == true)
        .toList();
    productsshowinui7 = cameproducts
        .where((product) =>
            product.pcategory == 'Others' && product.status == true)
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
  refreshPage() async {
    await getproduct();
    update();
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
      update();

    } catch (e) {
      print("Error in ItemController2 registerUser: $e");
      Get.snackbar('Error', 'Failed to register', colorText: Colors.red);
    }
  }



  Future<void> checkregstatus(String? pid)async{
    print("Iam called in controller");
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
       if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser.toString());
      Iterable<usermodel> curruser = userslist
          .where((user) => user.uid == FirebaseAuth.instance.currentUser!.uid);
      

      aucthis = curruser.firstOrNull?.auctionhistory ?? [];

    
  
      List<String> auctionHistory = aucthis.cast<String>();

     if(auctionHistory.contains(pid)!=false){
      userreg=true;
     }else{
      userreg=false;
     }
     print(userreg.toString()+"in controller");
    } else {
      // Handle the case when the user is not logged in
      print("User is not logged in2222222222222222");
    }
    update();
}


  Future<void> checkwishliststatus(String? pid)async{
    print("Iam called in controller");
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
       if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser.toString());
      Iterable<usermodel> curruser = userslist
          .where((user) => user.uid == FirebaseAuth.instance.currentUser!.uid);
      

      wishthis = curruser.firstOrNull?.wishlist ?? [];

    
  
      List<String> wishlist = wishthis.cast<String>();

     if(wishlist.contains(pid)!=false){
      userwish=true;
     }else{
      userwish=false;
     }
     print(userwish.toString()+"in controller");
    } else {
      // Handle the case when the user is not logged in
      print("User is not logged in111111111111111111");
    }
      update();
}




  Future<void> deleteProductfromwishlist(String pid) async {
    try {
      // Query for the document with the specified uid
      QuerySnapshot usersSnapshot = await usercollection
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .limit(1)
          .get();

      // Check if document exists
      if (usersSnapshot.docs.isNotEmpty) {
        // Get the reference to the document
        DocumentReference docRef = usersSnapshot.docs.first.reference;

        // Get the current data of the document
        Map<String, dynamic>? data =
            usersSnapshot.docs.first.data() as Map<String, dynamic>?;

        if (data != null) {
          // Check if the 'slots' field exists and is a list
          if (data.containsKey('wishlist') && data['wishlist'] is List) {
            // Remove the string pid from the 'slots' list
            List<dynamic> wlts = List.from(data['wishlist']);
            wlts.remove(pid);
            refreshPage();
            // Update the document with the modified 'slots' list
            await docRef.update({'wishlist': wlts});
          } else {
            // Handle if 'slots' field doesn't exist or is not a list
            print('Error: No slots field or slots is not a list');
          }
        } else {
          print('Error: Document data is null');
        }
        
      } else {
        // Handle if document with given date doesn't exist
        print('Document not found');
      }
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error deleting string from date: $e');
    }
  }



}