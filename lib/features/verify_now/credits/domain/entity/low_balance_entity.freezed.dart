// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'low_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LowBalanceEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  set responseCode(int? value) => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  set message(String? value) => throw _privateConstructorUsedError;
  DataLowBalance? get data => throw _privateConstructorUsedError;
  set data(DataLowBalance? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LowBalanceEntityCopyWith<LowBalanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LowBalanceEntityCopyWith<$Res> {
  factory $LowBalanceEntityCopyWith(
          LowBalanceEntity value, $Res Function(LowBalanceEntity) then) =
      _$LowBalanceEntityCopyWithImpl<$Res, LowBalanceEntity>;
  @useResult
  $Res call({int? responseCode, String? message, DataLowBalance? data});

  $DataLowBalanceCopyWith<$Res>? get data;
}

/// @nodoc
class _$LowBalanceEntityCopyWithImpl<$Res, $Val extends LowBalanceEntity>
    implements $LowBalanceEntityCopyWith<$Res> {
  _$LowBalanceEntityCopyWithImpl(this._value, this._then);

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
              as DataLowBalance?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataLowBalanceCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataLowBalanceCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LowBalanceEntityImplCopyWith<$Res>
    implements $LowBalanceEntityCopyWith<$Res> {
  factory _$$LowBalanceEntityImplCopyWith(_$LowBalanceEntityImpl value,
          $Res Function(_$LowBalanceEntityImpl) then) =
      __$$LowBalanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, DataLowBalance? data});

  @override
  $DataLowBalanceCopyWith<$Res>? get data;
}

/// @nodoc
class __$$LowBalanceEntityImplCopyWithImpl<$Res>
    extends _$LowBalanceEntityCopyWithImpl<$Res, _$LowBalanceEntityImpl>
    implements _$$LowBalanceEntityImplCopyWith<$Res> {
  __$$LowBalanceEntityImplCopyWithImpl(_$LowBalanceEntityImpl _value,
      $Res Function(_$LowBalanceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LowBalanceEntityImpl(
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
              as DataLowBalance?,
    ));
  }
}

/// @nodoc

class _$LowBalanceEntityImpl implements _LowBalanceEntity {
  _$LowBalanceEntityImpl({this.responseCode, this.message, this.data});

  @override
  int? responseCode;
  @override
  String? message;
  @override
  DataLowBalance? data;

  @override
  String toString() {
    return 'LowBalanceEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LowBalanceEntityImplCopyWith<_$LowBalanceEntityImpl> get copyWith =>
      __$$LowBalanceEntityImplCopyWithImpl<_$LowBalanceEntityImpl>(
          this, _$identity);
}

abstract class _LowBalanceEntity implements LowBalanceEntity {
  factory _LowBalanceEntity(
      {int? responseCode,
      String? message,
      DataLowBalance? data}) = _$LowBalanceEntityImpl;

