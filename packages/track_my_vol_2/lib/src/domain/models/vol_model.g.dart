// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VolModel _$$_VolModelFromJson(Map<String, dynamic> json) => _$_VolModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      description: json['description'] as String,
      horus: json['horus'] as int,
      year: json['year'] as int,
      month: json['month'] as int,
      day: json['day'] as int,
      fullName: json['fullName'] as String,
      category: json['category'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isApproved: json['isApproved'] as bool,
    );

Map<String, dynamic> _$$_VolModelToJson(_$_VolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'images': instance.images,
      'title': instance.title,
      'description': instance.description,
      'horus': instance.horus,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'fullName': instance.fullName,
      'category': instance.category,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isApproved': instance.isApproved,
    };
