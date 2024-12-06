// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_offer_eligibility_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckOfferEligibilityEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckOfferEligibilityEntityCopyWith<CheckOfferEligibilityEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOfferEligibilityEntityCopyWith<$Res> {
  factory $CheckOfferEligibilityEntityCopyWith(
          CheckOfferEligibilityEntity value,
          $Res Function(CheckOfferEligibilityEntity) then) =
      _$CheckOfferEligibilityEntityCopyWithImpl<$Res,
          CheckOfferEligibilityEntity>;
  @useResult
  $Res call({int? responseCode, String? message, dynamic data});
}

/// @nodoc
class _$CheckOfferEligibilityEntityCopyWithImpl<$Res,
        $Val extends CheckOfferEligibilityEntity>
    implements $CheckOfferEligibilityEntityCopyWith<$Res> {
  _$CheckOfferEligibilityEntityCopyWithImpl(this._value, this._then);

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
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckOfferEligibilityEntityImplCopyWith<$Res>
    implements $CheckOfferEligibilityEntityCopyWith<$Res> {
  factory _$$CheckOfferEligibilityEntityImplCopyWith(
          _$CheckOfferEligibilityEntityImpl value,
          $Res Function(_$CheckOfferEligibilityEntityImpl) then) =
      __$$CheckOfferEligibilityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, dynamic data});
}

/// @nodoc
class __$$CheckOfferEligibilityEntityImplCopyWithImpl<$Res>
    extends _$CheckOfferEligibilityEntityCopyWithImpl<$Res,
        _$CheckOfferEligibilityEntityImpl>
    implements _$$CheckOfferEligibilityEntityImplCopyWith<$Res> {
  __$$CheckOfferEligibilityEntityImplCopyWithImpl(
      _$CheckOfferEligibilityEntityImpl _value,
      $Res Function(_$CheckOfferEligibilityEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CheckOfferEligibilityEntityImpl(
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
              as dynamic,
    ));
  }
}

/// @nodoc

class _$CheckOfferEligibilityEntityImpl
    implements _CheckOfferEligibilityEntity {
  const _$CheckOfferEligibilityEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'CheckOfferEligibilityEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOfferEligibilityEntityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOfferEligibilityEntityImplCopyWith<_$CheckOfferEligibilityEntityImpl>
      get copyWith => __$$CheckOfferEligibilityEntityImplCopyWithImpl<
          _$CheckOfferEligibilityEntityImpl>(this, _$identity);
}

abstract class _CheckOfferEligibilityEntity
    implements CheckOfferEligibilityEntity {
  const factory _CheckOfferEligibilityEntity(
      {final int? responseCode,
      final String? message,
      final dynamic data}) = _$CheckOfferEligibilityEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$CheckOfferEligibilityEntityImplCopyWith<_$CheckOfferEligibilityEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
