// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_enity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginEntityCopyWith<LoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEntityCopyWith<$Res> {
  factory $LoginEntityCopyWith(
          LoginEntity value, $Res Function(LoginEntity) then) =
      _$LoginEntityCopyWithImpl<$Res, LoginEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$LoginEntityCopyWithImpl<$Res, $Val extends LoginEntity>
    implements $LoginEntityCopyWith<$Res> {
  _$LoginEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$LoginEntityImplCopyWith<$Res>
    implements $LoginEntityCopyWith<$Res> {
  factory _$$LoginEntityImplCopyWith(
          _$LoginEntityImpl value, $Res Function(_$LoginEntityImpl) then) =
      __$$LoginEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? userData});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$LoginEntityImplCopyWithImpl<$Res>
    extends _$LoginEntityCopyWithImpl<$Res, _$LoginEntityImpl>
    implements _$$LoginEntityImplCopyWith<$Res> {
  __$$LoginEntityImplCopyWithImpl(
      _$LoginEntityImpl _value, $Res Function(_$LoginEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? userData = freezed,
  }) {
    return _then(_$LoginEntityImpl(
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

class _$LoginEntityImpl implements _LoginEntity {
  const _$LoginEntityImpl({this.responseCode, this.message, this.userData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'LoginEntity(responseCode: $responseCode, message: $message, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEntityImpl &&
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
  _$$LoginEntityImplCopyWith<_$LoginEntityImpl> get copyWith =>
      __$$LoginEntityImplCopyWithImpl<_$LoginEntityImpl>(this, _$identity);
}

abstract class _LoginEntity implements LoginEntity {
  const factory _LoginEntity(
      {final int? responseCode,
      final String? message,
      final UserData? userData}) = _$LoginEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$$LoginEntityImplCopyWith<_$LoginEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  String? get authToken => throw _privateConstructorUsedError;
  String? get tempToken => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get accountStatus => throw _privateConstructorUsedError;
  String? get countryStatus => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get phoneNo => throw _privateConstructorUsedError;
  String? get mobileNumberAvailable => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool? get otpVerification => throw _privateConstructorUsedError;

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
      {String? authToken,
      String? tempToken,
      String? customerId,
      String? accountStatus,
      String? countryStatus,
      String? countryCode,
      String? phoneNo,
      String? mobileNumberAvailable,
      String? firstName,
      String? email,
      bool? otpVerification});
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
    Object? authToken = freezed,
    Object? tempToken = freezed,
    Object? customerId = freezed,
    Object? accountStatus = freezed,
    Object? countryStatus = freezed,
    Object? countryCode = freezed,
    Object? phoneNo = freezed,
    Object? mobileNumberAvailable = freezed,
    Object? firstName = freezed,
    Object? email = freezed,
    Object? otpVerification = freezed,
  }) {
    return _then(_value.copyWith(
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tempToken: freezed == tempToken
          ? _value.tempToken
          : tempToken // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
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
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumberAvailable: freezed == mobileNumberAvailable
          ? _value.mobileNumberAvailable
          : mobileNumberAvailable // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otpVerification: freezed == otpVerification
          ? _value.otpVerification
          : otpVerification // ignore: cast_nullable_to_non_nullable
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
      {String? authToken,
      String? tempToken,
      String? customerId,
      String? accountStatus,
      String? countryStatus,
      String? countryCode,
      String? phoneNo,
      String? mobileNumberAvailable,
      String? firstName,
      String? email,
      bool? otpVerification});
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
    Object? authToken = freezed,
    Object? tempToken = freezed,
    Object? customerId = freezed,
    Object? accountStatus = freezed,
    Object? countryStatus = freezed,
    Object? countryCode = freezed,
    Object? phoneNo = freezed,
    Object? mobileNumberAvailable = freezed,
    Object? firstName = freezed,
    Object? email = freezed,
    Object? otpVerification = freezed,
  }) {
    return _then(_$UserDataImpl(
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tempToken: freezed == tempToken
          ? _value.tempToken
          : tempToken // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
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
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumberAvailable: freezed == mobileNumberAvailable
          ? _value.mobileNumberAvailable
          : mobileNumberAvailable // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      otpVerification: freezed == otpVerification
          ? _value.otpVerification
          : otpVerification // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.authToken,
      this.tempToken,
      this.customerId,
      this.accountStatus,
      this.countryStatus,
      this.countryCode,
      this.phoneNo,
      this.mobileNumberAvailable,
      this.firstName,
      this.email,
      this.otpVerification});

  @override
  final String? authToken;
  @override
  final String? tempToken;
  @override
  final String? customerId;
  @override
  final String? accountStatus;
  @override
  final String? countryStatus;
  @override
  final String? countryCode;
  @override
  final String? phoneNo;
  @override
  final String? mobileNumberAvailable;
  @override
  final String? firstName;
  @override
  final String? email;
  @override
  final bool? otpVerification;

  @override
  String toString() {
    return 'UserData(authToken: $authToken, tempToken: $tempToken, customerId: $customerId, accountStatus: $accountStatus, countryStatus: $countryStatus, countryCode: $countryCode, phoneNo: $phoneNo, mobileNumberAvailable: $mobileNumberAvailable, firstName: $firstName, email: $email, otpVerification: $otpVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.tempToken, tempToken) ||
                other.tempToken == tempToken) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            (identical(other.countryStatus, countryStatus) ||
                other.countryStatus == countryStatus) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.mobileNumberAvailable, mobileNumberAvailable) ||
                other.mobileNumberAvailable == mobileNumberAvailable) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otpVerification, otpVerification) ||
                other.otpVerification == otpVerification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authToken,
      tempToken,
      customerId,
      accountStatus,
      countryStatus,
      countryCode,
      phoneNo,
      mobileNumberAvailable,
      firstName,
      email,
      otpVerification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final String? authToken,
      final String? tempToken,
      final String? customerId,
      final String? accountStatus,
      final String? countryStatus,
      final String? countryCode,
      final String? phoneNo,
      final String? mobileNumberAvailable,
      final String? firstName,
      final String? email,
      final bool? otpVerification}) = _$UserDataImpl;

  @override
  String? get authToken;
  @override
  String? get tempToken;
  @override
  String? get customerId;
  @override
  String? get accountStatus;
  @override
  String? get countryStatus;
  @override
  String? get countryCode;
  @override
  String? get phoneNo;
  @override
  String? get mobileNumberAvailable;
  @override
  String? get firstName;
  @override
  String? get email;
  @override
  bool? get otpVerification;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
