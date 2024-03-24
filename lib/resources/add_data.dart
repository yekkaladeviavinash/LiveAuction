// import 'dart:html';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

    final curruser=FirebaseAuth.instance.currentUser!;

class storedata{
  Future<String> uploadimagetostorage(String childname, Uint8List file)async{
    Reference ref=FirebaseStorage.instance.ref().child(childname).child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask =ref.putData(file);
    TaskSnapshot snapshot=await uploadTask;
    String downloadurl=await snapshot.ref.getDownloadURL();
    return downloadurl;
  }

  

update({required Uint8List file})async{
  DocumentReference documentReference=FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
  try{
  await documentReference.update({
    'profileimagelink':await uploadimagetostorage('userprofile',file),
  });
  }catch(e){
    print("error given by avinash is $e");
  }
}
}
