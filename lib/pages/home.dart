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
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
        // child: Navigator.push(context, ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        iconSize: 26,selectedFontSize: 12,
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
        unselectedItemColor: Colors.black,
        unselectedFontSize: 11.0,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 243, 108, 31),
        onTap: _onItemTapped,
      ),
    );
  }
}
