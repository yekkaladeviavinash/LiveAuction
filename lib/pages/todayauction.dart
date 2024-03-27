// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:liveauction/pages/todayauction_controller.dart';

// // class Todayauction extends StatefulWidget {
// //   const Todayauction({super.key});

// //   @override
// //   State<Todayauction> createState() => _TodayauctionState();
// // }

// class _TodayauctionState extends State<Todayauction> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<Todayauctioncontroller>(builder: (ctrl){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Today's Auctions"),
//       ),
//       body:ListView.builder(
//       itemCount: ctrl.todayproduct.length,
//       itemBuilder: (context, index) {
//     final cardData = ctrl.todayproduct[index];
//     final currentTime = DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30)); // Convert UTC to IST
//     final isTimeToShowButton = currentTime.hour == ctrl.getProductIndexandtime(cardData.pid) && currentTime.minute >= 0 && currentTime.minute <= 29;

//     return InkWell(
//       onTap: () {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => itempage(selectpid: cardData.pid),
//         //   ),
//         // );
//       },
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//         child: Card(
//           color: Colors.white,
//           surfaceTintColor: Colors.transparent,
//           shadowColor: Colors.white,
//           elevation: 0,
//           child: Row(
//             children: [
//               Container(
//                 width: 125,
//                 height: 125,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   image: DecorationImage(
//                     image: NetworkImage(cardData.pimage),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       cardData.pname,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text('Rs.' + cardData.pprice),
//                   ],
//                 ),
//               ),
//               if (isTimeToShowButton)
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle button press
//                   },
//                   child: Text('Enter'),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   },
// ),
//     );
//     });
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:liveauction/pages/todayauction_controller.dart';

// class Todayauction extends StatefulWidget {
//   const Todayauction({Key? key}) : super(key: key);

//   @override
//   State<Todayauction> createState() => _TodayauctionState();
// }

// class _TodayauctionState extends State<Todayauction> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<Todayauctioncontroller>(builder: (ctrl) {
//       if (ctrl.todayproduct.isEmpty) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text("Today's Auctions"),
//           ),
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       } else {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text("Today's Auctions"),
//           ),
//           body: ListView.builder(
//             itemCount: ctrl.todayproduct.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {},
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//                   child: Card(
//                     color: Colors.white,
//                     surfaceTintColor: Colors.transparent,
//                     shadowColor: Colors.white,
//                     elevation: 0,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 125,
//                           height: 125,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             image: DecorationImage(
//                               image: NetworkImage(ctrl.todayproduct[index].pimage ?? ''),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 ctrl.todayproduct[index].pname ?? '',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text('Rs.${ctrl.todayproduct[index].pprice ?? ''}'),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liveauction/pages/bidding.dart';
import 'package:liveauction/pages/todayauction_controller.dart';

class Todayauction extends StatefulWidget {
  const Todayauction({super.key});

  @override
  State<Todayauction> createState() => _TodayauctionState();
}

class _TodayauctionState extends State<Todayauction> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Todayauctioncontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Today's Auctions"),
        ),
        body: ListView.builder(
          itemCount: ctrl.todayproduct.length,
          itemBuilder: (context, index) {
            final cardData = ctrl.todayproduct[index];
            final currentTime = DateTime.now().toUtc().add(
                const Duration(hours: 5, minutes: 30)); // Convert UTC to IST
            final isTimeToShowButton =
                currentTime.hour == ctrl.getProductIndexandtime(cardData.pid) &&
                    currentTime.minute >= 0 &&
                    currentTime.minute <= 59;
            final auctionCompleted =
                currentTime.hour > ctrl.getProductIndexandtime(cardData.pid);
            final auctionInFuture =
                currentTime.hour < ctrl.getProductIndexandtime(cardData.pid);
            final currentUserUID = FirebaseAuth.instance.currentUser!.uid;
            final isCurrentUserRegistered =
                cardData.registeredusers.contains(currentUserUID);

            return InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => itempage(selectpid: cardData.pid),
                //   ),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  shadowColor: Colors.white,
                  elevation: 0,
                  child: Row(
                    children: [
                      Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(cardData.pimage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardData.pname,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('Rs.' + cardData.pprice),
                          ],
                        ),
                      ),
                      if (isTimeToShowButton && isCurrentUserRegistered)
                        ElevatedButton(
                          onPressed: () {
                            // Handle button p
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => bidding(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,),
                              ),
                            );
                          },
                          child: Text('Enter'),
                        ),
                      
                      if (auctionCompleted)
                        Text("Auction Completed"),
                        

                      if (auctionInFuture && isCurrentUserRegistered)
                        Text("Already Registered"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
