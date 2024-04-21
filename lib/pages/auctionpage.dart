import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class auctionpage extends StatefulWidget {
  final String? selectpid;
  final String? selectimage;
  final String? selectcategory;
  final String? selectname;
  final String? selectprice;
  final String? selectdate;
  final String? selectdesc;
  final List? selectregisteredusers;
  final String? selectsid;
  final int? selectptime;
  const auctionpage({
    super.key,
    required this.selectpid,
    required this.selectimage,
    required this.selectcategory,
    required this.selectname,
    required this.selectprice,
    required this.selectdate,
    required this.selectdesc,
    required this.selectregisteredusers,
    required this.selectsid,
    required this.selectptime,
  });

  @override
  State<auctionpage> createState() => _auctionpageState();
}

class _auctionpageState extends State<auctionpage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final int yourBid = 23623478;
  // int highestBid = 25678776;
  double _progressValue = 0.0;
  // String highestBidder = 'Gojo Satoru';
  int _totalTime = 3600;
  final TextEditingController bid = TextEditingController();
  // String timer = '45 min :00 sec';
  bool _isButtonVisible = true;
  bool _showGif = false;

  IO.Socket? socket;
  int? num=0;
  int? mynum=0;
  String user="--";
  int? countdown;
  int? countinmin;
  int? countinsec;
  // int? endingtimer;
  // int? endingtimermin;
  // int? endingtimersec;
  var uuidofuser = Uuid().v1();

  String? nameofuser;
  String? databaseId;
  String? userdatabaseemail;
  String? userdatabasenumber;
  String? sellername;
  String? sellernumber;
  String? selleremail;


  String winner = "";
  String highestprice = "";

  @override
  void initState() {
    super.initState();
    connect();
    getUserdetail();
  }

  @override
  void connect() {
    // socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
    socket = IO.io('http://10.81.66.192:3000', <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      socket!.emit('baseprice', {
          'base':widget.selectprice!,
        });
      print('connected with frontend');
      socket!.on("timer", (timer) {
        print(timer);
        setState(() {
          countdown = timer;
          countinmin = (countdown! / 60).toInt();
          countinsec = countdown! % 60;
          _progressValue = (3600 - countdown!) / _totalTime;
        });
      });
      // socket!.on("endingtimer", (endingtimersent) {
      //   print(endingtimersent);
      //   setState(() {
      //     endingtimer = endingtimersent;
      //     // _totalTime=endingtimersent;
      //     endingtimermin = (endingtimersent! / 60).toInt();
      //     endingtimersec = endingtimersent! % 60;
      //     _progressValue = (120 - endingtimer!) / _totalTime;
      //   });
      // });
      socket!.on("sendMsgServer", (message) {
        print(message);
        setState(() {
          num = message['value'];
          user = message['user'];
          print(user);
        });
        if (message['userid'] == uuidofuser) {
          setState(() {
            mynum = message['value'];
          });
        }
      });
      socket!.on("auctionover", (message) {
        winnerupdate(widget.selectpid!, message['user']);
        socket!.emit('sendemail', {
          'sellername':sellername,
          'sellernumber':sellernumber,
          'selleremail':selleremail,
          'dateofauction':widget.selectdate!,
          'timeofauction':widget.selectptime!,
        });
        // awonupdate(message['databaseidofuser']);
        winner = message['user'];
        highestprice = message['value'].toString();
        if (message['userid'] == uuidofuser) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Congratulations..."),
                  content: Text(
                      "You are the winner of the Auction and the details fo the item seller will be sent to you shortly."),
                );
              });
        } else {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Auction Completed!!!"),
                  content: Text("Auction winner is " +
                      winner.toString() +
                      " and the highest bid is Rs." +
                      highestprice +
                      "."),
                );
              });
        }
      });
    });
  }

  void winnerupdate(String docId, String auctionwinner) async {
    try {
      await firestore.collection('products').doc(docId).update({
        'pwinner': auctionwinner,
      });
      Get.snackbar('Acceped', "Accepted".toString(), colorText: Colors.green);
    } catch (e) {
      print("Error updating document: $e");
    } finally {}
  }








  // void awonupdate(String docId) async {
  //   try {
  //      DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //     int x = await (snap.data() as Map<String, dynamic>)['aWon'];
  //     await firestore.collection('users').doc(docId).update({
  //       'aWon': x+1,
  //     });
  //     Get.snackbar('Acceped', "Accepted".toString(), colorText: Colors.green);
  //   } catch (e) {
  //     print("Error updating document: $e");
  //   } finally {}
  // }

  void sendMessage(int message) {
    socket!.emit('sendMessage', {
      'value': message,
      'user': nameofuser!,
      'databaseid': databaseId!,
      'userid': uuidofuser,
      'databaseemail':userdatabaseemail,
      'databasenumber':userdatabasenumber,
    });
  }

  void getUserdetail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    DocumentSnapshot snap2 = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.selectsid!)
        .get();


    setState(() {
      nameofuser = (snap.data() as Map<String, dynamic>)['username'];
      databaseId = (snap.data() as Map<String, dynamic>)['uid'];
      userdatabaseemail = (snap.data() as Map<String, dynamic>)['email'];
      userdatabasenumber = (snap.data() as Map<String, dynamic>)['phone'];

      sellername = (snap2.data() as Map<String, dynamic>)['username'];
      sellernumber = (snap2.data() as Map<String, dynamic>)['phone'];
      selleremail = (snap2.data() as Map<String, dynamic>)['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('auctionpage'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Color.fromARGB(255, 241, 245, 248),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      widget.selectimage!,
                      fit: BoxFit.cover,
                      scale: 1,
                      height: 400 * (H / 974.3),
                      width: W,
                    ),
                    SizedBox(
                      height: 2 * (H / 936),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 193, 190, 190),
                            borderRadius: BorderRadius.circular(20.0)),
                        width: W,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: Color.fromARGB(255, 193, 190, 190),
                              surfaceTintColor: Colors.transparent,
                              elevation: 0.0,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5.0 * (W / 432),
                                        height: 5.0 * (H / 936),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            40.0 * (W / 432),
                                            15.0 * (H / 936),
                                            20.0 * (W / 432),
                                            10.0 * (H / 936)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Your bid',
                                              style: TextStyle(
                                                  fontSize: 25.0 *
                                                      min(W / 432, H / 936),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5.0 * (H / 936),
                                            ),
                                            Text(
                                              'Rs.' + mynum.toString(),
                                              style: TextStyle(
                                                  fontSize: 20.0 * (W / 432),
                                                  color: Color.fromARGB(
                                                      255, 30, 28, 27)),
                                            )
                                          ],
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 20.0 * (W / 432),
                                      // ),
                                      SizedBox(
                                        width: 37.0 * (W / 432),
                                        height: 10.0 * (H / 936),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            20.0 * (W / 432),
                                            10.0 * (H / 936),
                                            30.0 * (W / 432),
                                            10.0 * (H / 936)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Highest Bid',
                                              style: TextStyle(
                                                  fontSize: 25.0 *
                                                      min(W / 432, H / 936),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5.0 * (H / 932),
                                            ),
                                            Text(
                                              'Rs.' + num.toString(),
                                              style: TextStyle(
                                                  fontSize: 20.0 * (H / 936)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.0 * H,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        20.0 * (W / 432),
                                        8.0 * (H / 936),
                                        20.0 * (W / 432),
                                        8.0 * (H / 936)),
                                    child: LinearProgressIndicator(
                                      value: _progressValue,
                                      borderRadius: BorderRadius.circular(10.0),
                                      backgroundColor: Colors.white,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0 * (H / 936),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0 * (W / 432), 0.0, 0.0, 0.0),
                                    child: Text(
                                      user.toString() +
                                          ' wins in ${countinmin.toString().padLeft(2,'0')}' +
                                          ":" +
                                          '${countinsec.toString().padLeft(2,'0')}',
                                      style: TextStyle(
                                          fontSize:
                                              20.0 * min(W / 432, H / 936)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0 * (H / 932),
                                  ),
                                  // Text('Ends in: ${countinmin ?? ''}' +
                                  //   'min,' +
                                  //   '${countinsec}' +
                                  //   'sec'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5 * (H / 936),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0 * W / 432, 0.0,
                                  8.0 * W / 432, 8.0 * W / 432),
                              child: _isButtonVisible
                                  ? Container(
                                      width: W,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _isButtonVisible = false;
                                              // Show GIF on bid submission
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black),
                                          child: Text('Place Bid',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0 * (H / 936),
                                              ))),
                                    )
                                  : TextField(
                                      controller: bid,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your bid...',
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      onSubmitted: (value) {
                                        // Handle submitted bid value here
                                        sendMessage(int.parse(bid.text));
                                        _showGif = true;
                                        setState(() {
                                          _isButtonVisible = true;
                                          bid.clear();
                                        });
                                        Future.delayed(
                                            Duration(milliseconds: 800), () {
                                          setState(() {
                                            _showGif =
                                                false; // Hide GIF after 2 seconds
                                          });
                                        });
                                      },
                                    ),
                            ),
                            //first row
                          ],
                        ),
                      ),
                    ), //container1

                    SizedBox(
                      height: 2 * (H / 936),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(
                          16 * (W / 432), 8, 16 * (W / 432), 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Users Registered:',
                                style: TextStyle(
                                    fontSize: 17 * (W / 432),
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 5 * (W / 432),
                              ),
                              Text(
                                widget.selectregisteredusers!.length
                                        .toString() +
                                    ' Users only',
                                style: TextStyle(
                                    fontSize: 16 * (W / 432),
                                    color: Color.fromARGB(255, 13, 159, 18),
                                    fontFamily: 'robotol',
                                    fontWeight: FontWeight.bold
                                    // ,letterSpacing: 1
                                    ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5 * (H / 936),
                          ),
                          Row(
                            children: [
                              Text(
                                'Base Price:',
                                style: TextStyle(
                                  fontSize: 17 * (W / 432),
                                  fontFamily: 'roboto',
                                ),
                              ),
                              SizedBox(
                                width: 5 * (W / 432),
                              ),
                              Text(
                                //here registered condition
                                widget.selectprice! + " Rupees",
                                style: TextStyle(
                                    fontSize: 16 * (W / 432),
                                    color: Color.fromARGB(255, 13, 159, 18),
                                    fontFamily: 'robotol',
                                    fontWeight: FontWeight.bold
                                    // ,letterSpacing: 1
                                    ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 2 * (H / 936),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(16 * (W / 432),
                          8 * (H / 936), 1 * (W / 432), 15 * (H / 936)),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 41,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.selectname!,
                                      style: TextStyle(
                                        fontFamily: 'robotom',
                                        fontSize: 24 * (W / 432),
                                      ),
                                    ),
                                    Text(
                                      widget.selectcategory!,
                                      style: TextStyle(
                                        fontFamily: 'robotol',
                                        fontSize: 14 * (W / 432),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 16,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () => {},
                                      icon: Icon(
                                        Icons.share,
                                        size: 30 * (W / 432),
                                      ),
                                    ),
                                    SizedBox(
                                      width: (1) * (W / 432),
                                    ),
                                    IconButton(
                                      onPressed: () => {},
                                      icon: Icon(
                                        Icons.bookmark_add_outlined,
                                        size: 30 * (W / 432),
                                        color: Colors.black87,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10 * (H / 936),
                          ),
                          Row(
                            children: [
                              Text(
                                'Item Details',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18 * (W / 432),
                                  fontFamily: 'roboto',
                                ),
                              ),
                            ],
                          ),
                          Text(widget.selectdesc!,
                              style: TextStyle(
                                  fontSize: 15 * (W / 432),
                                  color: Colors.grey[600],
                                  fontFamily: 'robotol',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (_showGif)
            Positioned.fill(
              child: Center(
                child: Container(
                  child: Image.network(
                    'https://media.giphy.com/media/l3q2y6pT00j9rBFGY/giphy.gif',
                    height: 200,
                    width: 200,
                    // Adjust height and width as needed
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
