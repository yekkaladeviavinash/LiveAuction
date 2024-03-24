import 'package:json_annotation/json_annotation.dart';
part 'datemodel.g.dart';

@JsonSerializable()
class datemodel {
  final String id;
  final String date;
  final List slots;

  datemodel({
    required this.id,
    required this.date,
    required this.slots,
  });

  factory datemodel.fromJson(Map<String, dynamic> json) =>_$datemodelFromJson(json);
  Map<String, dynamic> toJson() => {
    'id':id,
    'date':date,
    'slots':slots,
  };
}
