
    import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveauction/pages/profilecontroller.dart';
import 'package:liveauction/pages/itempage.dart'; // Import itempage if not already imported

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return GetBuilder<Profilecontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('WishList',style: TextStyle(color: Colors.white),),
          leading: IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: Colors.white, // Set color to red
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await ctrl.refreshPage();
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: ctrl.sellerwishlist.length,
              itemBuilder: (context, index) {
                var item = ctrl.sellerwishlist[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => itempage(
                          selectpid: item.pid,
                          selectimage: item.pimage,
                          selectcategory: item.pcategory,
                          selectname: item.pname,
                          selectprice: item.pprice,
                          selectdate: item.dateAdded,
                          selectdesc: item.pdesc,
                          selectptime: item.ptime,
                          selectlocation: item.location,
                        ),
                      ),
                    );
                  },
                  child: AdminCard(
                    title: item.pname ?? '',
                    bidPrice: item.pprice ?? '',
                    auctionDate: item.dateAdded ?? '',
                    category: item.pcategory ?? '',
                    imageUrl: item.pimage ?? '',
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    onPressedDelete: () {
                      ctrl.deleteProductfromwishlist(item.pid ?? '');
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}

class AdminCard extends StatelessWidget {
  final String title;
  final String bidPrice;
  final String auctionDate;
  final String category;
  final String imageUrl;
  final VoidCallback onPressedDelete;
  final double screenWidth;
  final double screenHeight;

  const AdminCard({
    required this.title,
    required this.bidPrice,
    required this.auctionDate,
    required this.category,
    required this.imageUrl,
    required this.onPressedDelete,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Bid Price: $bidPrice',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Auction Date: $auctionDate',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Category: $category',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: onPressedDelete,
                        child: const Text('   Remove from wishlist   ',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          backgroundColor: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
