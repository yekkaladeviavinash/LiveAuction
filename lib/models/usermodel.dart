import 'package:json_annotation/json_annotation.dart';

part 'usermodel.g.dart';

@JsonSerializable()
class usermodel{
  final String username;
  final String uid;
  final String phone;
  final String email;
  final String profileimagelink;
  final List auctionhistory;
  final List sellerhistory;
  final List wishlist;


  const usermodel({
    required this.username,
    required this.uid,
    required this.phone,
    required this.email,
    required this.profileimagelink,
    required this.auctionhistory,
    required this.sellerhistory,
    required this.wishlist,
  });

  factory usermodel.fromJson(Map<String,dynamic>json)=>_$usermodelFromJson(json);
  Map<String,dynamic>toJson()=>{
    'username':username,
    'uid':uid,
    'email':email,
    'phone':phone,
    'profileimagelink':profileimagelink,
    'auctionhistory':auctionhistory,
    'sellerhistory':sellerhistory,
    'wishlist':wishlist,
  };
}
