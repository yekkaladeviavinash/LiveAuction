import 'dart:ffi';

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
    return GetBuilder<Profilecontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
        ),
        body: ListView.builder(
          itemCount: ctrl.sellerwishlist.length,
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
                              ctrl.sellerwishlist[index].pname,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              ctrl.sellerwishlist[index].pdesc,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              ctrl.sellerwishlist[index].pprice,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ctrl.sellerwishlist[index].dateAdded,
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