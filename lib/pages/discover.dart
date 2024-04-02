// // import 'package:flutter/material.dart';
// // import 'package:liveauction/pages/seller_controller.dart';
// // import 'package:get/get.dart';

// // class Discover extends StatefulWidget {
// //   const Discover({super.key});

// //   @override
// //   State<Discover> createState() => _DiscoverState();
// // }

// // class _DiscoverState extends State<Discover> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetBuilder<Sellercontroller>(builder: (ctrl) {
// //         return Scaffold(
// //           appBar: AppBar(
// //             title: Text('Discover'),
// //           ),
// //           body: Container(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 Text(ctrl.cameproducts[0].pname),
// //                 Text(ctrl.cameproducts[0].pdesc),
// //                 Text(ctrl.cameproducts[0].pprice)
// //               ],
// //             ),
            
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }



// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:liveauction/pages/itempage.dart';
// import 'package:liveauction/pages/seller_controller.dart';

// class Discover extends StatefulWidget {
//   const Discover({Key? key}) : super(key: key);

//   @override
//   State<Discover> createState() => _DiscoverState();
// }

// class _DiscoverState extends State<Discover>
//     with TickerProviderStateMixin {
//   final List<Map<String, dynamic>> data = [];
//   List<String> searchdata = [
//     'Apple',
//     'Banana',
//     'Cherry',
//     'Date',
//     'Elderberry',
//     'Fig',
//     'Grapes',
//     'Honeydew',
//     'Kiwi',
//     'Lemon',
//   ];

//   List<String> searchResults = [];

