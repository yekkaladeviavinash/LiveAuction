// import 'package:get/get.dart';
// import 'package:liveauction/pages/itempage_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../models/datemodel.dart';
// import 'package:intl/intl.dart';

// class itempage extends StatefulWidget {
//   final String? selectpid;
//   final String? selectimage;
//   final String? selectcategory;
//   final String? selectname;
//   final String? selectprice;
//   final String? selectdate;
//   final String? selectdesc;
//   const itempage({super.key,required this.selectpid,required this.selectimage,required this.selectcategory,required this.selectname,required this.selectprice,required this.selectdate,required this.selectdesc});

//   @override
//   State<itempage> createState() => _itempageState();
// }

// class _itempageState extends State<itempage> {
//   String? todaydate = DateFormat("yyyy-MM-dd").format(DateTime.now());

//   @override

//   Widget build(BuildContext context) {
//     return GetBuilder<ItemController>(builder: (ctrl){
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Color.fromARGB(255, 241, 245, 248),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.network(
//                 widget.selectimage!,
//                 fit: BoxFit.cover,
//                 scale: 1,
//                 height: 400,
//                 width: 500,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(16, 8, 16, 15),
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.selectcategory!,
//                       style: TextStyle(
//                         fontSize: 20.8,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 85, 85, 85),
//                       ),
//                     ),
//                     Text(widget.selectname!,
//                         style: TextStyle(
//                           fontSize: 17,
//                           color: Color.fromARGB(255, 91, 91, 91),
//                           )),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       children: [
//                         Text('Base price   -- ',style: TextStyle(fontSize: 15,color: Colors.black),),
//                         Text(
//                           "Rs."+widget.selectprice!,
//                           style: TextStyle(color: Color.fromARGB(255, 15, 106, 41),fontWeight: FontWeight.bold,fontSize: 22),
//                         )
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text('Auction Date --',style: TextStyle(fontSize: 15,color: Colors.black),),
//                         Text(
//                           widget.selectdate!,
//                           style: TextStyle(color: Colors.red,fontSize: 16),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5,),
//                     Row(

//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text('Location --',style: TextStyle(fontSize: 15,color: Colors.black),),
//                         Icon(Icons.location_on,size: 20,),
//                         Text('Vishakapatanam',style: TextStyle(fontSize: 15),)
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 7,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(16, 8, 16, 15),
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'itempage Details',
//                           style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.8,letterSpacing: 0.3),
//                         ),

//                       ],
//                     ),
//                     Text(widget.selectdesc!
//                     ,style: TextStyle(fontSize: 16)) // take details from card data
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),

//       bottomNavigationBar: BottomAppBar(
//         height: 70,
//         padding: EdgeInsets.fromLTRB(16, 4, 24, 4),
//         surfaceTintColor: Colors.transparent,
//         color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               TextButton(

//                 style: ButtonStyle(

//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7.0), // Set border radius here
//                       side: BorderSide( width: 2.0), // Set border color and width here
//                     ),
//                   ),
//                     backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 32, 32, 32)),
//                 ),
//                 onPressed: () {
//                   // Add onPressed action for first button
//                   ctrl.addtowishlist(widget.selectpid!);
//                   print('First Button Pressed');
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.bookmark_add_outlined,color: Colors.white,),
//                       SizedBox(width: 5,),
//                       Text('Add to Wishlist',style: TextStyle(fontSize: 16,color: Colors.white),),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 20,),
//               TextButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7.0), // Set border radius here
//                       side: BorderSide( width: 2.0), // Set border color and width here
//                     ),
//                   ),
//                     backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 32, 32, 32)),
//                 ),
//                 onPressed: () {
//                   ctrl.registerUser(widget.selectpid!);
//                   print('Second Button Pressed');
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.account_circle_outlined,color: Colors.white,),
//                       SizedBox(width: 5,),
//                       Text('Register for auction',style: TextStyle(fontSize: 16,color: Colors.white),),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//     );
//     });
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/datemodel.dart';
import 'package:liveauction/pages/seller_controller.dart';

class itempage extends StatefulWidget {
  final String? selectpid;
  final String? selectimage;
  final String? selectcategory;
  final String? selectname;
  final String? selectprice;
  final String? selectdate;
  final String? selectdesc;
  final int? selectptime;
  final String? selectlocation;
  final List? selectregisteredusers;
  const itempage({
    Key? key,
    required this.selectpid,
    required this.selectimage,
    required this.selectcategory,
    required this.selectname,
    required this.selectprice,
    required this.selectdate,
    required this.selectdesc,
    required this.selectptime,
    required this.selectlocation,
    required this.selectregisteredusers,
  }) : super(key: key);

  @override
  State<itempage> createState() => _itempageState();
}

// class StringComparer {
//   static bool lessThan(String s1, String s2) {
//     return s1.compareTo(s2) < 0;
//   }
// }

