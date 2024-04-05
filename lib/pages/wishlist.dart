// // import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:liveauction/pages/profilecontroller.dart';

// class WishlistPage extends StatefulWidget {
//   @override
//   State<WishlistPage> createState() => _WishlistPageState();
// }

// class _WishlistPageState extends State<WishlistPage> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<Profilecontroller>(builder: (ctrl) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('WishList'),
//         ),
//         body: ListView.builder(
//           itemCount: ctrl.sellerwishlist.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 // Navigate to item details page
//               },
//               child: Card(
//                 margin: EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
                    
//                     Container(
//                                     width: 125,
//                                     height: 125,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10.0), // Set border radius here
//                                       image: DecorationImage(
//                                         image: NetworkImage(ctrl.sellerwishlist[index].pimage,), // Replace with your image URL
//                                         fit: BoxFit.cover, // Adjust image fit as needed
//                                       ),
//                                     ),
//                                   ),
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               ctrl.sellerwishlist[index].pname,
//                               style: TextStyle(
//                                   fontSize: 20.0, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 8.0),
//                             Text(
//                               ctrl.sellerwishlist[index].pdesc,
//                               style: TextStyle(fontSize: 16.0),
//                             ),
//                             SizedBox(height: 8.0),
//                             Text(
//                               ctrl.sellerwishlist[index].pprice,
//                               style: TextStyle(
//                                   fontSize: 16.0, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               ctrl.sellerwishlist[index].dateAdded,
//                               style: TextStyle(
//                                   fontSize: 20.0, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 8.0),
//                             // Text(
//                             //   auctionItems[index].Status,
//                             //   style: TextStyle(
//                             //       fontSize: 20.0, fontWeight: FontWeight.bold),
//                             // ),
//                             // SizedBox(height: 8.0),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     });
//   }
// }



// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveauction/pages/profilecontroller.dart';

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return GetBuilder<Profilecontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await ctrl.refreshPage();
          },
          child: Container(
            
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: ctrl.sellerwishlist.length,
              itemBuilder: (context, index) {
                var item = ctrl.sellerwishlist[index];
                return AdminCard(
                  title: ctrl.sellerwishlist[index].pname ?? '',
                  bidPrice: ctrl.sellerwishlist[index].pprice ?? '',
                  auctionDate: ctrl.sellerwishlist[index].dateAdded ?? '',
                  category: ctrl.sellerwishlist[index].pcategory ?? '',
                  imageUrl: ctrl.sellerwishlist[index].pimage ?? '',
                  // bool: ctrl.sellerwishlist[index].status.toString() ?? '',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  onPressedDelete: () {
                    ctrl.deleteProductfromwishlist(
                        ctrl.sellerwishlist[index].pid ?? '');
                  },
                );
              },
            ),
          ),
        ),
      );
    });
  }
}

class AdminCard extends StatelessWidget {
  final String title;
  final String bidPrice;
  final String auctionDate;
  final String category;
  final String imageUrl;
  // final String bool;
  final VoidCallback onPressedDelete;
  // final VoidCallback onPressedAccept;
  final double screenWidth;
  final double screenHeight;

  const AdminCard({
    required this.title,
    required this.bidPrice,
    required this.auctionDate,
    required this.category,
    required this.imageUrl,
    // required this.bool,
    required this.onPressedDelete,
    // required this.onPressedAccept,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Bid Price: $bidPrice',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Auction Date: $auctionDate',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Category: $category',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  // Text(
                  //   'Status: ${bool == 'true' ? 'Accepted' : 'Not Accepted yet'}',
                  //   style: TextStyle(
                  //     fontSize: screenWidth * 0.03,
                  //     color: bool == 'true' ? Colors.green : Colors.red,
                  //   ),
                  // ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: onPressedDelete,
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          backgroundColor: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    