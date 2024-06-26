import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';

class bidding extends StatefulWidget {
  final String? selectpid;
  final String? selectimage;
  final String? selectcategory;
  final String? selectname;
  final String? selectprice;
  final String? selectdate;
  final String? selectdesc;
  const bidding(
      {super.key,
      required this.selectpid,
      required this.selectimage,
      required this.selectcategory,
      required this.selectname,
      required this.selectprice,
      required this.selectdate,
      required this.selectdesc});

  @override
  State<bidding> createState() => _biddingState();
}

class _biddingState extends State<bidding> {
  // final int base_price = 23623478;
  // int highest_bid = 25678776;
  // String highest_bidder = 'Gojo Satoru';
  // String timer = '45 min :00 sec';
  // String item_name = 'Six Eyes';
  TextEditingController place_bid = TextEditingController();
  // String description = widget.selectdesc!;

  IO.Socket? socket;
  int? num;
  String? user;
  int? countdown;
  int? countinmin;
  int? countinsec;
  var uuidofuser = Uuid().v1();

  String? nameofuser;
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
      print('connected with frontend');
      socket!.on("timer", (timer) {
        print(timer);
        setState(() {
          countdown = timer;
          countinmin = (countdown! / 60).toInt();
          countinsec = countdown! % 60;
        });
      });
      socket!.on("sendMsgServer", (message) {
        print(message);
        setState(() {
          num = message['value'];
          user = message['user'];
          print(user);
        });
      });
      socket!.on("auctionover", (message) {
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

  void sendMessage(int message) {
    socket!.emit('sendMessage', {
      'value': message,
      'user': nameofuser!,
      'userid': uuidofuser,
    });
  }

  void getUserdetail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      nameofuser = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double W = screenSize.width / 448.0;
    double H = screenSize.height / 973.33;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 300.0 * H,
                width: 560.0 * W,
                child: Image.network(
                  widget.selectimage!,
                  fit: BoxFit.cover,
                  scale: 1,
                  height: 400 * H,
                  width: 500 * W,
                ),
              ),
              SizedBox(
                height: 30.0 * H,
              ),
              Card(
                child: SizedBox(
                  height: 125.0 * H,
                  width: 350.0 * W,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0 * W,
                            height: 50.0 * H,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.0 * H,
                              ),
                              Text(
                                'Rs.' + num.toString(),
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 5.0 * H,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40.0 * W,
                          ),
                          const SizedBox(
                            width: 10.0,
                            height: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text('Highest Bid by'),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                user.toString(),
                                style: TextStyle(fontSize: 25.0),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text('Ends in: ${countinmin ?? ''}' +
                          'min,' +
                          '${countinsec}' +
                          'sec'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.selectname!,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description:'),
                          Text(
                            widget.selectdesc!,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: place_bid,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Place Bid',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 216, 97, 29)),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                sendMessage(int.parse(place_bid.text));
                place_bid.clear();
              },
              icon: Icon(
                Icons.send,
              ),
            ),
          ],
        ),
      ),
    );
  }
}