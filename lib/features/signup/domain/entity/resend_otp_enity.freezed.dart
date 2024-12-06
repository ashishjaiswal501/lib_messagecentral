// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_otp_enity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResendOtpEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResendOtpEntityCopyWith<ResendOtpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendOtpEntityCopyWith<$Res> {
  factory $ResendOtpEntityCopyWith(
          ResendOtpEntity value, $Res Function(ResendOtpEntity) then) =
      _$ResendOtpEntityCopyWithImpl<$Res, ResendOtpEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$ResendOtpEntityCopyWithImpl<$Res, $Val extends ResendOtpEntity>
    implements $ResendOtpEntityCopyWith<$Res> {
  _$ResendOtpEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$ResendOtpEntityImplCopyWith<$Res>
    implements $ResendOtpEntityCopyWith<$Res> {
  factory _$$ResendOtpEntityImplCopyWith(_$ResendOtpEntityImpl value,
          $Res Function(_$ResendOtpEntityImpl) then) =
      __$$ResendOtpEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$ResendOtpEntityImplCopyWithImpl<$Res>
    extends _$ResendOtpEntityCopyWithImpl<$Res, _$ResendOtpEntityImpl>
    implements _$$ResendOtpEntityImplCopyWith<$Res> {
  __$$ResendOtpEntityImplCopyWithImpl(
      _$ResendOtpEntityImpl _value, $Res Function(_$ResendOtpEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? userData = freezed,
  }) {
    return _then(_$ResendOtpEntityImpl(
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

class _$ResendOtpEntityImpl implements _ResendOtpEntity {
  const _$ResendOtpEntityImpl({this.responseCode, this.message, this.userData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'ResendOtpEntity(responseCode: $responseCode, message: $message, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendOtpEntityImpl &&
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
  _$$ResendOtpEntityImplCopyWith<_$ResendOtpEntityImpl> get copyWith =>
      __$$ResendOtpEntityImplCopyWithImpl<_$ResendOtpEntityImpl>(
          this, _$identity);
}

abstract class _ResendOtpEntity implements ResendOtpEntity {
  const factory _ResendOtpEntity(
      {final int? responseCode,
      final String? message,
      final UserData? userData}) = _$ResendOtpEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$$ResendOtpEntityImplCopyWith<_$ResendOtpEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  String? get verificationId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get timeout => throw _privateConstructorUsedError;
  String? get smsCLI => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  bool? get newUser => throw _privateConstructorUsedError;

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
      String? smsCLI,
      String? transactionId,
      bool? newUser});
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
    Object? smsCLI = freezed,
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
              as String?,
      timeout: freezed == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as String?,
      smsCLI: freezed == smsCLI
          ? _value.smsCLI
          : smsCLI // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      String? smsCLI,
      String? transactionId,
      bool? newUser});
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
    Object? smsCLI = freezed,
    Object? transactionId = freezed,
    Object? newUser = freezed,
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
      smsCLI: freezed == smsCLI
          ? _value.smsCLI
          : smsCLI // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      this.smsCLI,
      this.transactionId,
      this.newUser});

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
  final String? smsCLI;
  @override
  final String? transactionId;
  @override
  final bool? newUser;

  @override
  String toString() {
    return 'UserData(verificationId: $verificationId, mobileNumber: $mobileNumber, responseCode: $responseCode, errorMessage: $errorMessage, timeout: $timeout, smsCLI: $smsCLI, transactionId: $transactionId, newUser: $newUser)';
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
            (identical(other.smsCLI, smsCLI) || other.smsCLI == smsCLI) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.newUser, newUser) || other.newUser == newUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, mobileNumber,
      responseCode, errorMessage, timeout, smsCLI, transactionId, newUser);

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
      final String? smsCLI,
      final String? transactionId,
      final bool? newUser}) = _$UserDataImpl;

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
  String? get smsCLI;
  @override
  String? get transactionId;
  @override
  bool? get newUser;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
