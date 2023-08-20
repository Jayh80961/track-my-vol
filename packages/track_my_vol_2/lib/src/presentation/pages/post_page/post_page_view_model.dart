import 'package:flutter/foundation.dart';
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
    required int horus,
    required String fullName,
    required String category,
    required DateTime date,
    required bool isSubmitting,
  }) = _PostPageViewModel;

  const PostPageViewModel._();

  String get dateString {
    return DateFormat('yyyy / MMMM / dd / EE').format(date);
  }

  bool get isValid {
    return images.isNotEmpty &&
        title.isNotEmpty &&
        description.isNotEmpty &&
        horus > 0 &&
        fullName.isNotEmpty &&
        category.isNotEmpty;
  }

  bool get isNotValid {
    return !isValid;
  }
}
