# Live Auction App

Welcome to our Live Auction App! This application provides a platform for users to participate in live online auctions, specifically incorporating the English style auction format. With features tailored for both buyers and sellers, our app aims to create a seamless and enjoyable experience for all users.

## Features
- **User Authentication**: Users can register and log in securely.
- **Search**: Users can perform advanced searches to find specific items.
- **Notifications**: Users receive real-time notifications for updates on auctions. Email notifications are also available.
- **User-Friendly Design**: The app features a user-friendly and intuitive design for easy navigation and accessibility.
- **Selling History**: Users can view information about items they have sold in the selling history section.
- **Wishlist**: User can add their favourite items to the wishlist and also they have the option to remove the item from wishlist.
- **Registered Auctions**: Displays a list and information of auctions registered by the user that are not yet completed.
- **Item Registration**: Users can register their items for auction by filling in details such as name, images, category, base price, description, and choose a date for their auction.
- **Auction working**: Our auction page lets users bid on items individually, with a countdown timer adding excitement. You can easily see the latest highest bid for each item, and winner information is 
    provided for smooth transactions between the seller and winning bidder through emails.
-**Admin Verification**:Items uploaded by the seller are verified by the admin.He can either accept or reject the product.If accepted then acceptance mail will be sent to the seller and the product gets uploaded,else if rejected then rejection mail will be sent to the seller and the product will be removed from database.
  
 
## TechStack
- Flutter for frontend.
- Firebase for backend.
- NodeJS for server.
- Firestore for database.



## dependencies:
  animated_splash_screen: ^1.3.0
  cloud_firestore: ^4.15.9
  cupertino_icons: ^1.0.6
  firebase_app_check: ^0.2.1+18
  firebase_auth: ^4.17.9
  firebase_core: ^2.27.1
  firebase_storage: ^11.6.10
  firebase_ui_firestore: ^1.6.2
  flutter:
    sdk: flutter
  get: ^4.6.6
  http: ^1.2.1
  image_picker: ^1.0.7
  socket_io_client: ^2.0.3+1
  uuid: ^4.3.3

## dev_dependencies:
  build_runner: ^2.4.8
  flutter_lints: ^3.0.0
  flutter_test:
    sdk: flutter
  json_serializable: ^6.7.1
  flutter_launcher_icons: "^0.13.1"



## Installation
Install Dart and Flutter Tools and SDK's:

Dart SDK:

If you don't already have Dart SDK installed on your system, you can download it from the official Dart website:

Dart SDK
Please follow the installation instructions provided on the website.

Flutter Tools and SDK:

If you don't already have Flutter tools and SDK installed on your system, you can download it from the official Flutter website:

Flutter
Please follow the installation instructions provided on the website.

Firebase SDK:
If you don't already have Firebase SDK installed on your system, you can download it from the official Firebase website:

Firebase

Please follow the installation instructions provided on the website.

Once you have completed the installation steps above, follow the instructions in the Run Locally section for the complete setup required for installation.


##Run Locally

To run the LiveAuction project locally, follow these steps:

1.Clone the Git repository:
https://github.com/yekkaladeviavinash/LiveAuction.git

2.Enter the following commands in your terminal in the root directory where the project is installed
1.)flutter clean
2.)flutter pub get
These two commands would resolve the errors and the dependencies
Now you are ready to use LiveAuction!
