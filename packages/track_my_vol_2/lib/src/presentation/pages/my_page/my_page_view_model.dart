import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/vol_model.dart';

part 'my_page_view_model.freezed.dart';

@freezed
class MyPageViewModel with _$MyPageViewModel {
  const factory MyPageViewModel({
    required List<VolModel> vols,
    required bool isLoading,
    required String name,
    required int totalMinutes,
    required int totalVols,
  }) = _MyPageViewModel;

  const MyPageViewModel._();
}
