import 'package:liveauction/pages/discover.dart';
import 'package:flutter/material.dart';
import 'package:liveauction/pages/todayauction.dart';
import 'package:liveauction/pages/profile.dart';
import 'package:liveauction/pages/profile.dart';
import 'package:liveauction/pages/profiledummy.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:liveauction/pages/seller.dart';
import 'package:liveauction/pages/seller_controller.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages=<Widget>[
    Discover(),
    Todayauction(),
    Seller(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    print(W);
    print(H);
    // Size screenSize = MediaQuery.of(context).size;
    // double W = screenSize.width;
    // double H = screenSize.height;
    // print(W);
    // print(H);
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
        // child: Navigator.push(context, ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,

        showUnselectedLabels: true,
        iconSize: W*0.05,selectedFontSize: W*0.03125,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            
            icon: Icon(Icons.search),
            label: 'Discover',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hail_rounded),
            label: 'My Auction',
            
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell',
            backgroundColor:  Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        unselectedItemColor: Colors.white,
        // unselectedFontSize: 13.0,
        unselectedFontSize: W*0.0290,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 243, 108, 31),
        onTap: _onItemTapped,
      ),
    );
  }
}
