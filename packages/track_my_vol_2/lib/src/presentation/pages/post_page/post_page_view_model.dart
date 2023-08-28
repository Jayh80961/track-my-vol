import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

part 'post_page_view_model.freezed.dart';

@freezed
class PostPageViewModel with _$PostPageViewModel {
  const factory PostPageViewModel({
    required List<XFile> images,
    required String title,
    required String description,
    required String suggestion,
    required String fullName,
    required String category,
    required DateTime date,
    required bool isSubmitting,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  }) = _PostPageViewModel;

  const PostPageViewModel._();

  String get dateString {
    return DateFormat('yyyy / MMMM / dd / EE').format(date);
  }

  int get minutes => duration.inMinutes;

  Duration get duration {
    final Duration startTimeDuration = Duration(
      hours: startTime.hour,
      minutes: startTime.minute,
    );
    final Duration endTimeDuration = Duration(
      hours: endTime.hour,
      minutes: endTime.minute,
    );
    final Duration result = endTimeDuration - startTimeDuration;
    return result;
  }

  bool get isValid {
    return fullName.isNotEmpty && category.isNotEmpty;
  }

  bool get isNotValid {
    return !isValid;
  }
}
