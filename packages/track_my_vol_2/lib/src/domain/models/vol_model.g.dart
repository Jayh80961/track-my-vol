// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VolModel _$$_VolModelFromJson(Map<String, dynamic> json) => _$_VolModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      suggestion: json['suggestion'] as String? ?? '',
      minutes: json['minutes'] as int? ?? 0,
      year: json['year'] as int? ?? 0,
      month: json['month'] as int? ?? 0,
      day: json['day'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      category: json['category'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isApproved: json['isApproved'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_VolModelToJson(_$_VolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'images': instance.images,
      'title': instance.title,
      'description': instance.description,
      'suggestion': instance.suggestion,
      'minutes': instance.minutes,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'fullName': instance.fullName,
      'category': instance.category,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isApproved': instance.isApproved,
      'isDeleted': instance.isDeleted,
    };
