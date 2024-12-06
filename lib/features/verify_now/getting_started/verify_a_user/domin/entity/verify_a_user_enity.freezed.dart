// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_a_user_enity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyAUserEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyAUserEntityCopyWith<VerifyAUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyAUserEntityCopyWith<$Res> {
  factory $VerifyAUserEntityCopyWith(
          VerifyAUserEntity value, $Res Function(VerifyAUserEntity) then) =
      _$VerifyAUserEntityCopyWithImpl<$Res, VerifyAUserEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$VerifyAUserEntityCopyWithImpl<$Res, $Val extends VerifyAUserEntity>
    implements $VerifyAUserEntityCopyWith<$Res> {
  _$VerifyAUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? userData = freezed,
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
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyAUserEntityImplCopyWith<$Res>
    implements $VerifyAUserEntityCopyWith<$Res> {
  factory _$$VerifyAUserEntityImplCopyWith(_$VerifyAUserEntityImpl value,
          $Res Function(_$VerifyAUserEntityImpl) then) =
      __$$VerifyAUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$VerifyAUserEntityImplCopyWithImpl<$Res>
    extends _$VerifyAUserEntityCopyWithImpl<$Res, _$VerifyAUserEntityImpl>
    implements _$$VerifyAUserEntityImplCopyWith<$Res> {
  __$$VerifyAUserEntityImplCopyWithImpl(_$VerifyAUserEntityImpl _value,
      $Res Function(_$VerifyAUserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? userData = freezed,
  }) {
    return _then(_$VerifyAUserEntityImpl(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc

class _$VerifyAUserEntityImpl implements _VerifyAUserEntity {
  const _$VerifyAUserEntityImpl(
      {this.responseCode, this.message, this.userData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'VerifyAUserEntity(responseCode: $responseCode, message: $message, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyAUserEntityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyAUserEntityImplCopyWith<_$VerifyAUserEntityImpl> get copyWith =>
      __$$VerifyAUserEntityImplCopyWithImpl<_$VerifyAUserEntityImpl>(
          this, _$identity);
}

abstract class _VerifyAUserEntity implements VerifyAUserEntity {
  const factory _VerifyAUserEntity(
      {final int? responseCode,
      final String? message,
      final UserData? userData}) = _$VerifyAUserEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$$VerifyAUserEntityImplCopyWith<_$VerifyAUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  String? get verificationId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get timeout => throw _privateConstructorUsedError;
  String? get smsCli => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get verificationStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String? verificationId,
      String? mobileNumber,
      String? responseCode,
      String? errorMessage,
      String? timeout,
      String? smsCli,
      String? transactionId,
      String? verificationStatus});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

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
    Object? verificationStatus = freezed,
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
              as String?,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as String?,
      smsCli: freezed == smsCli
          ? _value.smsCli
          : smsCli // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? verificationId,
      String? mobileNumber,
      String? responseCode,
      String? errorMessage,
      String? timeout,
      String? smsCli,
      String? transactionId,
      String? verificationStatus});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
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
    Object? verificationStatus = freezed,
  }) {
    return _then(_$UserDataImpl(
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
              as String?,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as String?,
      smsCli: freezed == smsCli
          ? _value.smsCli
          : smsCli // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.verificationId,
      this.mobileNumber,
      this.responseCode,
      this.errorMessage,
      this.timeout,
      this.smsCli,
      this.transactionId,
      this.verificationStatus});

  @override
  final String? verificationId;
  @override
  final String? mobileNumber;
  @override
  final String? responseCode;
  @override
  final String? errorMessage;
  @override
  final String? timeout;
  @override
  final String? smsCli;
  @override
  final String? transactionId;
  @override
  final String? verificationStatus;

  @override
  String toString() {
    return 'UserData(verificationId: $verificationId, mobileNumber: $mobileNumber, responseCode: $responseCode, errorMessage: $errorMessage, timeout: $timeout, smsCli: $smsCli, transactionId: $transactionId, verificationStatus: $verificationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.smsCli, smsCli) || other.smsCli == smsCli) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      verificationId,
      mobileNumber,
      responseCode,
      errorMessage,
      timeout,
      smsCli,
      transactionId,
      verificationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final String? verificationId,
      final String? mobileNumber,
      final String? responseCode,
      final String? errorMessage,
      final String? timeout,
      final String? smsCli,
      final String? transactionId,
      final String? verificationStatus}) = _$UserDataImpl;

  @override
  String? get verificationId;
  @override
  String? get mobileNumber;
  @override
  String? get responseCode;
  @override
  String? get errorMessage;
  @override
  String? get timeout;
  @override
  String? get smsCli;
  @override
  String? get transactionId;
  @override
  String? get verificationStatus;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
