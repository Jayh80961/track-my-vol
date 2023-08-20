// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostPageViewModel {
  List<XFile> get images => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get horus => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostPageViewModelCopyWith<PostPageViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPageViewModelCopyWith<$Res> {
  factory $PostPageViewModelCopyWith(
          PostPageViewModel value, $Res Function(PostPageViewModel) then) =
      _$PostPageViewModelCopyWithImpl<$Res, PostPageViewModel>;
  @useResult
  $Res call(
      {List<XFile> images,
      String title,
      String description,
      int horus,
      String fullName,
      String category,
      DateTime date,
      bool isSubmitting});
}

/// @nodoc
class _$PostPageViewModelCopyWithImpl<$Res, $Val extends PostPageViewModel>
    implements $PostPageViewModelCopyWith<$Res> {
  _$PostPageViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? title = null,
    Object? description = null,
    Object? horus = null,
    Object? fullName = null,
    Object? category = null,
    Object? date = null,
    Object? isSubmitting = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      horus: null == horus
          ? _value.horus
          : horus // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostPageViewModelCopyWith<$Res>
    implements $PostPageViewModelCopyWith<$Res> {
  factory _$$_PostPageViewModelCopyWith(_$_PostPageViewModel value,
          $Res Function(_$_PostPageViewModel) then) =
      __$$_PostPageViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<XFile> images,
      String title,
      String description,
      int horus,
      String fullName,
      String category,
      DateTime date,
      bool isSubmitting});
}

/// @nodoc
class __$$_PostPageViewModelCopyWithImpl<$Res>
    extends _$PostPageViewModelCopyWithImpl<$Res, _$_PostPageViewModel>
    implements _$$_PostPageViewModelCopyWith<$Res> {
  __$$_PostPageViewModelCopyWithImpl(
      _$_PostPageViewModel _value, $Res Function(_$_PostPageViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? title = null,
    Object? description = null,
    Object? horus = null,
    Object? fullName = null,
    Object? category = null,
    Object? date = null,
    Object? isSubmitting = null,
  }) {
    return _then(_$_PostPageViewModel(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      horus: null == horus
          ? _value.horus
          : horus // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostPageViewModel extends _PostPageViewModel
    with DiagnosticableTreeMixin {
  const _$_PostPageViewModel(
      {required final List<XFile> images,
      required this.title,
      required this.description,
      required this.horus,
      required this.fullName,
      required this.category,
      required this.date,
      required this.isSubmitting})
      : _images = images,
        super._();

  final List<XFile> _images;
  @override
  List<XFile> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String title;
  @override
  final String description;
  @override
  final int horus;
  @override
  final String fullName;
  @override
  final String category;
  @override
  final DateTime date;
  @override
  final bool isSubmitting;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostPageViewModel(images: $images, title: $title, description: $description, horus: $horus, fullName: $fullName, category: $category, date: $date, isSubmitting: $isSubmitting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostPageViewModel'))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('horus', horus))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostPageViewModel &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.horus, horus) || other.horus == horus) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      title,
      description,
      horus,
      fullName,
      category,
      date,
      isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostPageViewModelCopyWith<_$_PostPageViewModel> get copyWith =>
      __$$_PostPageViewModelCopyWithImpl<_$_PostPageViewModel>(
          this, _$identity);
}

abstract class _PostPageViewModel extends PostPageViewModel {
  const factory _PostPageViewModel(
      {required final List<XFile> images,
      required final String title,
      required final String description,
      required final int horus,
      required final String fullName,
      required final String category,
      required final DateTime date,
      required final bool isSubmitting}) = _$_PostPageViewModel;
  const _PostPageViewModel._() : super._();

  @override
  List<XFile> get images;
  @override
  String get title;
  @override
  String get description;
  @override
  int get horus;
  @override
  String get fullName;
  @override
  String get category;
  @override
  DateTime get date;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_PostPageViewModelCopyWith<_$_PostPageViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