  @override
  int? get responseCode;
  set responseCode(int? value);
  @override
  String? get message;
  set message(String? value);
  @override
  DataLowBalance? get data;
  set data(DataLowBalance? value);
  @override
  @JsonKey(ignore: true)
  _$$LowBalanceEntityImplCopyWith<_$LowBalanceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataLowBalance {
  String? get customerId => throw _privateConstructorUsedError;
  set customerId(String? value) => throw _privateConstructorUsedError;
  int? get alertAmount => throw _privateConstructorUsedError;
  set alertAmount(int? value) => throw _privateConstructorUsedError;
  dynamic get alternaletcountryCode1 => throw _privateConstructorUsedError;
  set alternaletcountryCode1(dynamic value) =>
      throw _privateConstructorUsedError;
  dynamic get alternatePhoneNo1 => throw _privateConstructorUsedError;
  set alternatePhoneNo1(dynamic value) => throw _privateConstructorUsedError;
  dynamic get alternaletcountryCode2 => throw _privateConstructorUsedError;
  set alternaletcountryCode2(dynamic value) =>
      throw _privateConstructorUsedError;
  dynamic get alternatePhoneNo2 => throw _privateConstructorUsedError;
  set alternatePhoneNo2(dynamic value) => throw _privateConstructorUsedError;
  bool? get lowBalanceAlertFlag => throw _privateConstructorUsedError;
  set lowBalanceAlertFlag(bool? value) => throw _privateConstructorUsedError;
  bool? get islowBalanceAlertSent => throw _privateConstructorUsedError;
  set islowBalanceAlertSent(bool? value) => throw _privateConstructorUsedError;
  dynamic get lowBalanceAlertSentDateTime => throw _privateConstructorUsedError;
  set lowBalanceAlertSentDateTime(dynamic value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataLowBalanceCopyWith<DataLowBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataLowBalanceCopyWith<$Res> {
  factory $DataLowBalanceCopyWith(
          DataLowBalance value, $Res Function(DataLowBalance) then) =
      _$DataLowBalanceCopyWithImpl<$Res, DataLowBalance>;
  @useResult
  $Res call(
      {String? customerId,
      int? alertAmount,
      dynamic alternaletcountryCode1,
      dynamic alternatePhoneNo1,
      dynamic alternaletcountryCode2,
      dynamic alternatePhoneNo2,
      bool? lowBalanceAlertFlag,
      bool? islowBalanceAlertSent,
      dynamic lowBalanceAlertSentDateTime});
}

/// @nodoc
class _$DataLowBalanceCopyWithImpl<$Res, $Val extends DataLowBalance>
    implements $DataLowBalanceCopyWith<$Res> {
  _$DataLowBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? alertAmount = freezed,
    Object? alternaletcountryCode1 = freezed,
    Object? alternatePhoneNo1 = freezed,
    Object? alternaletcountryCode2 = freezed,
    Object? alternatePhoneNo2 = freezed,
    Object? lowBalanceAlertFlag = freezed,
    Object? islowBalanceAlertSent = freezed,
    Object? lowBalanceAlertSentDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      alertAmount: freezed == alertAmount
          ? _value.alertAmount
          : alertAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      alternaletcountryCode1: freezed == alternaletcountryCode1
          ? _value.alternaletcountryCode1
          : alternaletcountryCode1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo1: freezed == alternatePhoneNo1
          ? _value.alternatePhoneNo1
          : alternatePhoneNo1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternaletcountryCode2: freezed == alternaletcountryCode2
          ? _value.alternaletcountryCode2
          : alternaletcountryCode2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo2: freezed == alternatePhoneNo2
          ? _value.alternatePhoneNo2
          : alternatePhoneNo2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lowBalanceAlertFlag: freezed == lowBalanceAlertFlag
          ? _value.lowBalanceAlertFlag
          : lowBalanceAlertFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      islowBalanceAlertSent: freezed == islowBalanceAlertSent
          ? _value.islowBalanceAlertSent
          : islowBalanceAlertSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowBalanceAlertSentDateTime: freezed == lowBalanceAlertSentDateTime
          ? _value.lowBalanceAlertSentDateTime
          : lowBalanceAlertSentDateTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataLowBalanceImplCopyWith<$Res>
    implements $DataLowBalanceCopyWith<$Res> {
  factory _$$DataLowBalanceImplCopyWith(_$DataLowBalanceImpl value,
          $Res Function(_$DataLowBalanceImpl) then) =
      __$$DataLowBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customerId,
      int? alertAmount,
      dynamic alternaletcountryCode1,
      dynamic alternatePhoneNo1,
      dynamic alternaletcountryCode2,
      dynamic alternatePhoneNo2,
      bool? lowBalanceAlertFlag,
      bool? islowBalanceAlertSent,
      dynamic lowBalanceAlertSentDateTime});
}

/// @nodoc
class __$$DataLowBalanceImplCopyWithImpl<$Res>
    extends _$DataLowBalanceCopyWithImpl<$Res, _$DataLowBalanceImpl>
    implements _$$DataLowBalanceImplCopyWith<$Res> {
  __$$DataLowBalanceImplCopyWithImpl(
      _$DataLowBalanceImpl _value, $Res Function(_$DataLowBalanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? alertAmount = freezed,
    Object? alternaletcountryCode1 = freezed,
    Object? alternatePhoneNo1 = freezed,
    Object? alternaletcountryCode2 = freezed,
    Object? alternatePhoneNo2 = freezed,
    Object? lowBalanceAlertFlag = freezed,
    Object? islowBalanceAlertSent = freezed,
    Object? lowBalanceAlertSentDateTime = freezed,
  }) {
    return _then(_$DataLowBalanceImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      alertAmount: freezed == alertAmount
          ? _value.alertAmount
          : alertAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      alternaletcountryCode1: freezed == alternaletcountryCode1
          ? _value.alternaletcountryCode1
          : alternaletcountryCode1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo1: freezed == alternatePhoneNo1
          ? _value.alternatePhoneNo1
          : alternatePhoneNo1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternaletcountryCode2: freezed == alternaletcountryCode2
          ? _value.alternaletcountryCode2
          : alternaletcountryCode2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo2: freezed == alternatePhoneNo2
          ? _value.alternatePhoneNo2
          : alternatePhoneNo2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lowBalanceAlertFlag: freezed == lowBalanceAlertFlag
          ? _value.lowBalanceAlertFlag
          : lowBalanceAlertFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      islowBalanceAlertSent: freezed == islowBalanceAlertSent
          ? _value.islowBalanceAlertSent
          : islowBalanceAlertSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowBalanceAlertSentDateTime: freezed == lowBalanceAlertSentDateTime
          ? _value.lowBalanceAlertSentDateTime
          : lowBalanceAlertSentDateTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$DataLowBalanceImpl implements _DataLowBalance {
  _$DataLowBalanceImpl(
      {this.customerId,
      this.alertAmount,
      this.alternaletcountryCode1,
      this.alternatePhoneNo1,
      this.alternaletcountryCode2,
      this.alternatePhoneNo2,
      this.lowBalanceAlertFlag,
      this.islowBalanceAlertSent,
      this.lowBalanceAlertSentDateTime});

  @override
  String? customerId;
  @override
  int? alertAmount;
  @override
  dynamic alternaletcountryCode1;
  @override
  dynamic alternatePhoneNo1;
  @override
  dynamic alternaletcountryCode2;
  @override
  dynamic alternatePhoneNo2;
  @override
  bool? lowBalanceAlertFlag;
  @override
  bool? islowBalanceAlertSent;
  @override
  dynamic lowBalanceAlertSentDateTime;

  @override
  String toString() {
    return 'DataLowBalance(customerId: $customerId, alertAmount: $alertAmount, alternaletcountryCode1: $alternaletcountryCode1, alternatePhoneNo1: $alternatePhoneNo1, alternaletcountryCode2: $alternaletcountryCode2, alternatePhoneNo2: $alternatePhoneNo2, lowBalanceAlertFlag: $lowBalanceAlertFlag, islowBalanceAlertSent: $islowBalanceAlertSent, lowBalanceAlertSentDateTime: $lowBalanceAlertSentDateTime)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataLowBalanceImplCopyWith<_$DataLowBalanceImpl> get copyWith =>
      __$$DataLowBalanceImplCopyWithImpl<_$DataLowBalanceImpl>(
          this, _$identity);
}

abstract class _DataLowBalance implements DataLowBalance {
  factory _DataLowBalance(
      {String? customerId,
      int? alertAmount,
      dynamic alternaletcountryCode1,
      dynamic alternatePhoneNo1,
      dynamic alternaletcountryCode2,
      dynamic alternatePhoneNo2,
      bool? lowBalanceAlertFlag,
      bool? islowBalanceAlertSent,
      dynamic lowBalanceAlertSentDateTime}) = _$DataLowBalanceImpl;

  @override
  String? get customerId;
  set customerId(String? value);
  @override
  int? get alertAmount;
  set alertAmount(int? value);
  @override
  dynamic get alternaletcountryCode1;
  set alternaletcountryCode1(dynamic value);
  @override
  dynamic get alternatePhoneNo1;
  set alternatePhoneNo1(dynamic value);
  @override
  dynamic get alternaletcountryCode2;
  set alternaletcountryCode2(dynamic value);
  @override
  dynamic get alternatePhoneNo2;
  set alternatePhoneNo2(dynamic value);
  @override
  bool? get lowBalanceAlertFlag;
  set lowBalanceAlertFlag(bool? value);
  @override
  bool? get islowBalanceAlertSent;
  set islowBalanceAlertSent(bool? value);
  @override
  dynamic get lowBalanceAlertSentDateTime;
  set lowBalanceAlertSentDateTime(dynamic value);
  @override
  @JsonKey(ignore: true)
  _$$DataLowBalanceImplCopyWith<_$DataLowBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
