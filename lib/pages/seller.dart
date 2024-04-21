// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'dart:typed_data';
// import 'package:liveauction/pages/seller_controller.dart';
// import 'package:liveauction/utils.dart';

// const List<String> list = [
//   'Category',
//   'Collectibles',
//   'Antiques',
//   'Articrafts',
//   'Electronics',
//   'Books',
//   'Sports',
//   'Others',
// ];

// class Seller extends StatefulWidget {
//   const Seller({super.key});

//   @override
//   State<Seller> createState() => _SellerState();
// }

// class _SellerState extends State<Seller> {
//   String category = '';
//   String dropdownValue = list.first;

//   // List<DropdownMenuEntry>;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   // CalendarFormat _calendarFormat = CalendarFormat.month;

//   DateTime? chosenDate;

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     double W = screenSize.width / 448.0;
//     double H = screenSize.height / 973.33;
//     return GetBuilder<Sellercontroller>(builder: (ctrl) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Sell Item',
//             style: TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding:
//                 EdgeInsets.fromLTRB(20.0 * W, 20.0 * H, 20.0 * W, 20.0 * H),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Text(
//                   'Add Item Details',
//                   style: TextStyle(
//                     fontSize: 40.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 30.0 * H),
//                 TextFormField(
//                   controller: ctrl.item_name,
//                   cursorColor: Color.fromARGB(255, 216, 97, 29),
//                   decoration: const InputDecoration(
//                     labelText: 'Item name',
//                     labelStyle: TextStyle(color: Colors.black),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 216, 97, 29))),
//                   ),
//                 ),
//                 SizedBox(height: 30.0 * H),
//                 TextFormField(
//                   controller: ctrl.description,
//                   minLines: 1,
//                   maxLines: 10,
//                   maxLength: 2000,
//                   cursorColor: Color.fromARGB(255, 216, 97, 29),
//                   decoration: const InputDecoration(
//                     labelText: 'Item description',
//                     labelStyle: TextStyle(color: Colors.black),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 216, 97, 29))),
//                   ),
//                 ),
//                 TextFormField(
//                   controller: ctrl.base_price,
//                   cursorColor: Color.fromARGB(255, 216, 97, 29),
//                   keyboardType: TextInputType.numberWithOptions(),
//                   textInputAction: TextInputAction.done,
//                   inputFormatters: <TextInputFormatter>[
//                     FilteringTextInputFormatter.digitsOnly
//                   ],
//                   decoration: const InputDecoration(
//                     labelText: 'base price',
//                     labelStyle: TextStyle(color: Colors.black),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 216, 97, 29))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0 * H,
//                 ),
//                 TextFormField(
//                   controller: ctrl.locationchosen,
//                   cursorColor: Color.fromARGB(255, 216, 97, 29),
//                   decoration: const InputDecoration(
//                     labelText: 'Location',
//                     labelStyle: TextStyle(color: Colors.black),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 216, 97, 29))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0 * H,
//                 ),
//                 TextFormField(
//                   controller: ctrl.item_image,
//                   cursorColor: Color.fromARGB(255, 216, 97, 29),
//                   decoration: const InputDecoration(
//                     labelText: 'Image Url',
//                     labelStyle: TextStyle(color: Colors.black),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 216, 97, 29))),
//                   ),
//                 ),
//                 SizedBox(height: 16.0 * H),
//                 if (chosenDate != null)
//                   Text(
//                     'Chosen Date: ${chosenDate!.day}/${chosenDate!.month}/${chosenDate!.year}',
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                 SizedBox(height: 16.0 * H),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 30, 28, 27),
//                   ),
//                   onPressed: () async {
//                     // Show date picker and wait for user selection
//                     final DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2020),
//                       lastDate: DateTime(2100),
//                     );

