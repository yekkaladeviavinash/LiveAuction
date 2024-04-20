import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liveauction/pages/auctionpage.dart';
// import 'package:liveauction/pages/bidding.dart';
import 'package:liveauction/pages/todayauction_controller.dart';

class Todayauction extends StatefulWidget {
  const Todayauction({super.key});

  @override
  State<Todayauction> createState() => _TodayauctionState();
}

class _TodayauctionState extends State<Todayauction> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    print(W);
    print(H);

    return GetBuilder<Todayauctioncontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          // title: Text("Today's Auctions"),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            "Today's Auctions",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24 * (W / 448),
            ),
          ),
        ),
        body: Column(
          children: [
            Divider(
              height: W * 0.00223214285714,
              color: Colors.black,
              thickness: 0.5 * (H / 973.4),
            ),
            SizedBox(height: 3 * (H / 973.4)),
            SingleChildScrollView(
              child: Container(
                // color: Colors.black,
                width: W,
                height: ((4) * H) / 5,
                child: ListView.builder(
                  itemCount: ctrl.todayproduct.length,
                  itemBuilder: (context, index) {
                    final cardData = ctrl.todayproduct[index];
                    final currentTime = DateTime.now().toUtc().add(
                        const Duration(
                            hours: 5, minutes: 30)); // Convert UTC to IST
                    final isTimeToShowButton = currentTime.hour ==
                            ctrl.getProductIndexandtime(cardData.pid) &&
                        currentTime.minute >= 0 &&
                        currentTime.minute <= 59;
                    final auctionCompleted = currentTime.hour >
                        ctrl.getProductIndexandtime(cardData.pid);
                    final auctionInFuture = currentTime.hour <
                        ctrl.getProductIndexandtime(cardData.pid);
                    final currentUserUID =
                        FirebaseAuth.instance.currentUser!.uid;
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
                        // padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        padding: EdgeInsets.fromLTRB(8 * (W / 432),
                            4 * (H / 936), 8 * (W / 432), 4 * (H / 936)),

                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20 * (W / 432)), // Border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.1), // Shadow color
                                spreadRadius: 0, // Spread radius
                                blurRadius: 1, // Blur radius
                                offset: Offset(0, 5), // Offset in x and y axes
                              ),
                            ],
                          ),
                          child: Card(
                            color: Colors.white,
                            // surfaceTintColor: Colors.transparent,
                            shadowColor: Colors.black,
                            elevation: 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8 * (W / 432)),
                                  child: Container(
                                    width: 130 * (W / 432),
                                    height: 130 * (W / 432),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey
                                              .withOpacity(0.5), // Shadow color
                                          spreadRadius: 1, // Spread radius
                                          blurRadius: 5, // Blur radius
                                          offset: Offset(
                                              5, -3), // Offset in x and y axes
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10 *
                                          (W / 432)), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData
                                            .pimage), // Replace with your image URL
                                        fit: BoxFit
                                            .cover, // Adjust image fit as needed
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10 * (W / 432)),

                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cardData.pname,
                                        style: TextStyle(
                                            fontSize: 17 * (W / 432),
                                            fontFamily: 'roboto',
                                            fontWeight: FontWeight.w100),
                                      ),
                                      SizedBox(height: 3 * (H / 936)),
                                      Row(
                                        children: [
                                          Text(
                                            'Base Price: ',
                                            style: TextStyle(
                                                fontSize: 14 * (W / 432),
                                                fontFamily: 'roboto',
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            'Rs.' + cardData.pprice,
                                            style: TextStyle(
                                                fontSize: 15 * (W / 432),
                                                color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                fontFamily: 'robotol',
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Auction Time: ',
                                            style: TextStyle(
                                                fontSize: 14 * (W / 432),
                                                fontFamily: 'roboto',
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            cardData.ptime.toString() +
                                                ":00to" +
                                                (cardData.ptime.toInt() + 1)
                                                    .toString() +
                                                ":00 (IST)",
                                            style: TextStyle(
                                                fontSize: 15 * (W / 432),
                                                color: Colors.grey[600],
                                                fontFamily: 'robotol',
                                                fontWeight: FontWeight.bold
                                                // ,letterSpacing: 1
                                                ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Auction Status: ',
                                            style: TextStyle(
                                                fontSize: 14 * (W / 432),
                                                fontFamily: 'roboto',
                                                fontWeight: FontWeight.w900),
                                          ),
                                          if (isTimeToShowButton &&
                                              isCurrentUserRegistered)
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black),
                                                padding: MaterialStateProperty.all<
                                                        EdgeInsets>(
                                                    EdgeInsets.fromLTRB(12, 0, 12,
                                                        0)), // Change color here
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0), // Change border radius here
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    // builder: (context) =>Bidding(),
                                                    builder: (context) =>
                                                        auctionpage(
                                                      selectpid: cardData.pid,
                                                      selectimage:
                                                          cardData.pimage,
                                                      selectcategory:
                                                          cardData.pcategory,
                                                      selectname:
                                                          cardData.pname,
                                                      selectprice:
                                                          cardData.pprice,
                                                      selectdate:
                                                          cardData.dateAdded,
                                                      selectdesc:
                                                          cardData.pdesc,
                                                      selectregisteredusers:
                                                          cardData
                                                              .registeredusers,
                                                      selectsid: cardData.sid,
                                                      selectptime: cardData.ptime,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Enter Auction',
                                                style: TextStyle(
                                                    fontSize: 14 * (W / 432),
                                                    color: Colors.white,
                                                    fontFamily: 'robotol',
                                                    fontWeight: FontWeight.bold
                                                    // ,letterSpacing: 1
                                                    ),
                                              ),
                                            ),
                                          if (auctionCompleted)
                                            
                                          Text('Completed',
                                          style: TextStyle(
                                              fontSize: 15 * (W / 432),
                                              color: Colors.red,
                                              fontFamily: 'robotol',
                                              fontWeight: FontWeight.bold
                                              // ,letterSpacing: 1
                                              ),
                                          ),
                                          

                                          if (isTimeToShowButton &&
                                              !isCurrentUserRegistered)
                                            Text(
                                              "Not Registered",
                                              style: TextStyle(
                                                  fontSize: 15 * (W / 432),
                                                  color: Colors.grey[600],
                                                  fontFamily: 'robotol',
                                                  fontWeight: FontWeight.bold
                                                  // ,letterSpacing: 1
                                                  ),
                                            ),

                                          if (auctionInFuture &&
                                              isCurrentUserRegistered)
                                            Text(
                                              "Already Registered",
                                              style: TextStyle(
                                                  fontSize: 15 * (W / 432),
                                                  color: Colors.grey[600],
                                                  fontFamily: 'robotol',
                                                  fontWeight: FontWeight.bold
                                                  // ,letterSpacing: 1
                                                  ),
                                            ),

                                          if (auctionInFuture &&
                                              !isCurrentUserRegistered)
                                            Text(
                                              "Not Registered",
                                              style: TextStyle(
                                                  fontSize: 15 * (W / 432),
                                                  color: Colors.grey[600],
                                                  fontFamily: 'robotol',
                                                  fontWeight: FontWeight.bold
                                                  // ,letterSpacing: 1
                                                  ),
                                            ),
                                          // Text(
                                          //   cardData.dateAdded,
                                          //   style: TextStyle(
                                          //       fontSize:
                                          //           15 * (W / 432),
                                          //       color: Colors.grey[600],
                                          //       fontFamily: 'robotol',
                                          //       fontWeight:
                                          //           FontWeight.bold
                                          //       // ,letterSpacing: 1
                                          //       ),
                                          // )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
