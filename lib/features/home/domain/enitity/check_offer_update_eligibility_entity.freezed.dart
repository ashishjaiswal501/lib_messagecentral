// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_offer_update_eligibility_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckOfferUpdateEligibilityEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Dataoffer? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckOfferUpdateEligibilityEntityCopyWith<CheckOfferUpdateEligibilityEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOfferUpdateEligibilityEntityCopyWith<$Res> {
  factory $CheckOfferUpdateEligibilityEntityCopyWith(
          CheckOfferUpdateEligibilityEntity value,
          $Res Function(CheckOfferUpdateEligibilityEntity) then) =
      _$CheckOfferUpdateEligibilityEntityCopyWithImpl<$Res,
          CheckOfferUpdateEligibilityEntity>;
  @useResult
  $Res call({int? responseCode, String? message, Dataoffer? data});

  $DataofferCopyWith<$Res>? get data;
}

/// @nodoc
class _$CheckOfferUpdateEligibilityEntityCopyWithImpl<$Res,
        $Val extends CheckOfferUpdateEligibilityEntity>
    implements $CheckOfferUpdateEligibilityEntityCopyWith<$Res> {
  _$CheckOfferUpdateEligibilityEntityCopyWithImpl(this._value, this._then);

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
              as Dataoffer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataofferCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataofferCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckOfferUpdateEligibilityEntityImplCopyWith<$Res>
    implements $CheckOfferUpdateEligibilityEntityCopyWith<$Res> {
  factory _$$CheckOfferUpdateEligibilityEntityImplCopyWith(
          _$CheckOfferUpdateEligibilityEntityImpl value,
          $Res Function(_$CheckOfferUpdateEligibilityEntityImpl) then) =
      __$$CheckOfferUpdateEligibilityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, Dataoffer? data});

  @override
  $DataofferCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CheckOfferUpdateEligibilityEntityImplCopyWithImpl<$Res>
    extends _$CheckOfferUpdateEligibilityEntityCopyWithImpl<$Res,
        _$CheckOfferUpdateEligibilityEntityImpl>
    implements _$$CheckOfferUpdateEligibilityEntityImplCopyWith<$Res> {
  __$$CheckOfferUpdateEligibilityEntityImplCopyWithImpl(
      _$CheckOfferUpdateEligibilityEntityImpl _value,
      $Res Function(_$CheckOfferUpdateEligibilityEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CheckOfferUpdateEligibilityEntityImpl(
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
              as Dataoffer?,
    ));
  }
}

/// @nodoc

class _$CheckOfferUpdateEligibilityEntityImpl
    implements _CheckOfferUpdateEligibilityEntity {
  const _$CheckOfferUpdateEligibilityEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final Dataoffer? data;

  @override
  String toString() {
    return 'CheckOfferUpdateEligibilityEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOfferUpdateEligibilityEntityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOfferUpdateEligibilityEntityImplCopyWith<
          _$CheckOfferUpdateEligibilityEntityImpl>
      get copyWith => __$$CheckOfferUpdateEligibilityEntityImplCopyWithImpl<
          _$CheckOfferUpdateEligibilityEntityImpl>(this, _$identity);
}

abstract class _CheckOfferUpdateEligibilityEntity
    implements CheckOfferUpdateEligibilityEntity {
  const factory _CheckOfferUpdateEligibilityEntity(
      {final int? responseCode,
      final String? message,
      final Dataoffer? data}) = _$CheckOfferUpdateEligibilityEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  Dataoffer? get data;
  @override
  @JsonKey(ignore: true)
  _$$CheckOfferUpdateEligibilityEntityImplCopyWith<
          _$CheckOfferUpdateEligibilityEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Dataoffer {
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataofferCopyWith<Dataoffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataofferCopyWith<$Res> {
  factory $DataofferCopyWith(Dataoffer value, $Res Function(Dataoffer) then) =
      _$DataofferCopyWithImpl<$Res, Dataoffer>;
  @useResult
  $Res call({DateTime? endDate, String? username});
}

/// @nodoc
class _$DataofferCopyWithImpl<$Res, $Val extends Dataoffer>
    implements $DataofferCopyWith<$Res> {
  _$DataofferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endDate = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataofferImplCopyWith<$Res>
    implements $DataofferCopyWith<$Res> {
  factory _$$DataofferImplCopyWith(
          _$DataofferImpl value, $Res Function(_$DataofferImpl) then) =
      __$$DataofferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? endDate, String? username});
}

/// @nodoc
class __$$DataofferImplCopyWithImpl<$Res>
    extends _$DataofferCopyWithImpl<$Res, _$DataofferImpl>
    implements _$$DataofferImplCopyWith<$Res> {
  __$$DataofferImplCopyWithImpl(
      _$DataofferImpl _value, $Res Function(_$DataofferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endDate = freezed,
    Object? username = freezed,
  }) {
    return _then(_$DataofferImpl(
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DataofferImpl implements _Dataoffer {
  const _$DataofferImpl({this.endDate, this.username});

  @override
  final DateTime? endDate;
  @override
  final String? username;

  @override
  String toString() {
    return 'Dataoffer(endDate: $endDate, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataofferImpl &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endDate, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataofferImplCopyWith<_$DataofferImpl> get copyWith =>
      __$$DataofferImplCopyWithImpl<_$DataofferImpl>(this, _$identity);
}

abstract class _Dataoffer implements Dataoffer {
  const factory _Dataoffer({final DateTime? endDate, final String? username}) =
      _$DataofferImpl;

  @override
  DateTime? get endDate;
  @override
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$$DataofferImplCopyWith<_$DataofferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
