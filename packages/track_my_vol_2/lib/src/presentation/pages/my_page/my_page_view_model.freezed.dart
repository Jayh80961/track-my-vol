// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyPageViewModel {
  List<VolModel> get vols => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get approvedMinutes => throw _privateConstructorUsedError;
  int get totalMinutes => throw _privateConstructorUsedError;
  int get totalVols => throw _privateConstructorUsedError;
  int get approvedVols => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPageViewModelCopyWith<MyPageViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageViewModelCopyWith<$Res> {
  factory $MyPageViewModelCopyWith(
          MyPageViewModel value, $Res Function(MyPageViewModel) then) =
      _$MyPageViewModelCopyWithImpl<$Res, MyPageViewModel>;
  @useResult
  $Res call(
      {List<VolModel> vols,
      bool isLoading,
      String name,
      int approvedMinutes,
      int totalMinutes,
      int totalVols,
      int approvedVols});
}

/// @nodoc
class _$MyPageViewModelCopyWithImpl<$Res, $Val extends MyPageViewModel>
    implements $MyPageViewModelCopyWith<$Res> {
  _$MyPageViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vols = null,
    Object? isLoading = null,
    Object? name = null,
    Object? approvedMinutes = null,
    Object? totalMinutes = null,
    Object? totalVols = null,
    Object? approvedVols = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      approvedMinutes: null == approvedMinutes
          ? _value.approvedMinutes
          : approvedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalMinutes: null == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalVols: null == totalVols
          ? _value.totalVols
          : totalVols // ignore: cast_nullable_to_non_nullable
              as int,
      approvedVols: null == approvedVols
          ? _value.approvedVols
          : approvedVols // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyPageViewModelCopyWith<$Res>
    implements $MyPageViewModelCopyWith<$Res> {
  factory _$$_MyPageViewModelCopyWith(
          _$_MyPageViewModel value, $Res Function(_$_MyPageViewModel) then) =
      __$$_MyPageViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VolModel> vols,
      bool isLoading,
      String name,
      int approvedMinutes,
      int totalMinutes,
      int totalVols,
      int approvedVols});
}

/// @nodoc
class __$$_MyPageViewModelCopyWithImpl<$Res>
    extends _$MyPageViewModelCopyWithImpl<$Res, _$_MyPageViewModel>
    implements _$$_MyPageViewModelCopyWith<$Res> {
  __$$_MyPageViewModelCopyWithImpl(
      _$_MyPageViewModel _value, $Res Function(_$_MyPageViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vols = null,
    Object? isLoading = null,
    Object? name = null,
    Object? approvedMinutes = null,
    Object? totalMinutes = null,
    Object? totalVols = null,
    Object? approvedVols = null,
  }) {
    return _then(_$_MyPageViewModel(
      vols: null == vols
          ? _value._vols
          : vols // ignore: cast_nullable_to_non_nullable
              as List<VolModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      approvedMinutes: null == approvedMinutes
          ? _value.approvedMinutes
          : approvedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalMinutes: null == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalVols: null == totalVols
          ? _value.totalVols
          : totalVols // ignore: cast_nullable_to_non_nullable
              as int,
      approvedVols: null == approvedVols
          ? _value.approvedVols
          : approvedVols // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MyPageViewModel extends _MyPageViewModel with DiagnosticableTreeMixin {
  const _$_MyPageViewModel(
      {required final List<VolModel> vols,
      required this.isLoading,
      required this.name,
      required this.approvedMinutes,
      required this.totalMinutes,
      required this.totalVols,
      required this.approvedVols})
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
  final String name;
  @override
  final int approvedMinutes;
  @override
  final int totalMinutes;
  @override
  final int totalVols;
  @override
  final int approvedVols;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyPageViewModel(vols: $vols, isLoading: $isLoading, name: $name, approvedMinutes: $approvedMinutes, totalMinutes: $totalMinutes, totalVols: $totalVols, approvedVols: $approvedVols)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyPageViewModel'))
      ..add(DiagnosticsProperty('vols', vols))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('approvedMinutes', approvedMinutes))
      ..add(DiagnosticsProperty('totalMinutes', totalMinutes))
      ..add(DiagnosticsProperty('totalVols', totalVols))
      ..add(DiagnosticsProperty('approvedVols', approvedVols));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPageViewModel &&
            const DeepCollectionEquality().equals(other._vols, _vols) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.approvedMinutes, approvedMinutes) ||
                other.approvedMinutes == approvedMinutes) &&
            (identical(other.totalMinutes, totalMinutes) ||
                other.totalMinutes == totalMinutes) &&
            (identical(other.totalVols, totalVols) ||
                other.totalVols == totalVols) &&
            (identical(other.approvedVols, approvedVols) ||
                other.approvedVols == approvedVols));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_vols),
      isLoading,
      name,
      approvedMinutes,
      totalMinutes,
      totalVols,
      approvedVols);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyPageViewModelCopyWith<_$_MyPageViewModel> get copyWith =>
      __$$_MyPageViewModelCopyWithImpl<_$_MyPageViewModel>(this, _$identity);
}

abstract class _MyPageViewModel extends MyPageViewModel {
  const factory _MyPageViewModel(
      {required final List<VolModel> vols,
      required final bool isLoading,
      required final String name,
      required final int approvedMinutes,
      required final int totalMinutes,
      required final int totalVols,
      required final int approvedVols}) = _$_MyPageViewModel;
  const _MyPageViewModel._() : super._();

  @override
  List<VolModel> get vols;
  @override
  bool get isLoading;
  @override
  String get name;
  @override
  int get approvedMinutes;
  @override
  int get totalMinutes;
  @override
  int get totalVols;
  @override
  int get approvedVols;
  @override
  @JsonKey(ignore: true)
  _$$_MyPageViewModelCopyWith<_$_MyPageViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
