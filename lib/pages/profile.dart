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

import 'package:flutter/cupertino.dart';
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
    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    return GetBuilder<Profilecontroller>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // backgroundColor: Colors.black,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile Page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24 * (W / 448),
              
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                height: W * 0.00223214285714,
                color: Colors.black,
                thickness: 0.5 * (H / 973.4),
              ),
              SizedBox(height: 20 * (H / 973.4)),
              Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 75 * (H / 973.4),
                        backgroundImage: AssetImage(
                            'assets/profile.jpg'), // Assuming profileImage is a URL
                      ),
                    ),
                    SizedBox(height: 10 * (H / 973.4)),
                    Center(
                      child: Text(
                        '$nameofuser',
                        // 'Harsha Majji',
                        style: TextStyle(
                          fontSize: 30 * (W / 448),
                          letterSpacing: (0.1) * (W / 448),
                          // fontFamily: Montserrat,
                          // fontWeight: FontWeig,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 0),
                    Center(
                      child: Text(
                        '$numberofuser',
                        style: TextStyle(
                          fontSize: 16 * (W / 448),
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '$emailofuser',
                        style: TextStyle(
                          fontSize: 16 * (W / 448),
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10 * (H / 973.4)),
                  ],
                ),
              ),
              SizedBox(height: 10 * (H / 973.4)),
              Container(
                width: 9 * (W) / 10,
                height: H / 15,
                decoration: BoxDecoration(
                  boxShadow: [
              BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius:2,
        blurRadius: 2,
        offset: Offset(0, 3), // Adjust the shadow position
      ),
            ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black, // You can specify border color here
                    width: 0.1, // You can specify border width here
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                              fontSize: 20 * (W / 411.5),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Auctions Won',
                          style: TextStyle(
                              fontSize: 13 * (W / 411.5),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ctrl.sellerAuctionHistory.length.toString(),
                          style: TextStyle(
                              fontSize: 20 * (W / 411.5),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Participated',
                          style: TextStyle(
                              fontSize: 13 * (W / 411.5),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ctrl.sellerProducts.length.toString(),
                          style: TextStyle(
                              fontSize: 20 * (W / 411.5),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Items Auctioned ',
                          style: TextStyle(
                              fontSize: 13 * (W / 411.5),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15*(H/974.3),),
              Divider(
                height: 1 * (H / 973.4),
                color: Colors.grey.shade700,
                thickness: 2 * (H / 973.4),
                indent: 50 * (W / 448),
                endIndent: 50 * (W / 448),
              ),
              SingleChildScrollView(
                child: Container(
                  height: (1.4) * (H / 4),
                  // isScrollable:true,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(17 * (W / 448),
                            10 * (H / 973.4), 17 * (W / 448), 5 * (H / 973.4)),
                        child: SizedBox(
                          width: W / 2,
                          // height: H/5,
                          child: Card(
                            surfaceTintColor: Colors.transparent,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            // color: Colors.grey,
                            child: ListTile(
                              contentPadding:EdgeInsets.fromLTRB(16, 0, 16, 0),
                              iconColor: Colors.black,
                              leading: Icon(Icons.history),
                              title: Text(
                                'My Auction History',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () async {
                                await ctrl.getsellerproducts();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AuctionHistoryPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            17 * (W / 448), 0, 17 * (W / 448), 5 * (H / 973.4)),
                        child: SizedBox(
                          width: W * (9 / 10),
                          child: Card(
                            // color: Colors.white,
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.white,
                                  elevation: 0,
          
                            color: const Color.fromARGB(255, 183, 182, 182),
                            // color: Colors.grey,
                            child: ListTile(
                              iconColor: Colors.black,
                              leading: Icon(
                                Icons.shop_2,
                              ),
                              title: Text(
                                'My Selling History',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () async {
                                await ctrl.getsellerproducts();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SellerHistoryPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            17 * (W / 448), 0, 17 * (W / 448), 0 * (H / 973.4)),
                        child: SizedBox(
                          width: 2 * (W / 5),
                          child: Card(
                          //  color: Colors.white,
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.white,
                                  elevation: 0,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            child: ListTile(
                              iconColor: Colors.black,
                              leading: Icon(
                                Icons.hail_rounded,
                              ),
                              title: Text(
                                'My WishList',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () async {
                                await ctrl.getsellerproducts();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WishlistPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: W / 3.5,
                  height: H / 20,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set border radius here
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.black), // Set background color here
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: W / 60,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 16 * (W / 440), color: Colors.white,),
                        )
                      ],
                    ),
                    onPressed: () => {
                      FirebaseAuth.instance.signOut()
                    },
                  )),
            ],
          ),
        ),
      );
    });
  }
}
