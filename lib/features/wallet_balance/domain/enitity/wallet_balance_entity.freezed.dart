// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletBalanceEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  GetUserData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletBalanceEntityCopyWith<WalletBalanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBalanceEntityCopyWith<$Res> {
  factory $WalletBalanceEntityCopyWith(
          WalletBalanceEntity value, $Res Function(WalletBalanceEntity) then) =
      _$WalletBalanceEntityCopyWithImpl<$Res, WalletBalanceEntity>;
  @useResult
  $Res call({int? responseCode, String? message, GetUserData? data});

  $GetUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$WalletBalanceEntityCopyWithImpl<$Res, $Val extends WalletBalanceEntity>
    implements $WalletBalanceEntityCopyWith<$Res> {
  _$WalletBalanceEntityCopyWithImpl(this._value, this._then);

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
              as GetUserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetUserDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GetUserDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletBalanceEntityImplCopyWith<$Res>
    implements $WalletBalanceEntityCopyWith<$Res> {
  factory _$$WalletBalanceEntityImplCopyWith(_$WalletBalanceEntityImpl value,
          $Res Function(_$WalletBalanceEntityImpl) then) =
      __$$WalletBalanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, GetUserData? data});

  @override
  $GetUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$WalletBalanceEntityImplCopyWithImpl<$Res>
    extends _$WalletBalanceEntityCopyWithImpl<$Res, _$WalletBalanceEntityImpl>
    implements _$$WalletBalanceEntityImplCopyWith<$Res> {
  __$$WalletBalanceEntityImplCopyWithImpl(_$WalletBalanceEntityImpl _value,
      $Res Function(_$WalletBalanceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$WalletBalanceEntityImpl(
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
              as GetUserData?,
    ));
  }
}

/// @nodoc

class _$WalletBalanceEntityImpl implements _WalletBalanceEntity {
  const _$WalletBalanceEntityImpl({this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final GetUserData? data;

  @override
  String toString() {
    return 'WalletBalanceEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletBalanceEntityImpl &&
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
  _$$WalletBalanceEntityImplCopyWith<_$WalletBalanceEntityImpl> get copyWith =>
      __$$WalletBalanceEntityImplCopyWithImpl<_$WalletBalanceEntityImpl>(
          this, _$identity);
}

abstract class _WalletBalanceEntity implements WalletBalanceEntity {
  const factory _WalletBalanceEntity(
      {final int? responseCode,
      final String? message,
      final GetUserData? data}) = _$WalletBalanceEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  GetUserData? get data;
  @override
  @JsonKey(ignore: true)
  _$$WalletBalanceEntityImplCopyWith<_$WalletBalanceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetUserData {
  String? get customerId => throw _privateConstructorUsedError;
  double? get credits => throw _privateConstructorUsedError;
  double? get lastRechargedCredit => throw _privateConstructorUsedError;
  DateTime? get createdDateTime => throw _privateConstructorUsedError;
  DateTime? get updatedDateTime => throw _privateConstructorUsedError;
  String? get minimumCreditsAllowed => throw _privateConstructorUsedError;
  bool? get userPaid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetUserDataCopyWith<GetUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserDataCopyWith<$Res> {
  factory $GetUserDataCopyWith(
          GetUserData value, $Res Function(GetUserData) then) =
      _$GetUserDataCopyWithImpl<$Res, GetUserData>;
  @useResult
  $Res call(
      {String? customerId,
      double? credits,
      double? lastRechargedCredit,
      DateTime? createdDateTime,
      DateTime? updatedDateTime,
      String? minimumCreditsAllowed,
      bool? userPaid});
}

/// @nodoc
class _$GetUserDataCopyWithImpl<$Res, $Val extends GetUserData>
    implements $GetUserDataCopyWith<$Res> {
  _$GetUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? credits = freezed,
    Object? lastRechargedCredit = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? minimumCreditsAllowed = freezed,
    Object? userPaid = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimumCreditsAllowed: freezed == minimumCreditsAllowed
          ? _value.minimumCreditsAllowed
          : minimumCreditsAllowed // ignore: cast_nullable_to_non_nullable
              as String?,
      userPaid: freezed == userPaid
          ? _value.userPaid
          : userPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserDataImplCopyWith<$Res>
    implements $GetUserDataCopyWith<$Res> {
  factory _$$GetUserDataImplCopyWith(
          _$GetUserDataImpl value, $Res Function(_$GetUserDataImpl) then) =
      __$$GetUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customerId,
      double? credits,
      double? lastRechargedCredit,
      DateTime? createdDateTime,
      DateTime? updatedDateTime,
      String? minimumCreditsAllowed,
      bool? userPaid});
}

/// @nodoc
class __$$GetUserDataImplCopyWithImpl<$Res>
    extends _$GetUserDataCopyWithImpl<$Res, _$GetUserDataImpl>
    implements _$$GetUserDataImplCopyWith<$Res> {
  __$$GetUserDataImplCopyWithImpl(
      _$GetUserDataImpl _value, $Res Function(_$GetUserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? credits = freezed,
    Object? lastRechargedCredit = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? minimumCreditsAllowed = freezed,
    Object? userPaid = freezed,
  }) {
    return _then(_$GetUserDataImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimumCreditsAllowed: freezed == minimumCreditsAllowed
          ? _value.minimumCreditsAllowed
          : minimumCreditsAllowed // ignore: cast_nullable_to_non_nullable
              as String?,
      userPaid: freezed == userPaid
          ? _value.userPaid
          : userPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$GetUserDataImpl implements _GetUserData {
  const _$GetUserDataImpl(
      {this.customerId,
      this.credits,
      this.lastRechargedCredit,
      this.createdDateTime,
      this.updatedDateTime,
      this.minimumCreditsAllowed,
      this.userPaid});

  @override
  final String? customerId;
  @override
  final double? credits;
  @override
  final double? lastRechargedCredit;
  @override
  final DateTime? createdDateTime;
  @override
  final DateTime? updatedDateTime;
  @override
  final String? minimumCreditsAllowed;
  @override
  final bool? userPaid;

  @override
  String toString() {
    return 'GetUserData(customerId: $customerId, credits: $credits, lastRechargedCredit: $lastRechargedCredit, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, minimumCreditsAllowed: $minimumCreditsAllowed, userPaid: $userPaid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserDataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.lastRechargedCredit, lastRechargedCredit) ||
                other.lastRechargedCredit == lastRechargedCredit) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.minimumCreditsAllowed, minimumCreditsAllowed) ||
                other.minimumCreditsAllowed == minimumCreditsAllowed) &&
            (identical(other.userPaid, userPaid) ||
                other.userPaid == userPaid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      credits,
      lastRechargedCredit,
      createdDateTime,
      updatedDateTime,
      minimumCreditsAllowed,
      userPaid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      __$$GetUserDataImplCopyWithImpl<_$GetUserDataImpl>(this, _$identity);
}

abstract class _GetUserData implements GetUserData {
  const factory _GetUserData(
      {final String? customerId,
      final double? credits,
      final double? lastRechargedCredit,
      final DateTime? createdDateTime,
      final DateTime? updatedDateTime,
      final String? minimumCreditsAllowed,
      final bool? userPaid}) = _$GetUserDataImpl;

  @override
  String? get customerId;
  @override
  double? get credits;
  @override
  double? get lastRechargedCredit;
  @override
  DateTime? get createdDateTime;
  @override
  DateTime? get updatedDateTime;
  @override
  String? get minimumCreditsAllowed;
  @override
  bool? get userPaid;
  @override
  @JsonKey(ignore: true)
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
