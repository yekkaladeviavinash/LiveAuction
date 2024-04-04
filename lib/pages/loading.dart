import 'dart:async';
import 'package:flutter/material.dart';
import 'package:liveauction/pages/firstpage.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Firstpage())));
  }

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Circular Image Example',
  //     home: Scaffold(
  //       backgroundColor: Colors.white,
  //       body: Center(
  //         child: CircleAvatar(
  //           radius: 150, // Adjust according to your preference
  //           backgroundImage: AssetImage('assets/auctionlogo.jpg'),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    print(W);
    print(H);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:EdgeInsets.fromLTRB(0,10,0,10),
              child: Image.asset(
                'assets/hammer.jpeg',
                width: 100,
                height: 100,
              ),
            ),
            // Loading text
            Text(
              'LiveAuction',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // Loading progress indicator
            SizedBox(height: 15.0),
            Container(
              width: 180,
              height: 3,
              child: LinearProgressIndicator(
                minHeight: 10,
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 243, 108, 31)),
                borderRadius:BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }


}



// import 'package:flutter/material.dart'; 
// import 'package:animated_splash_screen/animated_splash_screen.dart'; 
  

  
// class Loading extends StatelessWidget { 
    
//   // This widget is the root of your application. 
//   @override 
//   Widget build(BuildContext context) { 
//     return MaterialApp( 
//       theme: ThemeData( 
//         primarySwatch: Colors.green, 
//       ), 
        
//       home: AnimatedSplashScreen( 
//         duration: 3000,
//         splashIconSize: 400,
//         backgroundColor: Color.fromARGB(255, 248, 246, 246),
//         splash: 'assets/auctionlogo.jpg', 
//         nextScreen: Firstpage(), 
//         splashTransition: SplashTransition.fadeTransition, 
//       ), 
//     ); 
//   } 
// }





// import 'package:flutter/material.dart';

// class LoadingPage extends StatefulWidget {
//   @override
//   _LoadingPageState createState() => _LoadingPageState();
// }

// class _LoadingPageState extends State<LoadingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [

//             Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Image.asset(
//                 'assets/hammer.jpeg',
//                 width: 100,
//                 height: 100,
//               ),
//             ),
//             // Loading text
//             Text(
//               'LiveAuction',
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             // Loading progress indicator
//             SizedBox(height: 20.0),
//             Container(
//               width: 200,
//               height: 1,
//               child: LinearProgressIndicator(
//                 backgroundColor: Colors.grey[300],
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: LoadingPage(),
//   ));
// }