//                     // Update chosenDate if the user selected a date
//                     if (pickedDate != null) {
//                       setState(() {
//                         chosenDate = pickedDate;
//                         ctrl.datechosen = chosenDate;
//                         ctrl.checkSlotAvailability(
//                             chosenDate.toString().substring(0, 10));
//                       });
//                     }
//                   },
//                   child: Text(
//                     'Choose Date',
//                     style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                 ),
//                 SizedBox(height: 16.0 * H),
//                 Center(
//                   child: DropdownMenu<String>(
//                     inputDecorationTheme: InputDecorationTheme(
//                         fillColor: const Color.fromARGB(255, 216, 97, 29),
//                         filled: false,
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(1.0),
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 216, 97, 29)))),
//                     dropdownMenuEntries:
//                         list.map<DropdownMenuEntry<String>>((String value) {
//                       return DropdownMenuEntry<String>(
//                           value: value, label: value);
//                     }).toList(),
//                     initialSelection: list.first,
//                     onSelected: (String? value) {
//                       // ctrl.selectedcategory=dropdownValue;
//                       // This is called when the user selects an item.
//                       setState(() {
//                         dropdownValue = value!;
//                       });
//                       ctrl.item_category = dropdownValue;
//                       ctrl.update();
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0 * H,
//                 ),
//                 Center(
//                     child: ElevatedButton(
//                   onPressed: () {
//                     ctrl.addproduct();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 30, 28, 27),
//                   ),
//                   child: const Text(
//                     'Upload',
//                     style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                 ))
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   void _showCalendar() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           var screenSize = MediaQuery.of(context).size;
//           double W = screenSize.width / 448.0;
//           double H = screenSize.height / 973.33;
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)),
//             child: Container(
//               height: 425.0 * H,
//               padding: const EdgeInsets.all(10.0),
//             ),
//           );
//         });
//   }
// }





































import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:liveauction/pages/seller_controller.dart';
import 'package:liveauction/utils.dart';
import 'package:path/path.dart' as path;
const List<String> list = [
  'Category',
  'Collectibles',
  'Antiques',
  'Articrafts',
  'Electronics',
  'Books',
  'Sports',
  'Others',
];

class Seller extends StatefulWidget {
  const Seller({super.key});

  @override
  State<Seller> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  String category = '';
  String dropdownValue = list.first;

  // List<DropdownMenuEntry>;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime? chosenDate;


final db = FirebaseFirestore.instance;
List<XFile?> ImagesList = [];
List<String> _imageURLs = [];
final storage = FirebaseStorage.instance;
FirebaseFirestore fstore = FirebaseFirestore.instance;
String imagelink="";

@override
void dispose() {

  super.dispose();
}


// Future _pickImageFromGallery() async {
//     final returnedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnedImage != null) {
//       setState(() {
//         ImagesList.add(returnedImage);
//         uploadFile(File(returnedImage.path));
//       });
//     }
//   }

//   Future _pickImageFromCamera() async {
//     final returnedImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnedImage != null) {
//       setState(() {
//         ImagesList.add(returnedImage);
//         uploadFile(File(returnedImage.path));
//       });
//     }
//   }
Future<void> _pickImageFromCamera() async {
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  if (returnedImage != null) {
    if (mounted) {
      setState(() {
        ImagesList.add(returnedImage);
        uploadFile(File(returnedImage.path));
      });
    }
  }
}

Future<void> _pickImageFromGallery() async {
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (returnedImage != null) {
    if (mounted) {
      setState(() {
        ImagesList.add(returnedImage);
        uploadFile(File(returnedImage.path));
      });
    }
  }
}


  Future uploadFile(File photo) async {
    final String fileName = path.basename(photo.path);
    final String fileType = path.extension(photo.path).substring(1);
    final destination =
        storage.ref().child("products/${fstore.collection('products').doc().id}/images/$fileName");
    try {
      await destination.putFile(
          photo,
          SettableMetadata(
            contentType: "image/$fileType",
          ));
      var url = await destination.getDownloadURL();
      _imageURLs.add(url);
      
      setState(() {
        imagelink=url;
      });
      // await db.collection("products").doc(fstore.collection('products').doc().id).set({
      //   'pimage': FieldValue.arrayUnion([url]),
      // }, SetOptions(merge: true));
    } catch (e) {
      print('error occured');
    }
  }














  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double W = screenSize.width / 448.0;
    double H = screenSize.height / 973.33;
    return GetBuilder<Sellercontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sell Item',
            style: TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(20.0 * W, 20.0 * H, 20.0 * W, 20.0 * H),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Add Item Details',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),







