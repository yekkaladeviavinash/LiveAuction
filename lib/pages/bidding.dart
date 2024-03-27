import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class bidding extends StatefulWidget {
    final String? selectpid;
  final String? selectimage;
  final String? selectcategory;
  final String? selectname;
  final String? selectprice;
  final String? selectdate;
  final String? selectdesc;
  const bidding({super.key,required this.selectpid,required this.selectimage,required this.selectcategory,required this.selectname,required this.selectprice,required this.selectdate,required this.selectdesc});

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

String? nameofuser;

  @override
  void initState() {
    super.initState();
    connect();
    getUserdetail();
    // startTimer();
  }
@override

void connect() {
  // socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
  socket = IO.io('http://10.81.65.74:3000', <String, dynamic>{
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
  });
}


  void sendMessage(int message) {
    socket!.emit('sendMessage', {
      'value': message,
      'user': nameofuser!,
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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 400.0,
                width: 560.0,
                child: Image.network(
                widget.selectimage!,
                fit: BoxFit.cover,
                scale: 1,
                height: 400,
                width: 500,
              ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Card(
                child: SizedBox(
                  height: 125.0,
                  width: 350.0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                            height: 50.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 40.0,
                              ),
                              Text(
                                'Rs.'+num.toString(),
                                style: TextStyle(fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 5.0,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            color: Colors.grey,
                            indent: 20,
                            endIndent: 20,
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
                      Text('Ends in: ${countdown ?? 'loading...'}'),
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