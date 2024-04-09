// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:liveauction/models/usermodel.dart';

// class ItemController extends GetxController {
//   late CollectionReference productcollection;
//   late CollectionReference usercollection;
//   FirebaseFirestore fStore = FirebaseFirestore.instance;
//   List<usermodel> userslist = [];
//   List<dynamic> aucthis = [];
//   @override
//   void onInit() {
//     productcollection = fStore.collection('products');
//     usercollection= fStore.collection('users');
//     super.onInit();
//   }

//   Future<void> registerUser(String? pid) async {
//     try {
//       if (pid != null) {
//         await productcollection.doc(pid).update({
//           'registeredusers': FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
//         });
//         await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
//           'auctionhistory': FieldValue.arrayUnion([pid]),
//         });
//         Get.snackbar('Success', 'Registered successfully', colorText: Colors.green);
//       } else {
//         throw Exception("Product ID is null");
//       }

//     } catch (e) {
//       print("Error in ItemController registerUser: $e");
//       Get.snackbar('Error', 'Failed to register', colorText: Colors.red);
//     }
//   }


//   Future<void> addtowishlist(String? pid) async {
//     try {
//       if (pid != null) {
//         await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
//           'wishlist': FieldValue.arrayUnion([pid]),
//         });
//         Get.snackbar('Success', 'Added to wishlist successfully', colorText: Colors.green);
//       } else {
//         throw Exception("Product ID is null");
//       }

//     } catch (e) {
//       print("Error in ItemController2 registerUser: $e");
//       Get.snackbar('Error', 'Failed to register', colorText: Colors.red);
//     }
//   }



//   Future<bool> checkregstatus(String? pid)async{
//     bool registered=false;
// QuerySnapshot usersnapshot = await usercollection.get();
//       final List<usermodel> retrievedusers = usersnapshot.docs.map((doc) {
//         final userData = doc.data();
//         if (userData != null) {
//           // print(userData as Map<String, dynamic>);
//           return usermodel.fromJson(userData as Map<String, dynamic>);
//         } else {
//           throw Exception('Document data is null');
//         }
//       }).toList();

//       userslist.clear();
//       userslist.assignAll(retrievedusers);
//       update();
//        if (FirebaseAuth.instance.currentUser != null) {
//       print(FirebaseAuth.instance.currentUser.toString());
//       Iterable<usermodel> curruser = userslist
//           .where((user) => user.uid == FirebaseAuth.instance.currentUser!.uid);
      

//       aucthis = curruser.firstOrNull?.auctionhistory ?? [];

    
  
//       List<String> auctionHistory = aucthis.cast<String>();

//      if(auctionHistory.contains(pid)!=false){
//       registered=true;
//      }
//      print(registered.toString()+"in controller");
//     } else {
//       // Handle the case when the user is not logged in
//       print("User is not logged in");
//     }
//     return registered;
// }


// }