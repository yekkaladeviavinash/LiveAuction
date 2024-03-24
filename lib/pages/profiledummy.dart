// import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liveauction/resources/add_data.dart';
import 'package:liveauction/utils.dart';

class ProfileDummy extends StatefulWidget {
  const ProfileDummy({super.key});

  @override
  _ProfileDummyState createState() => _ProfileDummyState();
}

class _ProfileDummyState extends State<ProfileDummy> {
  bool shouldupload=false;
  late Uint8List _image;

      
    
  
  void selectimage()async{
    Uint8List img=await pickimage(ImageSource.gallery);
    setState(() {
      _image=img;
    });
  }

  void saveprofile()async{
    await storedata().update(file: _image);
  }
    final curruser=FirebaseAuth.instance.currentUser!;

  String nameofuser="";
  String emailofuser="";
  String numberofuser="";
  String imagelink="";
  void initState(){
    super.initState();
    _image=Uint8List(0);
    getUserdetail();
  }
  void getUserdetail()async{
    
  DocumentSnapshot snap=await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
  setState(() {
    nameofuser=(snap.data() as Map<String,dynamic>)['username'];
    emailofuser=(snap.data() as Map<String,dynamic>)['email'];
    numberofuser=(snap.data() as Map<String,dynamic>)['phone'];
    imagelink=(snap.data() as Map<String,dynamic>)['profileimagelink'];
  });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(height: 1.0,color: Colors.black,thickness: 0.5,),
          SizedBox(height: 20),
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    _image!=null ?
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                    :
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: selectimage,
                        icon: Icon(Icons.add_a_photo),
                      ),
                      bottom: -10,
                      left: 80,
                    ),
                  ],
                ),
                _image!=null ?
                ElevatedButton(onPressed: (){
                  saveprofile();
                }, child: Text("Upload")):
                Container(),
                Text(
                  ' $nameofuser',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 0),
                Text(
                  '$emailofuser',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 0),
                Text(
                  '$numberofuser',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Divider(height: 1.0,color: Colors.black,thickness: 2,indent: 100,endIndent: 100,),
          SizedBox(height: 20),
          
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 10, 17, 5),
                    child: Card(
                      color: Colors.black,
                      child: ListTile(
                        iconColor: Colors.white,
                        leading: Icon(Icons.history),
                        title: Text(
                          'My Auction History',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          // My Auction History button action
                          // Implement your navigation logic here
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 0, 17, 5),
                    child: Card(
                      color: Colors.black,
                      child: ListTile(
                        iconColor: Colors.white,
                        leading: Icon(Icons.shop_2,),
                        title: Text(
                          'My Selling History',
                          style: TextStyle(
                            color: Colors.white,
                            
                          ),
                        ),
                        onTap: () {
                          // My Selling History button action
                          // Implement your navigation logic here
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 70, 100, 0),
                    child: Card(
                      color: Colors.red,
                      child: ListTile(
                        // shape: CircleBorder.,
                        leading: Icon(Icons.logout,color: Colors.white,),
                        title: Text(
                          'Logout',
                          
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          // Logout button action
                          // Implement your logout logic here
                          FirebaseAuth.instance.signOut();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}