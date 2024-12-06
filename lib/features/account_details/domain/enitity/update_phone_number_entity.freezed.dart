// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_phone_number_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdatePhoneNumberEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  PhoneData? get phoneData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdatePhoneNumberEntityCopyWith<UpdatePhoneNumberEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePhoneNumberEntityCopyWith<$Res> {
  factory $UpdatePhoneNumberEntityCopyWith(UpdatePhoneNumberEntity value,
          $Res Function(UpdatePhoneNumberEntity) then) =
      _$UpdatePhoneNumberEntityCopyWithImpl<$Res, UpdatePhoneNumberEntity>;
  @useResult
  $Res call({int? responseCode, String? message, PhoneData? phoneData});

  $PhoneDataCopyWith<$Res>? get phoneData;
}

/// @nodoc
class _$UpdatePhoneNumberEntityCopyWithImpl<$Res,
        $Val extends UpdatePhoneNumberEntity>
    implements $UpdatePhoneNumberEntityCopyWith<$Res> {
  _$UpdatePhoneNumberEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? phoneData = freezed,
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
      phoneData: freezed == phoneData
          ? _value.phoneData
          : phoneData // ignore: cast_nullable_to_non_nullable
              as PhoneData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhoneDataCopyWith<$Res>? get phoneData {
    if (_value.phoneData == null) {
      return null;
    }

    return $PhoneDataCopyWith<$Res>(_value.phoneData!, (value) {
      return _then(_value.copyWith(phoneData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdatePhoneNumberEntityImplCopyWith<$Res>
    implements $UpdatePhoneNumberEntityCopyWith<$Res> {
  factory _$$UpdatePhoneNumberEntityImplCopyWith(
          _$UpdatePhoneNumberEntityImpl value,
          $Res Function(_$UpdatePhoneNumberEntityImpl) then) =
      __$$UpdatePhoneNumberEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, PhoneData? phoneData});

  @override
  $PhoneDataCopyWith<$Res>? get phoneData;
}

/// @nodoc
class __$$UpdatePhoneNumberEntityImplCopyWithImpl<$Res>
    extends _$UpdatePhoneNumberEntityCopyWithImpl<$Res,
        _$UpdatePhoneNumberEntityImpl>
    implements _$$UpdatePhoneNumberEntityImplCopyWith<$Res> {
  __$$UpdatePhoneNumberEntityImplCopyWithImpl(
      _$UpdatePhoneNumberEntityImpl _value,
      $Res Function(_$UpdatePhoneNumberEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? phoneData = freezed,
  }) {
    return _then(_$UpdatePhoneNumberEntityImpl(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneData: freezed == phoneData
          ? _value.phoneData
          : phoneData // ignore: cast_nullable_to_non_nullable
              as PhoneData?,
    ));
  }
}

/// @nodoc

class _$UpdatePhoneNumberEntityImpl implements _UpdatePhoneNumberEntity {
  const _$UpdatePhoneNumberEntityImpl(
      {this.responseCode, this.message, this.phoneData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final PhoneData? phoneData;

  @override
  String toString() {
    return 'UpdatePhoneNumberEntity(responseCode: $responseCode, message: $message, phoneData: $phoneData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePhoneNumberEntityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.phoneData, phoneData) ||
                other.phoneData == phoneData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, responseCode, message, phoneData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePhoneNumberEntityImplCopyWith<_$UpdatePhoneNumberEntityImpl>
      get copyWith => __$$UpdatePhoneNumberEntityImplCopyWithImpl<
          _$UpdatePhoneNumberEntityImpl>(this, _$identity);
}

abstract class _UpdatePhoneNumberEntity implements UpdatePhoneNumberEntity {
  const factory _UpdatePhoneNumberEntity(
      {final int? responseCode,
      final String? message,
      final PhoneData? phoneData}) = _$UpdatePhoneNumberEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  PhoneData? get phoneData;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePhoneNumberEntityImplCopyWith<_$UpdatePhoneNumberEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhoneData {
  String? get verificationId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  dynamic get errorMessage => throw _privateConstructorUsedError;
  String? get timeout => throw _privateConstructorUsedError;
  dynamic get smsCli => throw _privateConstructorUsedError;
  dynamic get transactionId => throw _privateConstructorUsedError;
  bool? get newUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneDataCopyWith<PhoneData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneDataCopyWith<$Res> {
  factory $PhoneDataCopyWith(PhoneData value, $Res Function(PhoneData) then) =
      _$PhoneDataCopyWithImpl<$Res, PhoneData>;
  @useResult
  $Res call(
      {String? verificationId,
      String? mobileNumber,
      String? responseCode,
      dynamic errorMessage,
      String? timeout,
      dynamic smsCli,
      dynamic transactionId,
      bool? newUser});
}

/// @nodoc
class _$PhoneDataCopyWithImpl<$Res, $Val extends PhoneData>
    implements $PhoneDataCopyWith<$Res> {
  _$PhoneDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = freezed,
    Object? mobileNumber = freezed,
    Object? responseCode = freezed,
    Object? errorMessage = freezed,
    Object? timeout = freezed,
    Object? smsCli = freezed,
    Object? transactionId = freezed,
    Object? newUser = freezed,
  }) {
    return _then(_value.copyWith(
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as String?,
      smsCli: freezed == smsCli
          ? _value.smsCli
          : smsCli // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneDataImplCopyWith<$Res>
    implements $PhoneDataCopyWith<$Res> {
  factory _$$PhoneDataImplCopyWith(
          _$PhoneDataImpl value, $Res Function(_$PhoneDataImpl) then) =
      __$$PhoneDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? verificationId,
      String? mobileNumber,
      String? responseCode,
      dynamic errorMessage,
      String? timeout,
      dynamic smsCli,
      dynamic transactionId,
      bool? newUser});
}

/// @nodoc
class __$$PhoneDataImplCopyWithImpl<$Res>
    extends _$PhoneDataCopyWithImpl<$Res, _$PhoneDataImpl>
    implements _$$PhoneDataImplCopyWith<$Res> {
  __$$PhoneDataImplCopyWithImpl(
      _$PhoneDataImpl _value, $Res Function(_$PhoneDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = freezed,
    Object? mobileNumber = freezed,
    Object? responseCode = freezed,
    Object? errorMessage = freezed,
    Object? timeout = freezed,
    Object? smsCli = freezed,
    Object? transactionId = freezed,
    Object? newUser = freezed,
  }) {
    return _then(_$PhoneDataImpl(
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as String?,
      smsCli: freezed == smsCli
          ? _value.smsCli
          : smsCli // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$PhoneDataImpl implements _PhoneData {
  const _$PhoneDataImpl(
      {this.verificationId,
      this.mobileNumber,
      this.responseCode,
      this.errorMessage,
      this.timeout,
      this.smsCli,
      this.transactionId,
      this.newUser});

  @override
  final String? verificationId;
  @override
  final String? mobileNumber;
  @override
  final String? responseCode;
  @override
  final dynamic errorMessage;
  @override
  final String? timeout;
  @override
  final dynamic smsCli;
  @override
  final dynamic transactionId;
  @override
  final bool? newUser;

  @override
  String toString() {
    return 'PhoneData(verificationId: $verificationId, mobileNumber: $mobileNumber, responseCode: $responseCode, errorMessage: $errorMessage, timeout: $timeout, smsCli: $smsCli, transactionId: $transactionId, newUser: $newUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneDataImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            const DeepCollectionEquality().equals(other.smsCli, smsCli) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId) &&
            (identical(other.newUser, newUser) || other.newUser == newUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      verificationId,
      mobileNumber,
      responseCode,
      const DeepCollectionEquality().hash(errorMessage),
      timeout,
      const DeepCollectionEquality().hash(smsCli),
      const DeepCollectionEquality().hash(transactionId),
      newUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneDataImplCopyWith<_$PhoneDataImpl> get copyWith =>
      __$$PhoneDataImplCopyWithImpl<_$PhoneDataImpl>(this, _$identity);
}

abstract class _PhoneData implements PhoneData {
  const factory _PhoneData(
      {final String? verificationId,
      final String? mobileNumber,
      final String? responseCode,
      final dynamic errorMessage,
      final String? timeout,
      final dynamic smsCli,
      final dynamic transactionId,
      final bool? newUser}) = _$PhoneDataImpl;

  @override
  String? get verificationId;
  @override
  String? get mobileNumber;
  @override
  String? get responseCode;
  @override
  dynamic get errorMessage;
  @override
  String? get timeout;
  @override
  dynamic get smsCli;
  @override
  dynamic get transactionId;
  @override
  bool? get newUser;
  @override
  @JsonKey(ignore: true)
  _$$PhoneDataImplCopyWith<_$PhoneDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
