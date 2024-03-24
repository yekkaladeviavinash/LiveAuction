// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

usermodel _$usermodelFromJson(Map<String, dynamic> json) => usermodel(
      username: json['username'] as String,
      uid: json['uid'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      profileimagelink: json['profileimagelink'] as String,
      auctionhistory: json['auctionhistory'] as List<dynamic>,
      sellerhistory: json['sellerhistory'] as List<dynamic>,
      wishlist: json['wishlist'] as List<dynamic>,
    );

Map<String, dynamic> _$usermodelToJson(usermodel instance) => <String, dynamic>{
      'username': instance.username,
      'uid': instance.uid,
      'phone': instance.phone,
      'email': instance.email,
      'profileimagelink': instance.profileimagelink,
      'auctionhistory': instance.auctionhistory,
      'sellerhistory': instance.sellerhistory,
      'wishlist': instance.wishlist,
    };
