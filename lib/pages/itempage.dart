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








import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/datemodel.dart';
import 'package:liveauction/pages/itempage_controller.dart';

class itempage extends StatefulWidget {
  final String? selectpid;
  final String? selectimage;
  final String? selectcategory;
  final String? selectname;
  final String? selectprice;
  final String? selectdate;
  final String? selectdesc;

  const itempage(
      {Key? key,
      required this.selectpid,
      required this.selectimage,
      required this.selectcategory,
      required this.selectname,
      required this.selectprice,
      required this.selectdate,
      required this.selectdesc})
      : super(key: key);

  @override
  State<itempage> createState() => _itempageState();
}

class _itempageState extends State<itempage> {
  String? todaydate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 241, 245, 248),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.selectimage!,
                  fit: BoxFit.cover,
                  scale: 1,
                  height: 400,
                  width: 500,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.selectcategory!,
                        style: TextStyle(
                          fontSize: 20.8,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 85, 85, 85),
                        ),
                      ),
                      Text(widget.selectname!,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 91, 91, 91),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Base price   -- ',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            "Rs." + widget.selectprice!,
                            style: TextStyle(
                                color: Color.fromARGB(255, 15, 106, 41),
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Auction Date --',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            widget.selectdate!,
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Location --',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Icon(Icons.location_on, size: 20),
                          Text('Vishakapatanam', style: TextStyle(fontSize: 15)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'itempage Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.8,
                                letterSpacing: 0.3),
                          ),
                        ],
                      ),
                      Text(widget.selectdesc!, style: TextStyle(fontSize: 16)) 
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: todaydate == widget.selectdate
            ? BottomAppBar(
                height: 70,
                padding: EdgeInsets.fromLTRB(16, 4, 24, 4),
                surfaceTintColor: Colors.transparent,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(width: 2.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) =>
                                Color.fromARGB(255, 32, 32, 32)),
                      ),
                      onPressed: () {
                        ctrl.addtowishlist(widget.selectpid!);
                        print('First Button Pressed');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(Icons.bookmark_add_outlined,
                                color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Add to Wishlist',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(width: 2.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) =>
                                Color.fromARGB(255, 32, 32, 32)),
                      ),
                      onPressed: () {
                        ctrl.registerUser(widget.selectpid!);
                        print('Second Button Pressed');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(Icons.account_circle_outlined,
                                color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              'Register for auction',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
      );
    });
  }
}
