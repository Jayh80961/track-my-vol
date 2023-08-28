import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'vol_model.freezed.dart';
part 'vol_model.g.dart';

@freezed
class VolModel with _$VolModel {
  const factory VolModel({
    @Default('') String id,
    @Default('') String userId,
    @Default(<String>[]) List<String> images,
    @Default('') String title,
    @Default('') String description,
    @Default('') String suggestion,
    @Default(0) int minutes,
    @Default(0) int year,
    @Default(0) int month,
    @Default(0) int day,
    @Default('') String fullName,
    @Default('') String category,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isApproved,
    @Default(false) bool isDeleted,
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
