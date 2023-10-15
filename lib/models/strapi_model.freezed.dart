// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strapi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StrapiModel _$StrapiModelFromJson(Map<String, dynamic> json) {
  return _StrapiModel.fromJson(json);
}

/// @nodoc
mixin _$StrapiModel {
  DataModel get data => throw _privateConstructorUsedError;
  Map<String, dynamic> get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrapiModelCopyWith<StrapiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrapiModelCopyWith<$Res> {
  factory $StrapiModelCopyWith(
          StrapiModel value, $Res Function(StrapiModel) then) =
      _$StrapiModelCopyWithImpl<$Res, StrapiModel>;
  @useResult
  $Res call({DataModel data, Map<String, dynamic> meta});

  $DataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$StrapiModelCopyWithImpl<$Res, $Val extends StrapiModel>
    implements $StrapiModelCopyWith<$Res> {
  _$StrapiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataModel,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataModelCopyWith<$Res> get data {
    return $DataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StrapiModelImplCopyWith<$Res>
    implements $StrapiModelCopyWith<$Res> {
  factory _$$StrapiModelImplCopyWith(
          _$StrapiModelImpl value, $Res Function(_$StrapiModelImpl) then) =
      __$$StrapiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataModel data, Map<String, dynamic> meta});

  @override
  $DataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$StrapiModelImplCopyWithImpl<$Res>
    extends _$StrapiModelCopyWithImpl<$Res, _$StrapiModelImpl>
    implements _$$StrapiModelImplCopyWith<$Res> {
  __$$StrapiModelImplCopyWithImpl(
      _$StrapiModelImpl _value, $Res Function(_$StrapiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$StrapiModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataModel,
      meta: null == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrapiModelImpl with DiagnosticableTreeMixin implements _StrapiModel {
  const _$StrapiModelImpl(
      {required this.data, required final Map<String, dynamic> meta})
      : _meta = meta;

  factory _$StrapiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrapiModelImplFromJson(json);

  @override
  final DataModel data;
  final Map<String, dynamic> _meta;
  @override
  Map<String, dynamic> get meta {
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meta);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StrapiModel(data: $data, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StrapiModel'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrapiModelImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, data, const DeepCollectionEquality().hash(_meta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StrapiModelImplCopyWith<_$StrapiModelImpl> get copyWith =>
      __$$StrapiModelImplCopyWithImpl<_$StrapiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrapiModelImplToJson(
      this,
    );
  }
}

abstract class _StrapiModel implements StrapiModel {
  const factory _StrapiModel(
      {required final DataModel data,
      required final Map<String, dynamic> meta}) = _$StrapiModelImpl;

  factory _StrapiModel.fromJson(Map<String, dynamic> json) =
      _$StrapiModelImpl.fromJson;

  @override
  DataModel get data;
  @override
  Map<String, dynamic> get meta;
  @override
  @JsonKey(ignore: true)
  _$$StrapiModelImplCopyWith<_$StrapiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
