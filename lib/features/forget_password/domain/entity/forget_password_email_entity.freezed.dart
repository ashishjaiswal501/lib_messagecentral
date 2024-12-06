// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_email_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordEmailEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordEmailEntityCopyWith<ForgetPasswordEmailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordEmailEntityCopyWith<$Res> {
  factory $ForgetPasswordEmailEntityCopyWith(ForgetPasswordEmailEntity value,
          $Res Function(ForgetPasswordEmailEntity) then) =
      _$ForgetPasswordEmailEntityCopyWithImpl<$Res, ForgetPasswordEmailEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? data});

  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ForgetPasswordEmailEntityCopyWithImpl<$Res,
        $Val extends ForgetPasswordEmailEntity>
    implements $ForgetPasswordEmailEntityCopyWith<$Res> {
  _$ForgetPasswordEmailEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$ForgetPasswordEmailEntityImplCopyWith<$Res>
    implements $ForgetPasswordEmailEntityCopyWith<$Res> {
  factory _$$ForgetPasswordEmailEntityImplCopyWith(
          _$ForgetPasswordEmailEntityImpl value,
          $Res Function(_$ForgetPasswordEmailEntityImpl) then) =
      __$$ForgetPasswordEmailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? data});

  @override
  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ForgetPasswordEmailEntityImplCopyWithImpl<$Res>
    extends _$ForgetPasswordEmailEntityCopyWithImpl<$Res,
        _$ForgetPasswordEmailEntityImpl>
    implements _$$ForgetPasswordEmailEntityImplCopyWith<$Res> {
  __$$ForgetPasswordEmailEntityImplCopyWithImpl(
      _$ForgetPasswordEmailEntityImpl _value,
      $Res Function(_$ForgetPasswordEmailEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ForgetPasswordEmailEntityImpl(
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

class _$ForgetPasswordEmailEntityImpl implements _ForgetPasswordEmailEntity {
  const _$ForgetPasswordEmailEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? data;

  @override
  String toString() {
    return 'ForgetPasswordEmailEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordEmailEntityImpl &&
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
  _$$ForgetPasswordEmailEntityImplCopyWith<_$ForgetPasswordEmailEntityImpl>
      get copyWith => __$$ForgetPasswordEmailEntityImplCopyWithImpl<
          _$ForgetPasswordEmailEntityImpl>(this, _$identity);
}

abstract class _ForgetPasswordEmailEntity implements ForgetPasswordEmailEntity {
  const factory _ForgetPasswordEmailEntity(
      {final int? responseCode,
      final String? message,
      final UserData? data}) = _$ForgetPasswordEmailEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get data;
  @override
  @JsonKey(ignore: true)
  _$$ForgetPasswordEmailEntityImplCopyWith<_$ForgetPasswordEmailEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  String? get verificationId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  dynamic get errorMessage => throw _privateConstructorUsedError;
  String? get timeout => throw _privateConstructorUsedError;
  dynamic get smsCli => throw _privateConstructorUsedError;
  dynamic get transactionId => throw _privateConstructorUsedError;
  bool? get newUser => throw _privateConstructorUsedError;
  String? get accountStatus => throw _privateConstructorUsedError;
  String? get countryStatus => throw _privateConstructorUsedError;

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
      dynamic errorMessage,
      String? timeout,
      dynamic smsCli,
      dynamic transactionId,
      bool? newUser,
      String? accountStatus,
      String? countryStatus});
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
    Object? newUser = freezed,
    Object? accountStatus = freezed,
    Object? countryStatus = freezed,
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
      accountStatus: freezed == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      countryStatus: freezed == countryStatus
          ? _value.countryStatus
          : countryStatus // ignore: cast_nullable_to_non_nullable
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
      dynamic errorMessage,
      String? timeout,
      dynamic smsCli,
      dynamic transactionId,
      bool? newUser,
      String? accountStatus,
      String? countryStatus});
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
    Object? newUser = freezed,
    Object? accountStatus = freezed,
    Object? countryStatus = freezed,
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
      accountStatus: freezed == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      countryStatus: freezed == countryStatus
          ? _value.countryStatus
          : countryStatus // ignore: cast_nullable_to_non_nullable
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
      this.newUser,
      this.accountStatus,
      this.countryStatus});

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
  final String? accountStatus;
  @override
  final String? countryStatus;

  @override
  String toString() {
    return 'UserData(verificationId: $verificationId, mobileNumber: $mobileNumber, responseCode: $responseCode, errorMessage: $errorMessage, timeout: $timeout, smsCli: $smsCli, transactionId: $transactionId, newUser: $newUser, accountStatus: $accountStatus, countryStatus: $countryStatus)';
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
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            const DeepCollectionEquality().equals(other.smsCli, smsCli) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId) &&
            (identical(other.newUser, newUser) || other.newUser == newUser) &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            (identical(other.countryStatus, countryStatus) ||
                other.countryStatus == countryStatus));
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
      newUser,
      accountStatus,
      countryStatus);

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
      final dynamic errorMessage,
      final String? timeout,
      final dynamic smsCli,
      final dynamic transactionId,
      final bool? newUser,
      final String? accountStatus,
      final String? countryStatus}) = _$UserDataImpl;

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
  String? get accountStatus;
  @override
  String? get countryStatus;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
