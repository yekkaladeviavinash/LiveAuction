
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
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
                height: 5,
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
                              onTap: () {
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
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40), // Border radius
                                    boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1), // Shadow color
                  spreadRadius: 0, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 5), // Offset in x and y axes
                ),
              ],
                                  ),
                                  
                                  child: Card(
                                    color: Color.fromARGB(255, 237, 235, 235),
                                    // color: Colors.white  ,
                                    // surfaceTintColor: Colors.transparent,   
                                    shadowColor: Colors.black,
                                    elevation: 0,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 125,
                                          height: 125,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Set border radius here
                                            image: DecorationImage(
                                              image: NetworkImage(cardData
                                                  .pimage), // Replace with your image URL
                                              fit: BoxFit
                                                  .cover, // Adjust image fit as needed
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.pname,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text('Rs.' + cardData.pprice),
                                              SizedBox(height: 5),      
                                              Text('Auction Date:' +
                                                  cardData.dateAdded),
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
                      ListView(
                        children: ctrl.productsshowinui2.map((cardData) {
                          return InkWell(
                            onTap: () {
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
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.transparent,
                                shadowColor: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Set border radius here
                                        image: DecorationImage(
                                          image: NetworkImage(cardData
                                              .pimage), // Replace with your image URL
                                          fit: BoxFit
                                              .cover, // Adjust image fit as needed
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardData.pname,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text('Rs.' + cardData.pprice),
                                          SizedBox(height: 5),
                                          Text('Auction Date:' +
                                              cardData.dateAdded),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      ListView(
                        children: ctrl.productsshowinui3.map((cardData) {
                          return InkWell(
                            onTap: () {
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
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.transparent,
                                shadowColor: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Set border radius here
                                        image: DecorationImage(
                                          image: NetworkImage(cardData
                                              .pimage), // Replace with your image URL
                                          fit: BoxFit
                                              .cover, // Adjust image fit as needed
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardData.pname,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text('Rs.' + cardData.pprice),
                                          SizedBox(height: 5),
                                          Text('Auction Date:' +
                                              cardData.dateAdded),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      ListView(
                        children: ctrl.productsshowinui4.map((cardData) {
                          return InkWell(
                            onTap: () {
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
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.transparent,
                                shadowColor: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Set border radius here
                                        image: DecorationImage(
                                          image: NetworkImage(cardData
                                              .pimage), // Replace with your image URL
                                          fit: BoxFit
                                              .cover, // Adjust image fit as needed
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardData.pname,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text('Rs.' + cardData.pprice),
                                          SizedBox(height: 5),
                                          Text('Auction Date:' +
                                              cardData.dateAdded),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                  
                  
                  
                      
                      ListView(
                        children: ctrl.productsshowinui5.map((cardData) {
                          return InkWell(
                            onTap: () {
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
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.transparent,
                                shadowColor: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Set border radius here
                                        image: DecorationImage(
                                          image: NetworkImage(cardData
                                              .pimage), // Replace with your image URL
                                          fit: BoxFit
                                              .cover, // Adjust image fit as needed
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardData.pname,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text('Rs.' + cardData.pprice),
                                          SizedBox(height: 5),
                                          Text('Auction Date:' +
                                              cardData.dateAdded),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      ListView(
                        physics: BouncingScrollPhysics(),
                        children: ctrl.productsshowinui6.map((cardData) {
                          return InkWell(
                            onTap: () {
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
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Card(
                                  color: Colors.white,
                                  surfaceTintColor: Colors.transparent,
                                  shadowColor: Colors.black,
                                  // elevation: 2,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 125,
                                        height: 125,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set border radius here
                                          image: DecorationImage(
                                            image: NetworkImage(cardData
                                                .pimage), // Replace with your image URL
                                            fit: BoxFit
                                                .cover, // Adjust image fit as needed
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cardData.pname,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text('Rs.' + cardData.pprice),
                                            SizedBox(height: 5),
                                            Text('Auction Date:' +
                                                cardData.dateAdded),
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
                      ListView(
                        children: ctrl.productsshowinui7.map((cardData) {
                          return InkWell(
                            onTap: () {
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
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.transparent,
                                shadowColor: Colors.white,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Set border radius here
                                        image: DecorationImage(
                                          image: NetworkImage(cardData
                                              .pimage), // Replace with your image URL
                                          fit: BoxFit
                                              .cover, // Adjust image fit as needed
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cardData.pname,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text('Rs.' + cardData.pprice),
                                          SizedBox(height: 5),
                                          Text('Auction Date:' +
                                              cardData.dateAdded),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      )
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

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String query = '';

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: TextField(
        onChanged: onQueryChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          labelText: 'Search',
          labelStyle: TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
