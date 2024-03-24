import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  
  
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final curruser=FirebaseAuth.instance.currentUser!;

  String nameofuser="";
  void initState(){
    super.initState();
    getUsername();
  }


void getUsername()async{
  DocumentSnapshot snap=await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
  setState(() {
    nameofuser=(snap.data() as Map<String,dynamic>)['username'];
  });
}


  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Profile Page'),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // body: Center(
      //   child: MaterialButton(onPressed: (){
      //     FirebaseAuth.instance.signOut();
      //   },
      //   color: Colors.amber,
      //   child: Text("sign out"),
      //   ),
      // ),
       
      body: Center(
        child: Column(children: [
           SizedBox(height: 100.0),
          Text(
            curruser.email!,

          ),
          Text('$nameofuser'),
          MaterialButton(onPressed: (){
          FirebaseAuth.instance.signOut();
        },
        color: Colors.amber,
        child: Text("sign out"),
        ),
        ],),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hail_rounded),
            label: 'My Auction',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.sell),
          //   label: 'Sell',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.blue,
        unselectedFontSize: 11.0,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 243, 108, 31),
        onTap: _onItemTapped,
      ),
      
    );
  }
}