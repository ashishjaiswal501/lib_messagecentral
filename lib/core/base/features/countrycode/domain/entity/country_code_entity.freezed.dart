// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountryCodeEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  set responseCode(int? value) => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  set message(String? value) => throw _privateConstructorUsedError;
  List<CountryData>? get data => throw _privateConstructorUsedError;
  set data(List<CountryData>? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryCodeEntityCopyWith<CountryCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodeEntityCopyWith<$Res> {
  factory $CountryCodeEntityCopyWith(
          CountryCodeEntity value, $Res Function(CountryCodeEntity) then) =
      _$CountryCodeEntityCopyWithImpl<$Res, CountryCodeEntity>;
  @useResult
  $Res call({int? responseCode, String? message, List<CountryData>? data});
}

/// @nodoc
class _$CountryCodeEntityCopyWithImpl<$Res, $Val extends CountryCodeEntity>
    implements $CountryCodeEntityCopyWith<$Res> {
  _$CountryCodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryCodeEntityImplCopyWith<$Res>
    implements $CountryCodeEntityCopyWith<$Res> {
  factory _$$CountryCodeEntityImplCopyWith(_$CountryCodeEntityImpl value,
          $Res Function(_$CountryCodeEntityImpl) then) =
      __$$CountryCodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, List<CountryData>? data});
}

/// @nodoc
class __$$CountryCodeEntityImplCopyWithImpl<$Res>
    extends _$CountryCodeEntityCopyWithImpl<$Res, _$CountryCodeEntityImpl>
    implements _$$CountryCodeEntityImplCopyWith<$Res> {
  __$$CountryCodeEntityImplCopyWithImpl(_$CountryCodeEntityImpl _value,
      $Res Function(_$CountryCodeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CountryCodeEntityImpl(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryData>?,
    ));
  }
}

/// @nodoc

class _$CountryCodeEntityImpl implements _CountryCodeEntity {
  _$CountryCodeEntityImpl({this.responseCode, this.message, this.data});

  @override
  int? responseCode;
  @override
  String? message;
  @override
  List<CountryData>? data;

  @override
  String toString() {
    return 'CountryCodeEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryCodeEntityImplCopyWith<_$CountryCodeEntityImpl> get copyWith =>
      __$$CountryCodeEntityImplCopyWithImpl<_$CountryCodeEntityImpl>(
          this, _$identity);
}

abstract class _CountryCodeEntity implements CountryCodeEntity {
  factory _CountryCodeEntity(
      {int? responseCode,
      String? message,
      List<CountryData>? data}) = _$CountryCodeEntityImpl;

  @override
  int? get responseCode;
  set responseCode(int? value);
  @override
  String? get message;
  set message(String? value);
  @override
  List<CountryData>? get data;
  set data(List<CountryData>? value);
  @override
  @JsonKey(ignore: true)
  _$$CountryCodeEntityImplCopyWith<_$CountryCodeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CountryData {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  String? get phoneCode => throw _privateConstructorUsedError;
  set phoneCode(String? value) => throw _privateConstructorUsedError;
  String? get isoCountryCode => throw _privateConstructorUsedError;
  set isoCountryCode(String? value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  int? get minLength => throw _privateConstructorUsedError;
  set minLength(int? value) => throw _privateConstructorUsedError;
  int? get maxLength => throw _privateConstructorUsedError;
  set maxLength(int? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryDataCopyWith<CountryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDataCopyWith<$Res> {
  factory $CountryDataCopyWith(
          CountryData value, $Res Function(CountryData) then) =
      _$CountryDataCopyWithImpl<$Res, CountryData>;
  @useResult
  $Res call(
      {int? id,
      String? phoneCode,
      String? isoCountryCode,
      String? name,
      int? minLength,
      int? maxLength});
}

/// @nodoc
class _$CountryDataCopyWithImpl<$Res, $Val extends CountryData>
    implements $CountryDataCopyWith<$Res> {
  _$CountryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneCode = freezed,
    Object? isoCountryCode = freezed,
    Object? name = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCountryCode: freezed == isoCountryCode
          ? _value.isoCountryCode
          : isoCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      minLength: freezed == minLength
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryDataImplCopyWith<$Res>
    implements $CountryDataCopyWith<$Res> {
  factory _$$CountryDataImplCopyWith(
          _$CountryDataImpl value, $Res Function(_$CountryDataImpl) then) =
      __$$CountryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? phoneCode,
      String? isoCountryCode,
      String? name,
      int? minLength,
      int? maxLength});
}

/// @nodoc
class __$$CountryDataImplCopyWithImpl<$Res>
    extends _$CountryDataCopyWithImpl<$Res, _$CountryDataImpl>
    implements _$$CountryDataImplCopyWith<$Res> {
  __$$CountryDataImplCopyWithImpl(
      _$CountryDataImpl _value, $Res Function(_$CountryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneCode = freezed,
    Object? isoCountryCode = freezed,
    Object? name = freezed,
    Object? minLength = freezed,
    Object? maxLength = freezed,
  }) {
    return _then(_$CountryDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isoCountryCode: freezed == isoCountryCode
          ? _value.isoCountryCode
          : isoCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      minLength: freezed == minLength
          ? _value.minLength
          : minLength // ignore: cast_nullable_to_non_nullable
              as int?,
      maxLength: freezed == maxLength
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CountryDataImpl implements _CountryData {
  _$CountryDataImpl(
      {this.id,
      this.phoneCode,
      this.isoCountryCode,
      this.name,
      this.minLength,
      this.maxLength});

  @override
  int? id;
  @override
  String? phoneCode;
  @override
  String? isoCountryCode;
  @override
  String? name;
  @override
  int? minLength;
  @override
  int? maxLength;

  @override
  String toString() {
    return 'CountryData(id: $id, phoneCode: $phoneCode, isoCountryCode: $isoCountryCode, name: $name, minLength: $minLength, maxLength: $maxLength)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryDataImplCopyWith<_$CountryDataImpl> get copyWith =>
      __$$CountryDataImplCopyWithImpl<_$CountryDataImpl>(this, _$identity);
}

abstract class _CountryData implements CountryData {
  factory _CountryData(
      {int? id,
      String? phoneCode,
      String? isoCountryCode,
      String? name,
      int? minLength,
      int? maxLength}) = _$CountryDataImpl;

  @override
  int? get id;
  set id(int? value);
  @override
  String? get phoneCode;
  set phoneCode(String? value);
  @override
  String? get isoCountryCode;
  set isoCountryCode(String? value);
  @override
  String? get name;
  set name(String? value);
  @override
  int? get minLength;
  set minLength(int? value);
  @override
  int? get maxLength;
  set maxLength(int? value);
  @override
  @JsonKey(ignore: true)
  _$$CountryDataImplCopyWith<_$CountryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