class _itempageState extends State<itempage> {
  String? todaydate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final currentTime =
      DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
  bool check = true;

  @override
  Widget build(BuildContext context) {
    String showingyear=widget.selectdate!.substring(0,4);
    String showingdate = widget.selectdate!.substring(widget.selectdate!.length - 2);
    String month = widget.selectdate!.substring(5, 7);
    String showingmonth='';
    if(month=='01'){
      showingmonth="Jan";
    }else if(month=='02'){
      showingmonth="Feb";
    }else if(month=='03'){
      showingmonth="Mar";
    }else if(month=='04'){
      showingmonth="Apr";
    }else if(month=='05'){
      showingmonth="May";
    }else if(month=='06'){
      showingmonth="Jun";
    }else if(month=='07'){
      showingmonth="July";
    }else if(month=='08'){
      showingmonth="Aug";
    }else if(month=='09'){
      showingmonth="Sep";
    }else if(month=='10'){
      showingmonth="Oct";
    }else if(month=='11'){
      showingmonth="Nov";
    }else if(month=='12'){
      showingmonth="Dec";
    }
    



    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    print(W);
    print(H);
    return GetBuilder<Sellercontroller>(builder: (ctrl){
      int result = todaydate!.compareTo(widget.selectdate!);
      print(result.toString()+"rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        body: SafeArea(
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
                    height: 2*(H/936),
                  ),
                  Container(
                    width: W,
                    padding: EdgeInsets.fromLTRB(10*(W/432), 8*(H/936), 8*(W/432), 16*(H/936)),
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
                                    widget.selectname??'',
                                    style: TextStyle(
                                      fontFamily: 'robotom',
                                      fontSize: 24*(W/432),
                                    ),
                                  ),
                                  Text(
                                    widget.selectcategory??'',
                                    style: TextStyle(
                                      fontFamily: 'robotol',
                                      fontSize: 14*(W/432),
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
                                      size: 30*(W/432),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (1)*(W/432),
                                  ),
                                  IconButton(
                                    onPressed: () => {},
                                    icon: Icon(
                                      Icons.bookmark_add_outlined,
                                      size: 30*(W/432),
                                      color: Colors.black87,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ), //first row

                        SizedBox(
                          height: 20*(H/936),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.timer_outlined,
                                            size: 25*(W/432),
                                            color: Colors.grey[700],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10*(W/432),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Auction Date:',
                                            style: TextStyle(
                                                fontSize: 17*(W/432),
                                                fontFamily: 'roboto',
                                                fontWeight: FontWeight.w900),
                                          ), //in Aug,12,2023 form
                                          Text(
                                            showingmonth+" "+showingdate+", "+showingyear,
                                            style: TextStyle(
                                                fontSize: 16*(W/432),
                                                color: Colors.grey[600],
                                                fontFamily: 'robotol',
                                                fontWeight: FontWeight.bold
                                                // ,letterSpacing: 1
                                                ),
                                          ) //in this form
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10*(H/936),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.access_time_filled,
                                              size: 25*(W/432),
                                              color: Colors.grey[700]),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10*(W/432),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Auction Time:',
                                            style: TextStyle(
                                                fontSize: 17*(W/432),
                                                fontFamily: 'roboto',
                                                fontWeight: FontWeight.w900),
                                          ), //in 8d:20hrs form
                                          Text(
                                            widget.selectptime.toString()+":00 to "+(widget.selectptime!+1).toString()+":00 (IST)",
                                            style: TextStyle(
                                                fontSize: 16*(W/432),
                                                color: Colors.grey[600],
                                                fontFamily: 'robotol',
                                                fontWeight: FontWeight.bold
                                                // ,letterSpacing: 1
                                                ),
                                          ) //in this form
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.currency_exchange_rounded,
                                              size: 25*(W/432),
                                              color: Colors.grey[700]),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10*(W/432),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Base Price:',
                                            style: TextStyle(
                                                fontSize: 17*(W/432),
                                                fontFamily: 'roboto',
                                                fontWeight: FontWeight.w900),
                                          ), //in  form
                                          Text(
                                            widget.selectprice!+' Rupees',
                                            style: TextStyle(
                                                fontSize: 16*(W/432),
                                                color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                                fontFamily: 'robotol',
                                                fontWeight: FontWeight.bold
                                                // ,letterSpacing: 1
                                                ),
                                          ) //in this form
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10*(H/936),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.location_pin,
                                              size: 25*(W/432),
                                              color: Colors.grey[700]),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10*(W/432),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Location:',
                                            style: TextStyle(
                                                fontSize: 17*(W/432),
                                                fontFamily: 'roboto',
                                                fontWeight: FontWeight.w900),
                                          ), //in  form
                                          Text(
                                            widget.selectlocation??'',
                                            style: TextStyle(
                                                fontSize: 16*(W/432),
                                                color: Colors.grey[600],
                                                fontFamily: 'robotol',
                                                fontWeight: FontWeight.bold
                                                // ,letterSpacing: 1
                                                ),
                                          ) //in this form
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2*(H/936),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16*(W/432), 8, 16*(W/432), 8),
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
                                  fontSize: 17*(W/432),
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.w900),
                            ),


                            SizedBox(
                              width: 5*(W/432),
                            ),
                            Text(
                              widget.selectregisteredusers!.length.toString()+" Users",
                              style: TextStyle(
                                  fontSize: 16*(W/432),
                                  color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                  fontFamily: 'robotol',
                                  fontWeight: FontWeight.bold
                                  // ,letterSpacing: 1
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5*(H/936),
                        ),
                        Row(
                          children: [




                            Text(
                              'Registration Status:',
                              style: TextStyle(
                                fontSize: 17*(W/432),
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.w900
                              ),
                            ),



                            SizedBox(
                              width: 5*(W/432),
                            ),
                            (ctrl.userreg)? Text(   //here registered condition
                              'Registered',
                              style: TextStyle(
                                  fontSize: 16*(W/432),
                                  color: Color.fromARGB(
                                                    255, 13, 159, 18),
                                  fontFamily: 'robotol',
                                  fontWeight: FontWeight.bold
                                  // ,letterSpacing: 1
                                  ),
                            ) :Text(
                              'Not Registered Yet',
                              style: TextStyle(
                                  fontSize: 16*(W/432),
                                  color: Color.fromARGB(255, 241, 2, 2),
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
                    height: 2*(H/936),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16*(W/432), 8*(H/936), 16*(W/432), 15*(H/936)),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Item Details',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 18*(W/432),
                                fontFamily: 'roboto',
                              ),
                            ),
                          ],
                        ),
                        Text(
                            widget.selectdesc!,
                            style: TextStyle(
                                fontSize: 15*(W/432),
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

      
        bottomNavigationBar: (result==0)?  BottomAppBar(
          height: 60 * (H / 974.3),
          padding: EdgeInsets.fromLTRB(
              12 * (W / 448), 1 * (H / 974.3), 12 * (W / 448), 1 * (H / 974.3)),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          color: Colors.white,
          shadowColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            if(ctrl.userwish!=true)  
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(width: 2.0),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 32, 32, 32)),
                ),
                onPressed: () {
                  ctrl.addtowishlist(widget.selectpid!);
                  ctrl.checkwishliststatus(widget.selectpid!);
                  print('First Button Pressed');
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB( 7* (H / 974.3),4 * (H / 974.3), 7* (H / 974.3),4 * (H / 974.3)),
                  child: Row(
                    children: [
                      Icon(Icons.bookmark_add_outlined, color: Colors.white),
                      SizedBox(width: 5 * (W / 448)),
                      Text(
                        'Add to Wishlist',
                        style: TextStyle(
                            fontSize: 16 * (W / 448), color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

            if(ctrl.userwish==true) 
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(width: 2.0),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) =>  Color.fromARGB(255, 32, 32, 32)),
                ),
                onPressed: () async{
                  await ctrl.deleteProductfromwishlist(widget.selectpid!);
                  await ctrl.checkwishliststatus(widget.selectpid!);
                },
                child: Padding(
                  padding: EdgeInsets.all(4.9 * (H / 974.3)),
                  child: Row(
                    children: [
                      // Icon(Icons.bookmark_add_outlined, color: Color.fromARGB(
                      //                               255, 13, 159, 18),),
                      // SizedBox(width: 5 * (W / 448)),
                      Text(
                        'Delete from wishlist',
                        style: TextStyle(
                            fontSize: 16 * (W / 448), color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 10 * (W / 448)),
              
              if(ctrl.userreg!=true)
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: BorderSide(width: 2.0),
                      ),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 32, 32, 32)),
                  ),
                  onPressed: () async {
                    await ctrl.registerUser(widget.selectpid!);
                    await ctrl.checkregstatus(widget.selectpid!);
                    print('Second Button Pressed');
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(1 * (W / 448), 4 * (W / 448), 1 * (W / 448), 4 * (W / 448)),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined, color: Colors.white),
                        SizedBox(width: 5 * (W / 448)),
                        Text(
                          'Register for auction',
                          style: TextStyle(
                              fontSize: 16 * (W / 448), color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),



            if(ctrl.userreg==true)
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: BorderSide(width: 2.0),
                      ),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 247, 245, 245)),
                  ),
                  onPressed: () {
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4 * (W / 448)),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined, color: Colors.black),
                        SizedBox(width: 5 * (W / 448)),
                        Text(
                          'Already Registered',
                          style: TextStyle(
                              fontSize: 16 * (W / 448), color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

            ],
          ),
        ) :
        Text("gwdiq"),
      );
    });
  }
}