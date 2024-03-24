// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//     final curruser=FirebaseAuth.instance.currentUser!;

//   String nameofuser="";
//   String emailofuser="";
//   String numberofuser="";
//   void initState(){
//     super.initState();
//     getUserdetail();
//   }
//   void getUserdetail()async{
    
//   DocumentSnapshot snap=await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
     
//   setState(() {
//     nameofuser=(snap.data() as Map<String,dynamic>)['username'];
//     emailofuser=(snap.data() as Map<String,dynamic>)['email'];
//     numberofuser=(snap.data() as Map<String,dynamic>)['phone'];
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         // backgroundColor: Colors.black,
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Profile Page',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
      
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Divider(height: 1.0,color: Colors.black,thickness: 0.5,),
//           SizedBox(height: 20),
//           Container(
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     // Implement logic to allow user to edit profile image
//                   },
//                   child: CircleAvatar(
//                     radius: 70,
//                     backgroundImage: AssetImage('assets/profile.jpg'), // Assuming profileImage is a URL
//                   ),
//                 ),
//                 // SizedBox(height: ),
//                 Text(
//                   ' $nameofuser',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 0),
//                 Text(
//                   '$emailofuser',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 0),
//                 Text(
//                   '$numberofuser',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 40),
//           Divider(height: 1.0,color: Colors.black,thickness: 2,indent: 100,endIndent: 100,),
//           SizedBox(height: 20),
          
//           Expanded(
//             child: Container(
//               color: Colors.white,
//               child: ListView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(17, 10, 17, 5),
//                     child: Card(
//                       color: Colors.black,
//                       child: ListTile(
//                         iconColor: Colors.white,
//                         leading: Icon(Icons.history),
//                         title: Text(
//                           'My Auction History',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         onTap: () {
//                           // My Auction History button action
//                           // Implement your navigation logic here
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(17, 0, 17, 5),
//                     child: Card(
//                       color: Colors.black,
//                       child: ListTile(
//                         iconColor: Colors.white,
//                         leading: Icon(Icons.shop_2,),
//                         title: Text(
//                           'My Selling History',
//                           style: TextStyle(
//                             color: Colors.white,
                            
//                           ),
//                         ),
//                         onTap: () {
//                           // My Selling History button action
//                           // Implement your navigation logic here
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(100, 70, 100, 0),
//                     child: Card(
//                       color: Colors.red,
//                       child: ListTile(
//                         // shape: CircleBorder.,
//                         leading: Icon(Icons.logout,color: Colors.white,),
//                         title: Text(
//                           'Logout',
                          
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         onTap: () {
//                           // Logout button action
//                           // Implement your logout logic here
//                           FirebaseAuth.instance.signOut();
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:liveauction/pages/auctionhistory.dart';
import 'package:liveauction/pages/profilecontroller.dart';
import 'package:liveauction/pages/sellerhistory.dart';
import 'package:liveauction/pages/wishlist.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final curruser = FirebaseAuth.instance.currentUser!;

  String nameofuser = "";
  String emailofuser = "";
  String numberofuser = "";
  void initState() {
    super.initState();
    getUserdetail();
  }

  void getUserdetail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      nameofuser = (snap.data() as Map<String, dynamic>)['username'];
      emailofuser = (snap.data() as Map<String, dynamic>)['email'];
      numberofuser = (snap.data() as Map<String, dynamic>)['phone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Profilecontroller>(builder: (ctrl) {
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
            Divider(
              height: 1.0,
              color: Colors.black,
              thickness: 0.5,
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // Implement logic to allow user to edit profile image
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                          'assets/profile.jpg'), // Assuming profileImage is a URL
                    ),
                  ),
                  // SizedBox(height: ),
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
            Divider(
              height: 1.0,
              color: Colors.black,
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
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
                            ctrl.getsellerproducts();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AuctionHistoryPage()
                              ),
                            );
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
                          leading: Icon(
                            Icons.shop_2,
                          ),
                          title: Text(
                            'My Selling History',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            ctrl.getsellerproducts();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SellerHistoryPage()
                              ),
                            );
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
                          leading: Icon(
                            Icons.shop_2,
                          ),
                          title: Text(
                            'My WishList',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            ctrl.getsellerproducts();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WishlistPage()
                              ),
                            );
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
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
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
    });
  }
}