// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_otp_enity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupOtpEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupOtpEntityCopyWith<SignupOtpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupOtpEntityCopyWith<$Res> {
  factory $SignupOtpEntityCopyWith(
          SignupOtpEntity value, $Res Function(SignupOtpEntity) then) =
      _$SignupOtpEntityCopyWithImpl<$Res, SignupOtpEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$SignupOtpEntityCopyWithImpl<$Res, $Val extends SignupOtpEntity>
    implements $SignupOtpEntityCopyWith<$Res> {
  _$SignupOtpEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$SignupOtpEntityImplCopyWith<$Res>
    implements $SignupOtpEntityCopyWith<$Res> {
  factory _$$SignupOtpEntityImplCopyWith(_$SignupOtpEntityImpl value,
          $Res Function(_$SignupOtpEntityImpl) then) =
      __$$SignupOtpEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$SignupOtpEntityImplCopyWithImpl<$Res>
    extends _$SignupOtpEntityCopyWithImpl<$Res, _$SignupOtpEntityImpl>
    implements _$$SignupOtpEntityImplCopyWith<$Res> {
  __$$SignupOtpEntityImplCopyWithImpl(
      _$SignupOtpEntityImpl _value, $Res Function(_$SignupOtpEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? userData = freezed,
  }) {
    return _then(_$SignupOtpEntityImpl(
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

class _$SignupOtpEntityImpl implements _SignupOtpEntity {
  const _$SignupOtpEntityImpl({this.responseCode, this.message, this.userData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'SignupOtpEntity(responseCode: $responseCode, message: $message, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupOtpEntityImpl &&
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
  _$$SignupOtpEntityImplCopyWith<_$SignupOtpEntityImpl> get copyWith =>
      __$$SignupOtpEntityImplCopyWithImpl<_$SignupOtpEntityImpl>(
          this, _$identity);
}

abstract class _SignupOtpEntity implements SignupOtpEntity {
  const factory _SignupOtpEntity(
      {final int? responseCode,
      final String? message,
      final UserData? userData}) = _$SignupOtpEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$$SignupOtpEntityImplCopyWith<_$SignupOtpEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  String? get customerId => throw _privateConstructorUsedError;
  String? get otpVerificationId => throw _privateConstructorUsedError;
  String? get accountStatus => throw _privateConstructorUsedError;
  String? get countryStatus => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get countryName => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

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
      {String? customerId,
      String? otpVerificationId,
      String? accountStatus,
      String? countryStatus,
      String? countryCode,
      String? mobileNumber,
      String? countryName,
      String? fullName,
      String? email});
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
    Object? customerId = freezed,
    Object? otpVerificationId = freezed,
    Object? accountStatus = freezed,
    Object? countryStatus = freezed,
    Object? countryCode = freezed,
    Object? mobileNumber = freezed,
    Object? countryName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      otpVerificationId: freezed == otpVerificationId
          ? _value.otpVerificationId
          : otpVerificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountStatus: freezed == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      countryStatus: freezed == countryStatus
          ? _value.countryStatus
          : countryStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
      {String? customerId,
      String? otpVerificationId,
      String? accountStatus,
      String? countryStatus,
      String? countryCode,
      String? mobileNumber,
      String? countryName,
      String? fullName,
      String? email});
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
    Object? customerId = freezed,
    Object? otpVerificationId = freezed,
    Object? accountStatus = freezed,
    Object? countryStatus = freezed,
    Object? countryCode = freezed,
    Object? mobileNumber = freezed,
    Object? countryName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
  }) {
    return _then(_$UserDataImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      otpVerificationId: freezed == otpVerificationId
          ? _value.otpVerificationId
          : otpVerificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      accountStatus: freezed == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      countryStatus: freezed == countryStatus
          ? _value.countryStatus
          : countryStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.customerId,
      this.otpVerificationId,
      this.accountStatus,
      this.countryStatus,
      this.countryCode,
      this.mobileNumber,
      this.countryName,
      this.fullName,
      this.email});

  @override
  final String? customerId;
  @override
  final String? otpVerificationId;
  @override
  final String? accountStatus;
  @override
  final String? countryStatus;
  @override
  final String? countryCode;
  @override
  final String? mobileNumber;
  @override
  final String? countryName;
  @override
  final String? fullName;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserData(customerId: $customerId, otpVerificationId: $otpVerificationId, accountStatus: $accountStatus, countryStatus: $countryStatus, countryCode: $countryCode, mobileNumber: $mobileNumber, countryName: $countryName, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.otpVerificationId, otpVerificationId) ||
                other.otpVerificationId == otpVerificationId) &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            (identical(other.countryStatus, countryStatus) ||
                other.countryStatus == countryStatus) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      otpVerificationId,
      accountStatus,
      countryStatus,
      countryCode,
      mobileNumber,
      countryName,
      fullName,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final String? customerId,
      final String? otpVerificationId,
      final String? accountStatus,
      final String? countryStatus,
      final String? countryCode,
      final String? mobileNumber,
      final String? countryName,
      final String? fullName,
      final String? email}) = _$UserDataImpl;

  @override
  String? get customerId;
  @override
  String? get otpVerificationId;
  @override
  String? get accountStatus;
  @override
  String? get countryStatus;
  @override
  String? get countryCode;
  @override
  String? get mobileNumber;
  @override
  String? get countryName;
  @override
  String? get fullName;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
