import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'dart:async';

class auctionpage extends StatefulWidget {
  final String? selectpid;
  final String? selectimage;
  final String? selectcategory;
  final String? selectname;
  final String? selectprice;
  final String? selectdate;
  final String? selectdesc;
  final List? selectregisteredusers;
  const auctionpage({super.key,
      required this.selectpid,
      required this.selectimage,
      required this.selectcategory,
      required this.selectname,
      required this.selectprice,
      required this.selectdate,
      required this.selectdesc,
      required this.selectregisteredusers,
      });

  @override
  State<auctionpage> createState() => _auctionpageState();
}

class _auctionpageState extends State<auctionpage> {
  final int yourBid = 23623478;
  int highestBid = 25678776;
  double _progressValue = 0.0;
  String highestBidder = 'Gojo Satoru';
  final int _totalTime = 120;
  final TextEditingController bid = TextEditingController();
  String timer = '45 min :00 sec';
  // String itemName = 'Oil Painting';
  // TextEditingController placeBid = TextEditingController();
  bool _isButtonVisible = true;
  // String description =
  //     'The Six Eyes (六 (りく) 眼 (がん) , Rikugan?) is a rare ocular jujutsu inherited within the Gojo Family. It grants the user extraordinary perception and the ability to utilize the Limitless to its fullest potential. Satoru Gojo is the first sorcerer to be born with both the Limitless and the Six Eyes in the last hundred years. The Six Eyes were always bound to Master Tengen and the Star Plasma Vessel by fate';
  bool _showGif = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _progressValue = timer.tick / _totalTime;
        if (_progressValue >= 1.0) {
          _progressValue = 0.0;
          _startTimer();
        }
      });
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
                                              'Rs.' + '$yourBid',
                                              style: TextStyle(
                                                  fontSize: 20.0 * (W / 432),
                                                  color: Color.fromARGB(
                                                      255, 30, 28, 27)),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0 * (W / 432),
                                      ),
                                      SizedBox(
                                        width: 10.0 * (W / 432),
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
                                              'Rs.$highestBid',
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
                                      '$highestBidder wins in ${((((1 - _progressValue) * 120) ~/ 60)).toString().padLeft(2, '0')}:${((((1 - _progressValue) * 120) % 60).toInt()).toString().padLeft(2, '0')} ',
                                      style: TextStyle(
                                          fontSize:
                                              20.0 * min(W / 432, H / 936)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0 * (H / 932),
                                  ),
                                  Text('Ends in: ${timer.substring(0, 2)}' +
                                      ' min:' +
                                      timer.substring(0, 2) +
                                      ' sec'),
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
                                widget.selectregisteredusers!.length.toString()+' Users only',
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
                                widget.selectprice!+" Rupees",
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
                          8 * (H / 936), 16 * (W / 432), 15 * (H / 936)),
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
                          Text(
                            widget.selectdesc!,
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