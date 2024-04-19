import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:liveauction/pages/itempage.dart';
import 'package:liveauction/pages/seller_controller.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> data = [];
  List<String> list = [
    'collectibles',
    'antiques',
    'art',
    'electronics',
    'books',
    'sport',
    'others',
  ];
  List<String> searchdata = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];

  List<String> searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = searchdata
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

//

//

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    return GetBuilder<Sellercontroller>(builder: (ctrl) {
      TabController _tabcontroller = TabController(length: 7, vsync: this);
      return Scaffold(
        resizeToAvoidBottomInset: false,



        appBar: AppBar(
          // backgroundColor: Colors.grey.shade600,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Text('Live Auction',
            style: TextStyle(color: Colors.black,),
            ),
          ),
          leading: Padding(
            padding:  EdgeInsets.fromLTRB(20*(W/432), 8, 0, 8),
            child: CircleAvatar(
              radius: 1*(W/432),
              backgroundImage: AssetImage('assets/hammer.jpeg'),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search)),
          ],
        ),




        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        10.0), // Change bottom-left border radius here
                    topRight: Radius.circular(
                        10.0), // Change bottom-right border radius here
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: TabBar(
                    overlayColor: MaterialStatePropertyAll(Colors.white),
                    splashBorderRadius: BorderRadius.circular(100),
                    splashFactory:
                        InkSparkle.constantTurbulenceSeedSplashFactory,
                    labelPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    unselectedLabelColor: Colors.grey.shade600,
                    controller: _tabcontroller,
                    isScrollable: true,
                    indicatorColor: Colors.black,
                    dividerColor: Colors.grey.shade600,
                    dividerHeight: 0,
                    indicatorPadding: EdgeInsets.fromLTRB(8, 20, 8, 0),
                    labelColor: Colors.black87,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(
                        child: Container(
                          // margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Articrafts',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Antiques',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Books',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Collectibles',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Electronics',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Sports',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Others',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5*(H/936),
              ),
              Expanded(
                // Use Expanded to fill remaining space
                child: Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabcontroller,
                    children: [
                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onRefresh: () async {
                          await ctrl.refreshPage();
                        },
                        child: ListView(
                          children: ctrl.productsshowinui1.map((cardData) {
                            return InkWell(
                              onTap: (){
                                ctrl.userreg=false;
                                ctrl.userwish=false;
                                ctrl.checkwishliststatus(cardData.pid);
                                ctrl.checkregstatus(cardData.pid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      selectpid: cardData.pid,
                                      selectimage: cardData.pimage,
                                      selectcategory: cardData.pcategory,
                                      selectname: cardData.pname,
                                      selectprice: cardData.pprice,
                                      selectdate: cardData.dateAdded,
                                      selectdesc: cardData.pdesc,
                                      selectptime: cardData.ptime,
                                      selectlocation: cardData.location,
                                      selectregisteredusers: cardData.registeredusers,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8*(W/432), 4*(H/936), 8*(W/432), 4*(H/936)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20*(W/432)), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.1), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(
                                            0, 5), // Offset in x and y axes
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    // color: Color.fromARGB(255, 237, 235, 235),
                                    color: Colors.white,
                                    // surfaceTintColor: Colors.transparent,
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8*(W/432)),
                                          child: Container(
                                            width: 130*(W/432),
                                            height: 130*(W/432),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(
                                                          0.5), // Shadow color
                                                  spreadRadius:
                                                      1, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: Offset(5,
                                                      -3), // Offset in x and y axes
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(
                                                  10*(W/432)), // Set border radius here
                                              image: DecorationImage(
                                                image: NetworkImage(cardData
                                                    .pimage), // Replace with your image URL
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20*(W/432)),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                    fontSize: 17 * (W / 432),
                                                    fontFamily: 'roboto',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              SizedBox(height: 3*(H/936)),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Base Price: ',
                                                    style: TextStyle(
                                                    
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Rs.' + cardData.pprice,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        
                                                        color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        
                                                        ),
                                                  )
                                                ],
                                              ),
                                              
                                              Row(
                                                children: [
                                                  Text(
                                                    'Auction Date: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    cardData.dateAdded,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "Roorkee",
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
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
                          }).toList(),
                        ),
                      ),


                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onRefresh: () async {
                          await ctrl.refreshPage();
                        },
                        child: ListView(
                          children: ctrl.productsshowinui2.map((cardData){
                            return InkWell(
                              onTap: () {
                                ctrl.userreg=false;
                                ctrl.userwish=false;
                                ctrl.checkwishliststatus(cardData.pid);
                                ctrl.checkregstatus(cardData.pid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      selectpid: cardData.pid,
                                      selectimage: cardData.pimage,
                                      selectcategory: cardData.pcategory,
                                      selectname: cardData.pname,
                                      selectprice: cardData.pprice,
                                      selectdate: cardData.dateAdded,
                                      selectdesc: cardData.pdesc,
                                      selectptime: cardData.ptime,
                                      selectlocation: cardData.location,
                                      selectregisteredusers: cardData.registeredusers,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8*(W/432), 4*(H/936), 8*(W/432), 4*(H/936)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20*(W/432)), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.1), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(
                                            0, 5), // Offset in x and y axes
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    // color: Color.fromARGB(255, 237, 235, 235),
                                    color: Colors.white,
                                    // surfaceTintColor: Colors.transparent,
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8*(W/432)),
                                          child: Container(
                                            width: 130*(W/432),
                                            height: 130*(W/432),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(
                                                          0.5), // Shadow color
                                                  spreadRadius:
                                                      1, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: Offset(5,
                                                      -3), // Offset in x and y axes
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(
                                                  10*(W/432)), // Set border radius here
                                              image: DecorationImage(
                                                image: NetworkImage(cardData
                                                    .pimage), // Replace with your image URL
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20*(W/432)),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                    fontSize: 17 * (W / 432),
                                                    fontFamily: 'roboto',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              SizedBox(height: 3*(H/936)),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Base Price: ',
                                                    style: TextStyle(
                                                    
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Rs.' + cardData.pprice,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        
                                                        color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        
                                                        ),
                                                  )
                                                ],
                                              ),
                                              
                                              Row(
                                                children: [
                                                  Text(
                                                    'Auction Date: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    cardData.dateAdded,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "Roorkee",
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
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
                          }).toList(),
                        ),
                      ),
                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onRefresh: () async {
                          await ctrl.refreshPage();
                        },
                        child: ListView(
                          children: ctrl.productsshowinui3.map((cardData) {
                            return InkWell(
                              onTap: () {
                                ctrl.userreg=false;
                                ctrl.userwish=false;
                                ctrl.checkwishliststatus(cardData.pid);
                                ctrl.checkregstatus(cardData.pid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      selectpid: cardData.pid,
                                      selectimage: cardData.pimage,
                                      selectcategory: cardData.pcategory,
                                      selectname: cardData.pname,
                                      selectprice: cardData.pprice,
                                      selectdate: cardData.dateAdded,
                                      selectdesc: cardData.pdesc,
                                      selectptime: cardData.ptime,
                                      selectlocation: cardData.location,
                                      selectregisteredusers: cardData.registeredusers,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8*(W/432), 4*(H/936), 8*(W/432), 4*(H/936)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20*(W/432)), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.1), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(
                                            0, 5), // Offset in x and y axes
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    // color: Color.fromARGB(255, 237, 235, 235),
                                    color: Colors.white,
                                    // surfaceTintColor: Colors.transparent,
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8*(W/432)),
                                          child: Container(
                                            width: 130*(W/432),
                                            height: 130*(W/432),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(
                                                          0.5), // Shadow color
                                                  spreadRadius:
                                                      1, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: Offset(5,
                                                      -3), // Offset in x and y axes
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(
                                                  10*(W/432)), // Set border radius here
                                              image: DecorationImage(
                                                image: NetworkImage(cardData
                                                    .pimage), // Replace with your image URL
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20*(W/432)),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                    fontSize: 17 * (W / 432),
                                                    fontFamily: 'roboto',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              SizedBox(height: 3*(H/936)),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Base Price: ',
                                                    style: TextStyle(
                                                    
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Rs.' + cardData.pprice,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        
                                                        color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        
                                                        ),
                                                  )
                                                ],
                                              ),
                                              
                                              Row(
                                                children: [
                                                  Text(
                                                    'Auction Date: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    cardData.dateAdded,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "Roorkee",
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
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
                          }).toList(),
                        ),
                      ),
                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onRefresh: () async {
                          await ctrl.refreshPage();
                        },
                        child: ListView(
                          children: ctrl.productsshowinui4.map((cardData) {
                            return InkWell(
                              onTap: () {
                                ctrl.userreg=false;
                                ctrl.userwish=false;
                                ctrl.checkwishliststatus(cardData.pid);
                                ctrl.checkregstatus(cardData.pid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      selectpid: cardData.pid,
                                      selectimage: cardData.pimage,
                                      selectcategory: cardData.pcategory,
                                      selectname: cardData.pname,
                                      selectprice: cardData.pprice,
                                      selectdate: cardData.dateAdded,
                                      selectdesc: cardData.pdesc,
                                      selectptime: cardData.ptime,
                                      selectlocation: cardData.location,
                                      selectregisteredusers: cardData.registeredusers,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8*(W/432), 4*(H/936), 8*(W/432), 4*(H/936)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20*(W/432)), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.1), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(
                                            0, 5), // Offset in x and y axes
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    // color: Color.fromARGB(255, 237, 235, 235),
                                    color: Colors.white,
                                    // surfaceTintColor: Colors.transparent,
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8*(W/432)),
                                          child: Container(
                                            width: 130*(W/432),
                                            height: 130*(W/432),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(
                                                          0.5), // Shadow color
                                                  spreadRadius:
                                                      1, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: Offset(5,
                                                      -3), // Offset in x and y axes
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(
                                                  10*(W/432)), // Set border radius here
                                              image: DecorationImage(
                                                image: NetworkImage(cardData
                                                    .pimage), // Replace with your image URL
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20*(W/432)),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                    fontSize: 17 * (W / 432),
                                                    fontFamily: 'roboto',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              SizedBox(height: 3*(H/936)),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Base Price: ',
                                                    style: TextStyle(
                                                    
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Rs.' + cardData.pprice,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        
                                                        color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        
                                                        ),
                                                  )
                                                ],
                                              ),
                                              
                                              Row(
                                                children: [
                                                  Text(
                                                    'Auction Date: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    cardData.dateAdded,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "Roorkee",
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
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
                          }).toList(),
                        ),
                      ),
                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onRefresh: () async {
                          await ctrl.refreshPage();
                        },
                        child: ListView(
                          children: ctrl.productsshowinui5.map((cardData) {
                            return InkWell(
                              onTap: () {
                                ctrl.userreg=false;
                                ctrl.userwish=false;
                                ctrl.checkwishliststatus(cardData.pid);
                                ctrl.checkregstatus(cardData.pid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      selectpid: cardData.pid,
                                      selectimage: cardData.pimage,
                                      selectcategory: cardData.pcategory,
                                      selectname: cardData.pname,
                                      selectprice: cardData.pprice,
                                      selectdate: cardData.dateAdded,
                                      selectdesc: cardData.pdesc,
                                      selectptime: cardData.ptime,
                                      selectlocation: cardData.location,
                                      selectregisteredusers: cardData.registeredusers,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8*(W/432), 4*(H/936), 8*(W/432), 4*(H/936)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20*(W/432)), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.1), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(
                                            0, 5), // Offset in x and y axes
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    // color: Color.fromARGB(255, 237, 235, 235),
                                    color: Colors.white,
                                    // surfaceTintColor: Colors.transparent,
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8*(W/432)),
                                          child: Container(
                                            width: 130*(W/432),
                                            height: 130*(W/432),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(
                                                          0.5), // Shadow color
                                                  spreadRadius:
                                                      1, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: Offset(5,
                                                      -3), // Offset in x and y axes
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(
                                                  10*(W/432)), // Set border radius here
                                              image: DecorationImage(
                                                image: NetworkImage(cardData
                                                    .pimage), // Replace with your image URL
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20*(W/432)),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                    fontSize: 17 * (W / 432),
                                                    fontFamily: 'roboto',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              SizedBox(height: 3*(H/936)),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Base Price: ',
                                                    style: TextStyle(
                                                    
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Rs.' + cardData.pprice,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        
                                                        color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        
                                                        ),
                                                  )
                                                ],
                                              ),
                                              
                                              Row(
                                                children: [
                                                  Text(
                                                    'Auction Date: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    cardData.dateAdded,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "Roorkee",
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
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
                          }).toList(),
                        ),
                      ),
                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onRefresh: () async {
                          await ctrl.refreshPage();
                        },
                        child: ListView(
                          children: ctrl.productsshowinui6.map((cardData) {
                            return InkWell(
                              onTap: () {
                                ctrl.userreg=false;
                                ctrl.userwish=false;
                                ctrl.checkwishliststatus(cardData.pid);
                                ctrl.checkregstatus(cardData.pid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      selectpid: cardData.pid,
                                      selectimage: cardData.pimage,
                                      selectcategory: cardData.pcategory,
                                      selectname: cardData.pname,
                                      selectprice: cardData.pprice,
                                      selectdate: cardData.dateAdded,
                                      selectdesc: cardData.pdesc,
                                      selectptime: cardData.ptime,
                                      selectlocation: cardData.location,
                                      selectregisteredusers: cardData.registeredusers,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8*(W/432), 4*(H/936), 8*(W/432), 4*(H/936)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20*(W/432)), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.1), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(
                                            0, 5), // Offset in x and y axes
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    // color: Color.fromARGB(255, 237, 235, 235),
                                    color: Colors.white,
                                    // surfaceTintColor: Colors.transparent,
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8*(W/432)),
                                          child: Container(
                                            width: 130*(W/432),
                                            height: 130*(W/432),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(
                                                          0.5), // Shadow color
                                                  spreadRadius:
                                                      1, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: Offset(5,
                                                      -3), // Offset in x and y axes
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(
                                                  10*(W/432)), // Set border radius here
                                              image: DecorationImage(
                                                image: NetworkImage(cardData
                                                    .pimage), // Replace with your image URL
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20*(W/432)),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                    fontSize: 17 * (W / 432),
                                                    fontFamily: 'roboto',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              SizedBox(height: 3*(H/936)),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Base Price: ',
                                                    style: TextStyle(
                                                    
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Rs.' + cardData.pprice,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        
                                                        color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        
                                                        ),
                                                  )
                                                ],
                                              ),
                                              
                                              Row(
                                                children: [
                                                  Text(
                                                    'Auction Date: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    cardData.dateAdded,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "Roorkee",
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
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
                          }).toList(),
                        ),
                      ),
                      RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onRefresh: () async {
                          await ctrl.refreshPage();
                        },
                        child: ListView(
                          children: ctrl.productsshowinui7.map((cardData) {
                            return InkWell(
                              onTap: () {
                                ctrl.userreg=false;
                                ctrl.userwish=false;
                                ctrl.checkwishliststatus(cardData.pid);
                                ctrl.checkregstatus(cardData.pid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => itempage(
                                      selectpid: cardData.pid,
                                      selectimage: cardData.pimage,
                                      selectcategory: cardData.pcategory,
                                      selectname: cardData.pname,
                                      selectprice: cardData.pprice,
                                      selectdate: cardData.dateAdded,
                                      selectdesc: cardData.pdesc,
                                      selectptime: cardData.ptime,
                                      selectlocation: cardData.location,
                                      selectregisteredusers: cardData.registeredusers,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8*(W/432), 4*(H/936), 8*(W/432), 4*(H/936)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20*(W/432)), // Border radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.1), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(
                                            0, 5), // Offset in x and y axes
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    // color: Color.fromARGB(255, 237, 235, 235),
                                    color: Colors.white,
                                    // surfaceTintColor: Colors.transparent,
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8*(W/432)),
                                          child: Container(
                                            width: 130*(W/432),
                                            height: 130*(W/432),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(
                                                          0.5), // Shadow color
                                                  spreadRadius:
                                                      1, // Spread radius
                                                  blurRadius: 5, // Blur radius
                                                  offset: Offset(5,
                                                      -3), // Offset in x and y axes
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(
                                                  10*(W/432)), // Set border radius here
                                              image: DecorationImage(
                                                image: NetworkImage(cardData
                                                    .pimage), // Replace with your image URL
                                                fit: BoxFit
                                                    .cover, // Adjust image fit as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20*(W/432)),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                    fontSize: 17 * (W / 432),
                                                    fontFamily: 'roboto',
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              SizedBox(height: 3*(H/936)),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Base Price: ',
                                                    style: TextStyle(
                                                    
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    'Rs.' + cardData.pprice,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        
                                                        color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        
                                                        ),
                                                  )
                                                ],
                                              ),
                                              
                                              Row(
                                                children: [
                                                  Text(
                                                    'Auction Date: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    cardData.dateAdded,
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * (W / 432),
                                                        fontFamily: 'roboto',
                                                        fontWeight:
                                                            FontWeight.w900),
                                                  ),
                                                  Text(
                                                    "Roorkee",
                                                    style: TextStyle(
                                                        fontSize:
                                                            15 * (W / 432),
                                                        color: Colors.grey[600],
                                                        fontFamily: 'robotol',
                                                        fontWeight:
                                                            FontWeight.bold
                                                        // ,letterSpacing: 1
                                                        ),
                                                  )
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
                          }).toList(),
                        ),
                      ),





                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class NextScreen extends StatelessWidget {
  final Map<String, dynamic> cardData;

  NextScreen(this.cardData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Title: ${cardData['title']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${cardData['description']}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(title: Text(result));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(title: Text(result));
        });
  }

  @override
  void showResults(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => itempage(
                selectpid: '123456',
                selectimage: '123456',
                selectcategory: 'Sports',
                selectname: query,
                selectprice: '123456',
                selectdate: '121212',
                selectdesc: 'qwidjxasjxksxklsax',
                selectptime: 1234,selectregisteredusers: [0],
                selectlocation: 'Hyderabad')));
  }
}