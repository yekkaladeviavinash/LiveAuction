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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Image Example',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircleAvatar(
            radius: 150, // Adjust according to your preference
            backgroundImage: AssetImage('assets/auctionlogo.jpg'),
          ),
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