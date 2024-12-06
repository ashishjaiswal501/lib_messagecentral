// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_otp_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordOtpEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordOtpEntityCopyWith<ForgetPasswordOtpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordOtpEntityCopyWith<$Res> {
  factory $ForgetPasswordOtpEntityCopyWith(ForgetPasswordOtpEntity value,
          $Res Function(ForgetPasswordOtpEntity) then) =
      _$ForgetPasswordOtpEntityCopyWithImpl<$Res, ForgetPasswordOtpEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? data});

  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ForgetPasswordOtpEntityCopyWithImpl<$Res,
        $Val extends ForgetPasswordOtpEntity>
    implements $ForgetPasswordOtpEntityCopyWith<$Res> {
  _$ForgetPasswordOtpEntityCopyWithImpl(this._value, this._then);

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
              as UserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForgetPasswordOtpEntityImplCopyWith<$Res>
    implements $ForgetPasswordOtpEntityCopyWith<$Res> {
  factory _$$ForgetPasswordOtpEntityImplCopyWith(
          _$ForgetPasswordOtpEntityImpl value,
          $Res Function(_$ForgetPasswordOtpEntityImpl) then) =
      __$$ForgetPasswordOtpEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? data});

  @override
  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ForgetPasswordOtpEntityImplCopyWithImpl<$Res>
    extends _$ForgetPasswordOtpEntityCopyWithImpl<$Res,
        _$ForgetPasswordOtpEntityImpl>
    implements _$$ForgetPasswordOtpEntityImplCopyWith<$Res> {
  __$$ForgetPasswordOtpEntityImplCopyWithImpl(
      _$ForgetPasswordOtpEntityImpl _value,
      $Res Function(_$ForgetPasswordOtpEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ForgetPasswordOtpEntityImpl(
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
              as UserData?,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordOtpEntityImpl implements _ForgetPasswordOtpEntity {
  const _$ForgetPasswordOtpEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? data;

  @override
  String toString() {
    return 'ForgetPasswordOtpEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordOtpEntityImpl &&
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
  _$$ForgetPasswordOtpEntityImplCopyWith<_$ForgetPasswordOtpEntityImpl>
      get copyWith => __$$ForgetPasswordOtpEntityImplCopyWithImpl<
          _$ForgetPasswordOtpEntityImpl>(this, _$identity);
}

abstract class _ForgetPasswordOtpEntity implements ForgetPasswordOtpEntity {
  const factory _ForgetPasswordOtpEntity(
      {final int? responseCode,
      final String? message,
      final UserData? data}) = _$ForgetPasswordOtpEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get data;
  @override
  @JsonKey(ignore: true)
  _$$ForgetPasswordOtpEntityImplCopyWith<_$ForgetPasswordOtpEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  int? get verificationId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get verificationStatus => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  dynamic get errorMessage => throw _privateConstructorUsedError;
  dynamic get transactionId => throw _privateConstructorUsedError;
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
      dynamic errorMessage,
      dynamic transactionId,
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
              as dynamic,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      dynamic errorMessage,
      dynamic transactionId,
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
              as dynamic,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
  final dynamic errorMessage;
  @override
  final dynamic transactionId;
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
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      verificationId,
      mobileNumber,
      verificationStatus,
      responseCode,
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(transactionId),
      authToken);

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
      final dynamic errorMessage,
      final dynamic transactionId,
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
  dynamic get errorMessage;
  @override
  dynamic get transactionId;
  @override
  String? get authToken;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
