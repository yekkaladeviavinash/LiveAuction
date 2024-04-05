import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveauction/pages/profilecontroller.dart';



class AuctionHistoryPage extends StatefulWidget {
  @override
  State<AuctionHistoryPage> createState() => _AuctionHistoryPageState();
}

class _AuctionHistoryPageState extends State<AuctionHistoryPage> {
  // Profilecontroller ctrl =Profilecontroller();
  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return GetBuilder<Profilecontroller>(builder: (ctrl){
      return Scaffold(
        appBar: AppBar(
          title: Text('Auction History'),
        ),
         body: RefreshIndicator(
          onRefresh: () async {
            await ctrl.refreshPage();
          },
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: ctrl.sellerAuctionHistory.length,
              itemBuilder: (context, index) {
                var item = ctrl.sellerAuctionHistory[index];
                return AdminCard(
                  title: ctrl.sellerAuctionHistory[index].pname ?? '',
                  bidPrice: ctrl.sellerAuctionHistory[index].pprice ?? '',
                  auctionDate: ctrl.sellerAuctionHistory[index].dateAdded ?? '',
                  category: ctrl.sellerAuctionHistory[index].pcategory ?? '',
                  imageUrl: ctrl.sellerAuctionHistory[index].pimage ?? '',
                  // bool: ctrl.sellerAuctionHistory[index].status.toString() ?? '',
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                );
              },
            ),
          ),
        ),
        // body: ListView.builder(
        //   itemCount: ctrl.sellerAuctionHistory.length,
        //   itemBuilder: (context, index) {
        //     return GestureDetector(
        //       onTap: () {
        //         // Navigate to item details page
        //       },
        //       child: Card(
        //         margin: EdgeInsets.all(8.0),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //                             width: 125,
        //                             height: 125,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(10.0), // Set border radius here
        //                               image: DecorationImage(
        //                                 image: NetworkImage(ctrl.sellerAuctionHistory[index].pimage,), // Replace with your image URL
        //                                 fit: BoxFit.cover, // Adjust image fit as needed
        //                               ),
        //                             ),
        //                           ),
        //             Expanded(
        //               child: Padding(
        //                 padding: EdgeInsets.all(8.0),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       ctrl.sellerAuctionHistory[index].pname,
        //                       style: TextStyle(
        //                           fontSize: 20.0, fontWeight: FontWeight.bold),
        //                     ),
        //                     SizedBox(height: 8.0),
        //                     Text(
        //                       ctrl.sellerAuctionHistory[index].pdesc,
        //                       style: TextStyle(fontSize: 16.0),
        //                     ),
        //                     SizedBox(height: 8.0),
        //                     Text(
        //                       ctrl.sellerAuctionHistory[index].pprice,
        //                       style: TextStyle(
        //                           fontSize: 16.0, fontWeight: FontWeight.bold),
        //                     ),
        //                     Text(
        //                       ctrl.sellerAuctionHistory[index].dateAdded,
        //                       style: TextStyle(
        //                           fontSize: 20.0, fontWeight: FontWeight.bold),
        //                     ),
        //                     SizedBox(height: 8.0),
        //                     // Text(
        //                     //   auctionItems[index].Status,
        //                     //   style: TextStyle(
        //                     //       fontSize: 20.0, fontWeight: FontWeight.bold),
        //                     // ),
        //                     // SizedBox(height: 8.0),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
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
  final double screenWidth;
  final double screenHeight;

  const AdminCard({
    required this.title,
    required this.bidPrice,
    required this.auctionDate,
    required this.category,
    required this.imageUrl,
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
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}