import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'productmodel.g.dart';

@JsonSerializable()
class productmodel {
  final String pname;
  final String pprice;
  final String pdesc;
  final String pid;
  final String sid;
  final String pimage;
  final String pcategory;
  final bool status;
  final List registeredusers;
  final String dateAdded;
  final String location;
  final int ptime;

  const productmodel({
    required this.pname,
    required this.pprice,
    required this.pdesc,
    required this.pid,
    required this.sid,
    required this.pimage,
    required this.pcategory,
    required this.status,
    required this.registeredusers,
    required this.dateAdded,
    required this.location,
    required this.ptime,
  });

  factory productmodel.fromJson(Map<String, dynamic> json) =>
      _$productmodelFromJson(json);
  Map<String, dynamic> toJson() => {
        'pname': pname,
        'pprice': pprice,
        'pdesc': pdesc,
        'pid': pid,
        'sid': sid,
        'pimage': pimage,
        'pcategory': pcategory,
        'status': status,
        'registeredusers': registeredusers,
        'dateAdded': dateAdded,
        'location': location,
        'ptime': ptime,
      };
}
