// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageViewModel {
  List<VolModel> get vols => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageViewModelCopyWith<HomePageViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageViewModelCopyWith<$Res> {
  factory $HomePageViewModelCopyWith(
          HomePageViewModel value, $Res Function(HomePageViewModel) then) =
      _$HomePageViewModelCopyWithImpl<$Res, HomePageViewModel>;
  @useResult
  $Res call({List<VolModel> vols, bool isLoading});
}

/// @nodoc
class _$HomePageViewModelCopyWithImpl<$Res, $Val extends HomePageViewModel>
    implements $HomePageViewModelCopyWith<$Res> {
  _$HomePageViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vols = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      vols: null == vols
          ? _value.vols
          : vols // ignore: cast_nullable_to_non_nullable
              as List<VolModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomePageViewModelCopyWith<$Res>
    implements $HomePageViewModelCopyWith<$Res> {
  factory _$$_HomePageViewModelCopyWith(_$_HomePageViewModel value,
          $Res Function(_$_HomePageViewModel) then) =
      __$$_HomePageViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VolModel> vols, bool isLoading});
}

/// @nodoc
class __$$_HomePageViewModelCopyWithImpl<$Res>
    extends _$HomePageViewModelCopyWithImpl<$Res, _$_HomePageViewModel>
    implements _$$_HomePageViewModelCopyWith<$Res> {
  __$$_HomePageViewModelCopyWithImpl(
      _$_HomePageViewModel _value, $Res Function(_$_HomePageViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vols = null,
    Object? isLoading = null,
  }) {
    return _then(_$_HomePageViewModel(
      vols: null == vols
          ? _value._vols
          : vols // ignore: cast_nullable_to_non_nullable
              as List<VolModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomePageViewModel extends _HomePageViewModel
    with DiagnosticableTreeMixin {
  const _$_HomePageViewModel(
      {required final List<VolModel> vols, required this.isLoading})
      : _vols = vols,
        super._();

  final List<VolModel> _vols;
  @override
  List<VolModel> get vols {
    if (_vols is EqualUnmodifiableListView) return _vols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vols);
  }

  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomePageViewModel(vols: $vols, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomePageViewModel'))
      ..add(DiagnosticsProperty('vols', vols))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageViewModel &&
            const DeepCollectionEquality().equals(other._vols, _vols) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_vols), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageViewModelCopyWith<_$_HomePageViewModel> get copyWith =>
      __$$_HomePageViewModelCopyWithImpl<_$_HomePageViewModel>(
          this, _$identity);
}

abstract class _HomePageViewModel extends HomePageViewModel {
  const factory _HomePageViewModel(
      {required final List<VolModel> vols,
      required final bool isLoading}) = _$_HomePageViewModel;
  const _HomePageViewModel._() : super._();

  @override
  List<VolModel> get vols;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageViewModelCopyWith<_$_HomePageViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
