import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/vol_model.dart';

part 'home_page_view_model.freezed.dart';

@freezed
class HomePageViewModel with _$HomePageViewModel {
  const factory HomePageViewModel({
    required List<VolModel> vols,
    required bool isLoading,
  }) = _HomePageViewModel;

  const HomePageViewModel._();
}
