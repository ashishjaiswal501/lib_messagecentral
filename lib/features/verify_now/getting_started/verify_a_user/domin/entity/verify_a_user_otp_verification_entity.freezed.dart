// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_a_user_otp_verification_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyAUserOtpVerificationEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyAUserOtpVerificationEntityCopyWith<VerifyAUserOtpVerificationEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyAUserOtpVerificationEntityCopyWith<$Res> {
  factory $VerifyAUserOtpVerificationEntityCopyWith(
          VerifyAUserOtpVerificationEntity value,
          $Res Function(VerifyAUserOtpVerificationEntity) then) =
      _$VerifyAUserOtpVerificationEntityCopyWithImpl<$Res,
          VerifyAUserOtpVerificationEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$VerifyAUserOtpVerificationEntityCopyWithImpl<$Res,
        $Val extends VerifyAUserOtpVerificationEntity>
    implements $VerifyAUserOtpVerificationEntityCopyWith<$Res> {
  _$VerifyAUserOtpVerificationEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$VerifyAUserOtpVerificationEntityImplCopyWith<$Res>
    implements $VerifyAUserOtpVerificationEntityCopyWith<$Res> {
  factory _$$VerifyAUserOtpVerificationEntityImplCopyWith(
          _$VerifyAUserOtpVerificationEntityImpl value,
          $Res Function(_$VerifyAUserOtpVerificationEntityImpl) then) =
      __$$VerifyAUserOtpVerificationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$VerifyAUserOtpVerificationEntityImplCopyWithImpl<$Res>
    extends _$VerifyAUserOtpVerificationEntityCopyWithImpl<$Res,
        _$VerifyAUserOtpVerificationEntityImpl>
    implements _$$VerifyAUserOtpVerificationEntityImplCopyWith<$Res> {
  __$$VerifyAUserOtpVerificationEntityImplCopyWithImpl(
      _$VerifyAUserOtpVerificationEntityImpl _value,
      $Res Function(_$VerifyAUserOtpVerificationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? userData = freezed,
  }) {
    return _then(_$VerifyAUserOtpVerificationEntityImpl(
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

class _$VerifyAUserOtpVerificationEntityImpl
    implements _VerifyAUserOtpVerificationEntity {
  const _$VerifyAUserOtpVerificationEntityImpl(
      {this.responseCode, this.message, this.userData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'VerifyAUserOtpVerificationEntity(responseCode: $responseCode, message: $message, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyAUserOtpVerificationEntityImpl &&
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
  _$$VerifyAUserOtpVerificationEntityImplCopyWith<
          _$VerifyAUserOtpVerificationEntityImpl>
      get copyWith => __$$VerifyAUserOtpVerificationEntityImplCopyWithImpl<
          _$VerifyAUserOtpVerificationEntityImpl>(this, _$identity);
}

abstract class _VerifyAUserOtpVerificationEntity
    implements VerifyAUserOtpVerificationEntity {
  const factory _VerifyAUserOtpVerificationEntity(
      {final int? responseCode,
      final String? message,
      final UserData? userData}) = _$VerifyAUserOtpVerificationEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$$VerifyAUserOtpVerificationEntityImplCopyWith<
          _$VerifyAUserOtpVerificationEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  int? get verificationId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get verificationStatus => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get authToken => throw _privateConstructorUsedError;

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
      {int? verificationId,
      String? mobileNumber,
      String? verificationStatus,
      String? responseCode,
      String? errorMessage,
      String? transactionId,
      String? authToken});
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
    Object? verificationStatus = freezed,
    Object? responseCode = freezed,
    Object? errorMessage = freezed,
    Object? transactionId = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_value.copyWith(
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
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
      {int? verificationId,
      String? mobileNumber,
      String? verificationStatus,
      String? responseCode,
      String? errorMessage,
      String? transactionId,
      String? authToken});
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
    Object? verificationStatus = freezed,
    Object? responseCode = freezed,
    Object? errorMessage = freezed,
    Object? transactionId = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_$UserDataImpl(
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.verificationId,
      this.mobileNumber,
      this.verificationStatus,
      this.responseCode,
      this.errorMessage,
      this.transactionId,
      this.authToken});

  @override
  final int? verificationId;
  @override
  final String? mobileNumber;
  @override
  final String? verificationStatus;
  @override
  final String? responseCode;
  @override
  final String? errorMessage;
  @override
  final String? transactionId;
  @override
  final String? authToken;

  @override
  String toString() {
    return 'UserData(verificationId: $verificationId, mobileNumber: $mobileNumber, verificationStatus: $verificationStatus, responseCode: $responseCode, errorMessage: $errorMessage, transactionId: $transactionId, authToken: $authToken)';
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
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, mobileNumber,
      verificationStatus, responseCode, errorMessage, transactionId, authToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final int? verificationId,
      final String? mobileNumber,
      final String? verificationStatus,
      final String? responseCode,
      final String? errorMessage,
      final String? transactionId,
      final String? authToken}) = _$UserDataImpl;

  @override
  int? get verificationId;
  @override
  String? get mobileNumber;
  @override
  String? get verificationStatus;
  @override
  String? get responseCode;
  @override
  String? get errorMessage;
  @override
  String? get transactionId;
  @override
  String? get authToken;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
