import 'package:flutter/material.dart';

class auctionPage extends StatefulWidget {
  const auctionPage({super.key});

  @override
  State<auctionPage> createState() => _auctionPageState();
}

class _auctionPageState extends State<auctionPage> {
  int highest_bid = 123456;
  int base_price = 100000;
  double _progressValue=0.0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double W = screenSize.width / 448.0;
    double H = screenSize.height / 973.33;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/auctionlogo.jpg'),
        title: const Text(
          'Bidding',
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 128)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0 * W, 10.0 * H, 10.0 * W, 10.0 * H),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50.0 * W,
                    backgroundImage: NetworkImage(
                        'https://www.bing.com/images/search?view=detailV2&ccid=g7oOP5qe&id=C3F17B78F7168593520CE4E8E307C1A648D8C238&thid=OIP.g7oOP5qeye4w5nz4x8FG1QHaEK&mediaurl=https%3a%2f%2fstaticg.sportskeeda.com%2feditor%2f2023%2f06%2ff2988-16880551809512-1920.jpg&exph=1078&expw=1920&q=six+eyes&simid=608018304397437387&FORM=IRPRST&ck=DAD6DD7BE148C9C2C1CCF932B5C4AD0E&selectedIndex=1&itb=0'),
                  ),
                  Column(
                    children: [
                      Card(
                        elevation: 10.0,
                        child: Column(
                          children: [
                            Text('Highest Bid'),
                            Text('$highest_bid')],
                        ),
                      ),
                      SizedBox(height: 10.0*H,),
                      Card(
                        elevation: 10.0,
                        child: Column(
                          children: [
                            Text('Base Price'),
                            Text('$base_price'),
                          ],
                          ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.0*H,),
              Card(
                elevation: 10.0,
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: _progressValue ,
                    )
                  ],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
