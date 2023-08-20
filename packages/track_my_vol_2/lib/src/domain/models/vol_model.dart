import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'vol_model.freezed.dart';
part 'vol_model.g.dart';

@freezed
class VolModel with _$VolModel {
  const factory VolModel({
    required String id,
    required String userId,
    required List<String> images,
    required String title,
    required String description,
    required int horus,
    required int year,
    required int month,
    required int day,
    required String fullName,
    required String category,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isApproved,
  }) = _VolModel;

  const VolModel._();

  factory VolModel.fromJson(Map<String, Object?> json) =>
      _$VolModelFromJson(json);

  factory VolModel.fromFirestore(Map<String, Object?> document, String id) {
    final Map<String, dynamic> json = document;
    json['id'] = id;
    json.update(
      'createdAt',
      (dynamic value) => (value as Timestamp).toDate().toString(),
    );
    json.update(
      'updatedAt',
      (dynamic value) => (value as Timestamp).toDate().toString(),
    );
    return _$VolModelFromJson(json);
  }

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> document = toJson();
    document.remove('id');
    document.update(
      'createdAt',
      (dynamic value) => Timestamp.fromDate(createdAt),
    );
    document.update(
      'updatedAt',
      (dynamic value) => Timestamp.fromDate(createdAt),
    );
    return document;
  }

  String get dateString {
    final DateTime date = DateTime(year, month, day);
    return DateFormat('yyyy / MMMM / dd / EE').format(date);
  }
}
