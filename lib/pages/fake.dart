import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'dart:async';

class Bidding extends StatefulWidget {
  const Bidding({
    Key? key,
  }) : super(key: key);

  @override
  State<Bidding> createState() => _BiddingState();
}

class _BiddingState extends State<Bidding> {
  final int yourBid = 23623478;
  int highestBid = 25678776;
  double _progressValue = 0.0;
  String highestBidder = 'Gojo Satoru';
  final int _totalTime = 120;
  final TextEditingController bid = TextEditingController();
  String timer = '45 min :00 sec';
  String itemName = 'Oil Painting';
  TextEditingController placeBid = TextEditingController();
  bool _isButtonVisible = true;
  String description =
      'The Six Eyes (六 (りく) 眼 (がん) , Rikugan?) is a rare ocular jujutsu inherited within the Gojo Family. It grants the user extraordinary perception and the ability to utilize the Limitless to its fullest potential. Satoru Gojo is the first sorcerer to be born with both the Limitless and the Six Eyes in the last hundred years. The Six Eyes were always bound to Master Tengen and the Star Plasma Vessel by fate';
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
    double W = screenSize.width / 448.0;
    double H = screenSize.height / 973.33;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bidding'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 350.0 * H,
                  width: 448.0 * W,
                  child: Image.network(
                    'https://i0.wp.com/makesomethingmondays.com/wp-content/uploads/2012/02/17_10_2007_0242713001192570506_leonid_afremov.jpg',
                    fit: BoxFit.cover,
                    scale: 1,
                    height: 600 * H,
                    width: 700 * W,
                  ),
                ),
                SizedBox(
                  height: 5.0 * H,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0 * W, 0.0, 8.0 * W, 0.0),
                  child: Container(
                    height: 200.0 * H,
                    width: 550.0 * W,
                    child: Card(
                      color: const Color.fromARGB(255, 228, 228, 228),
                      elevation: 10.0,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 5.0 * W,
                                height: 5.0 * H,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    40.0 * W, 15.0 * H, 20.0 * W, 10.0 * H),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Your bid',
                                      style: TextStyle(
                                          fontSize: 25.0 * min(W, H),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5.0 * H,
                                    ),
                                    Text(
                                      'Rs.' + '$yourBid',
                                      style: TextStyle(
                                          fontSize: 20.0 * W,
                                          color:
                                              Color.fromARGB(255, 30, 28, 27)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20.0 * W,
                              ),
                              VerticalDivider(
                                thickness: 120 * W,
                                width: 22.0 * W,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10.0 * W,
                                height: 10.0 * H,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    20.0 * W, 10.0 * H, 30.0 * W, 10.0 * H),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Highest Bid',
                                      style: TextStyle(
                                          fontSize: 25.0 * min(W, H),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5.0 * H,
                                    ),
                                    Text(
                                      'Rs.$highestBid',
                                      style: TextStyle(fontSize: 20.0 * H),
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
                                20.0 * W, 8.0 * H, 20.0 * W, 8.0 * H),
                            child: LinearProgressIndicator(
                              value: _progressValue,
                              borderRadius: BorderRadius.circular(10.0),
                              backgroundColor: Colors.white,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 0, 0, 128)),
                            ),
                          ),
                          SizedBox(
                            height: 10.0 * H,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(10.0 * W, 0.0, 0.0, 0.0),
                            child: Text(
                              '$highestBidder wins in ${((((1 - _progressValue) * 120) ~/ 60)).toString().padLeft(2, '0')}:${((((1 - _progressValue) * 120) % 60).toInt()).toString().padLeft(2, '0')} ',
                              style: TextStyle(fontSize: 20.0 * min(W, H)),
                            ),
                          ),
                          Text('Ends in: ${timer.substring(0, 2)}' +
                              ' min:' +
                              timer.substring(0, 2) +
                              ' sec'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(20.0 * W, 10.0 * H, 20.0 * W, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0 * H,
                      ),
                      Text(
                        itemName,
                        style: TextStyle(
                          fontSize: 25.0 * H,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0 * H,
                      ),
                      Text('Description:'),
                      Container(
                        height: 160.0 * H,
                        child: SingleChildScrollView(
                          child: Text(
                            description,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.0 * H,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0 * W),
                  child: _isButtonVisible
                      ? Container(
                          width: W * 448.0,
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
                                    fontSize: 20.0 * H,
                                  ))),
                        )
                      : TextField(
                          controller: bid,
                          decoration: InputDecoration(
                            hintText: 'Enter your bid...',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
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
                            Future.delayed(Duration(milliseconds: 800), () {
                              setState(() {
                                _showGif = false; // Hide GIF after 2 seconds
                              });
                            });
                          },
                        ),
                ),
              ],
            ),
          ),
          // Overlay GIF when _showGif is true


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