//   void onQueryChanged(String query) {
//     setState(() {
//       searchResults = searchdata
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   void inintstate(){
//     super.initState();
//     // Sellercontroller.getproduct();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<Sellercontroller>(builder: (ctrl) {
//       ctrl.getproduct();
//     TabController _tabcontroller = TabController(length: 7, vsync: this);
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
//               child: Text(
//                 'Live auction',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             SearchBar(),

//             // SizedBox(height: 100),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(
//                       10.0), // Change bottom-left border radius here
//                   topRight: Radius.circular(
//                       10.0), // Change bottom-right border radius here
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
//                 child: TabBar(
//                   padding: EdgeInsets.all(0),
//                   overlayColor: MaterialStatePropertyAll(Colors.white),
//                   splashBorderRadius: BorderRadius.circular(100),
//                   splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
//                   labelPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
//                   unselectedLabelColor: Colors.white,
//                   controller: _tabcontroller,
//                   isScrollable: true,
//                   // indicatorColor: Color.fromARGB(255, 243, 108, 31),
//                   indicatorColor: Color.fromARGB(255, 240, 165, 0),
//                   dividerColor: Colors.white,
//                   dividerHeight: 0,
//                   indicatorPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),

//                   // labelColor: Color.fromARGB(255, 243, 108, 31),
//                   labelColor: Color.fromARGB(255, 237, 176, 71),
//                   tabAlignment: TabAlignment.start,
//                   tabs: [
//                     Tab(
//                       //text: 'ART',
//                       //icon: Icon(s),
//                       height: 47,
                    
//                       child: Container(
//                         margin: EdgeInsets.all(0),
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 38, 42, 86),
//                           // color:Colors.black,
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: Color.fromARGB(
//                                 58, 56, 55, 55), // Set border color here
//                             // color: Colors.black, // Set border color here
//                             width: 2.0, // Set border width here
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 size: 33,
//                               ),
//                               Text(
//                                 'COLLECTIBLES',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       height: 40,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 38, 42, 86),
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: Color.fromARGB(
//                                 58, 56, 55, 55), // Set border color here
//                             // color: Colors.black, // Set border color here
//                             width: 2.0, // Set border width here
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 size: 33,
//                               ),
//                               Text(
//                                 'ANTIQUES',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       //text: 'ART',
//                       //icon: Icon(s),
//                       height: 45,
//                       iconMargin: EdgeInsets.all(0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 38, 42, 86),
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: Color.fromARGB(
//                                 58, 56, 55, 55), // Set border color here
//                             width: 2.0, // Set border width here
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 size: 33,
//                               ),
//                               Text(
//                                 'ART',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       //text: 'ART',
//                       //icon: Icon(s),
//                       height: 40,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 38, 42, 86),
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: Color.fromARGB(
//                                 58, 56, 55, 55), // Set border color here
//                             // color: Colors.black, // Set border color here
//                             width: 2.0, // Set border width here
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 size: 33,
//                               ),
//                               Text(
//                                 'ELECTRONICS',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       height: 40,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 38, 42, 86),
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: Color.fromARGB(
//                                 58, 56, 55, 55), // Set border color here
//                             // color: Colors.black, // Set border color here
//                             width: 2.0, // Set border width here
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 size: 33,
//                               ),
//                               Text(
//                                 'BOOKS',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       //text: 'ART',
//                       //icon: Icon(s),
//                       height: 40,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 38, 42, 86),
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: Color.fromARGB(
//                                 58, 56, 55, 55), // Set border color here
//                             // color: Colors.black, // Set border color here
//                             width: 2.0, // Set border width here
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 size: 33,
//                               ),
//                               Text(
//                                 'SPORT EQUIPMENT',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       //text: 'ART',
//                       //icon: Icon(s),
//                       height: 40,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 38, 42, 86),
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(
//                             color: Color.fromARGB(
//                                 58, 56, 55, 55), // Set border color here
//                             // color: Colors.black, // Set border color here
//                             width: 2.0, // Set border width here
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.search,
//                                 size: 33,
//                               ),
//                               Text(
//                                 'OTHERS',
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Expanded(
//               // Use Expanded to fill remaining space
//               child: Container(
//                 color: Colors.white,
//                 width: double.maxFinite,
//                 child: TabBarView(
//                   controller: _tabcontroller,
//                   children: [
//                     ListView(
//                       children: ctrl.cameproducts.map((cardData) {
//                         return InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => itempage(),
//                               ),
//                             );
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//                             child: Card(
//                               color: Colors.white,
//                               surfaceTintColor: Colors.transparent,
//                               shadowColor: Colors.white,
//                               elevation: 0,
//                               child: Row(
//                                 children: [
//                                   // ClipRRect(
//                                   //   borderRadius: BorderRadius.circular(10.0), // Set border radius here
//                                   //   child: Image.network(
//                                   //     cardData.pimage, // Replace with your image URL
//                                   //     width: 200,
//                                   //     height: 200,
//                                   //     fit: BoxFit.cover, // Adjust image fit as needed
//                                   //   ),
//                                   // ),
//                                   Container(
//                                     width: 125,
//                                     height: 125,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10.0), // Set border radius here
//                                       image: DecorationImage(
//                                         image: NetworkImage(cardData.pimage), // Replace with your image URL
//                                         fit: BoxFit.cover, // Adjust image fit as needed
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 10),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           cardData.pname,
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text('Rs.'+cardData.pprice),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
                     
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     });
//   }
// }

// class NextScreen extends StatelessWidget {
//   final Map<String, dynamic> cardData;

//   NextScreen(this.cardData);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Title: ${cardData['title']}',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Description: ${cardData['description']}',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchBar extends StatefulWidget {
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   String query = '';

//   void onQueryChanged(String newQuery) {
//     setState(() {
//       query = newQuery;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
//       child: TextField(
//         onChanged: onQueryChanged,
//         cursorColor: Color.fromARGB(255, 216, 97, 29),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 10.0),
//           labelText: 'Search',
//           labelStyle: TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Color.fromARGB(255, 216, 97, 29)),
//           ),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//           prefixIcon: Icon(Icons.search),
//         ),
//       ),
//     );
//   }
// }








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

class _DiscoverState extends State<Discover>
    with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Sellercontroller>(builder: (ctrl) {
    TabController _tabcontroller = TabController(length: 7, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                'Live auction',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SearchBar(),

            // SizedBox(height: 100),
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
                  padding: EdgeInsets.all(0),
                  overlayColor: MaterialStatePropertyAll(Colors.white),
                  splashBorderRadius: BorderRadius.circular(100),
                  splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                  labelPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  unselectedLabelColor: Colors.white,
                  controller: _tabcontroller,
                  isScrollable: true,
                  // indicatorColor: Color.fromARGB(255, 243, 108, 31),
                  indicatorColor: Color.fromARGB(255, 240, 165, 0),
                  dividerColor: Colors.white,
                  dividerHeight: 0,
                  indicatorPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),

                  // labelColor: Color.fromARGB(255, 243, 108, 31),
                  labelColor: Color.fromARGB(255, 237, 176, 71),
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      height: 47,
                      child: Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 42, 86),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color.fromARGB(
                                58, 56, 55, 55), // Set border color here
                            // color: Colors.black, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 33,
                              ),
                              Text(
                                'COLLECTIBLES',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 42, 86),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color.fromARGB(
                                58, 56, 55, 55), // Set border color here
                            // color: Colors.black, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 33,
                              ),
                              Text(
                                'ANTIQUES',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      //text: 'ART',
                      //icon: Icon(s),
                      height: 45,
                      iconMargin: EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 42, 86),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color.fromARGB(
                                58, 56, 55, 55), // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 33,
                              ),
                              Text(
                                'ART',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 42, 86),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color.fromARGB(
                                58, 56, 55, 55), // Set border color here
                            // color: Colors.black, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 33,
                              ),
                              Text(
                                'ELECTRONICS',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 42, 86),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color.fromARGB(
                                58, 56, 55, 55), // Set border color here
                            // color: Colors.black, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 33,
                              ),
                              Text(
                                'BOOKS',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      //text: 'ART',
                      //icon: Icon(s),
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 42, 86),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color.fromARGB(
                                58, 56, 55, 55), // Set border color here
                            // color: Colors.black, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 33,
                              ),
                              Text(
                                'SPORT EQUIPMENT',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      //text: 'ART',
                      //icon: Icon(s),
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 42, 86),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color.fromARGB(
                                58, 56, 55, 55), // Set border color here
                            // color: Colors.black, // Set border color here
                            width: 2.0, // Set border width here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 33,
                              ),
                              Text(
                                'OTHERS',
                                style: TextStyle(fontSize: 17),
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
                    ListView(
                      children: ctrl.productsshowinui1.map((cardData) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => itempage(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,selectptime: cardData.ptime,selectlocation: cardData.location,),
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
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData.pimage), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
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
                                        Text('Rs.'+cardData.pprice),
                                        SizedBox(height: 5),
                                        Text('Auction Date:'+cardData.dateAdded),
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
                      children: ctrl.productsshowinui2.map((cardData) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => itempage(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,selectptime: cardData.ptime,selectlocation: cardData.location,),
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
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData.pimage), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
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
                                        Text('Rs.'+cardData.pprice),
                                        SizedBox(height: 5),
                                        Text('Auction Date:'+cardData.dateAdded),
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
                                builder: (context) => itempage(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,selectptime: cardData.ptime,selectlocation: cardData.location,),
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
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData.pimage), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
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
                                        Text('Rs.'+cardData.pprice),
                                        SizedBox(height: 5),
                                        Text('Auction Date:'+cardData.dateAdded),
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
                                builder: (context) => itempage(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,selectptime: cardData.ptime,selectlocation: cardData.location,),
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
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData.pimage), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
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
                                        Text('Rs.'+cardData.pprice),
                                        SizedBox(height: 5),
                                        Text('Auction Date:'+cardData.dateAdded),
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
                                builder: (context) => itempage(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,selectptime: cardData.ptime,selectlocation: cardData.location,),
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
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData.pimage), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
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
                                        Text('Rs.'+cardData.pprice),
                                        SizedBox(height: 5),
                                        Text('Auction Date:'+cardData.dateAdded),
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
                      children: ctrl.productsshowinui6.map((cardData) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => itempage(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,selectptime: cardData.ptime,selectlocation: cardData.location,),
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
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData.pimage), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
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
                                        Text('Rs.'+cardData.pprice),
                                        SizedBox(height: 5),
                                        Text('Auction Date:'+cardData.dateAdded),
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
                      children: ctrl.productsshowinui7.map((cardData) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => itempage(selectpid:cardData.pid,selectimage: cardData.pimage, selectcategory: cardData.pcategory, selectname: cardData.pname, selectprice: cardData.pprice, selectdate: cardData.dateAdded, selectdesc: cardData.pdesc,selectptime: cardData.ptime,selectlocation: cardData.location,),
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
                                      borderRadius: BorderRadius.circular(10.0), // Set border radius here
                                      image: DecorationImage(
                                        image: NetworkImage(cardData.pimage), // Replace with your image URL
                                        fit: BoxFit.cover, // Adjust image fit as needed
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
                                        Text('Rs.'+cardData.pprice),
                                        SizedBox(height: 5),
                                        Text('Auction Date:'+cardData.dateAdded),
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
        cursorColor: Color.fromARGB(255, 216, 97, 29),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          labelText: 'Search',
          labelStyle: TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 216, 97, 29)),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}