          if(imagelink=="")
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Center(
                child: Image.network(
                  "https://t3.ftcdn.net/jpg/03/45/05/92/360_F_345059232_CPieT8RIWOUk4JqBkkWkIETYAkmz2b75.webp",
                  width: 250.0*W,
                  height: 250.0*W,
                  fit: BoxFit.cover,
                ),
              ),
            ),

if(imagelink!="")
  ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imagelink,
                width: 250.0*W,
                height: 250.0*W,
                fit: BoxFit.cover,
              ),
            ),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      style: 
      ElevatedButton.styleFrom(
              backgroundColor: Colors.black // Change the background color here
            ),
                          onPressed: () {
                            _pickImageFromCamera();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.camera_alt_outlined,color: Colors.white,)
                              ,
                              SizedBox(width: 5,),
                              Text(
                                'Camera',
                                style: TextStyle(
                                  color:  Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
 ElevatedButton(
  style: 
      ElevatedButton.styleFrom(
              backgroundColor: Colors.black // Change the background color here
            ),
                          onPressed: () {
                            _pickImageFromGallery();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.image_search_rounded,color: Colors.white,)
                              ,
                              SizedBox(width: 5,),
                              Text(
                                'Gallery',
                                style: TextStyle(
                                  color:  Colors.white,
                                ),
                              ),
                            ],
                          ),
          ),
  ],
),







                // SizedBox(height: 30.0 * H),
                TextFormField(
                  controller: ctrl.item_name,
                  cursorColor: Color.fromARGB(255, 216, 97, 29),
                  decoration: const InputDecoration(
                    labelText: 'Item name',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                SizedBox(height: 30.0 * H),
                TextFormField(
                  controller: ctrl.description,
                  minLines: 1,
                  maxLines: 10,
                  maxLength: 2000,
                  cursorColor: Color.fromARGB(255, 216, 97, 29),
                  decoration: const InputDecoration(
                    labelText: 'Item description',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                TextFormField(
                  controller: ctrl.base_price,
                  cursorColor: Color.fromARGB(255, 216, 97, 29),
                  keyboardType: TextInputType.numberWithOptions(),
                  textInputAction: TextInputAction.done,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    labelText: 'base price',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                SizedBox(
                  height: 10.0 * H,
                ),
                TextFormField(
                  controller: ctrl.locationchosen,
                  cursorColor: Color.fromARGB(255, 216, 97, 29),
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                SizedBox(
                  height: 10.0 * H,
                ),
                






                SizedBox(height: 16.0 * H),
                if (chosenDate != null)
                  Text(
                    'Chosen Date: ${chosenDate!.day}/${chosenDate!.month}/${chosenDate!.year}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                SizedBox(height: 16.0 * H),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 30, 28, 27),
                  ),
                  onPressed: () async {
                    // Show date picker and wait for user selection
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );

                    // Update chosenDate if the user selected a date
                    if (pickedDate != null) {
                      setState(() {
                        chosenDate = pickedDate;
                        ctrl.datechosen = chosenDate;
                        ctrl.checkSlotAvailability(
                            chosenDate.toString().substring(0, 10));
                      });
                    }
                  },
                  child: Text(
                    'Choose Date',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                SizedBox(height: 16.0 * H),
                Center(
                  child: DropdownMenu<String>(
                    inputDecorationTheme: InputDecorationTheme(
                        fillColor: const Color.fromARGB(255, 216, 97, 29),
                        filled: false,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29)))),
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                    initialSelection: list.first,
                    onSelected: (String? value) {
                      // ctrl.selectedcategory=dropdownValue;
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                      ctrl.item_category = dropdownValue;
                      ctrl.update();
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0 * H,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    ctrl.addproduct(imagelink!);
                    setState(() {
                      imagelink="";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 30, 28, 27),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ))
              ],
            ),
          ),
        ),
      );
    });
  }

  void _showCalendar() {
    showDialog(
        context: context,
        builder: (context) {
          var screenSize = MediaQuery.of(context).size;
          double W = screenSize.width / 448.0;
          double H = screenSize.height / 973.33;
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 425.0 * H,
              padding: const EdgeInsets.all(10.0),
            ),
          );
        });
  }
}
