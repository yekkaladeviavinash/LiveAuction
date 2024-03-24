import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveauction/pages/profilecontroller.dart';

class SellerHistoryPage extends StatefulWidget {
  @override
  State<SellerHistoryPage> createState() => _SellerHistoryPageState();
}

class _SellerHistoryPageState extends State<SellerHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Profilecontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Seller History'),
        ),
        body: ListView.builder(
          itemCount: ctrl.sellerProducts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to item details page
              },
              child: Card(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                                    width: 125,
                                    height: 125,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(ctrl.sellerwishlist[index].pimage,), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
                                      ),
                                    ),
                                  ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ctrl.sellerProducts[index].pname,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              ctrl.sellerProducts[index].pdesc,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              ctrl.sellerProducts[index].pprice,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ctrl.sellerProducts[index].dateAdded,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.0),
                            // Text(
                            //   auctionItems[index].Status,
                            //   style: TextStyle(
                            //       fontSize: 20.0, fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}