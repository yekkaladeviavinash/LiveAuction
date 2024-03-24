// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

datemodel _$datemodelFromJson(Map<String, dynamic> json) => datemodel(
      id: json['id'] as String,
      date: json['date'] as String,
      slots: json['slots'] as List<dynamic>,
    );

Map<String, dynamic> _$datemodelToJson(datemodel instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'slots': instance.slots,
    };
