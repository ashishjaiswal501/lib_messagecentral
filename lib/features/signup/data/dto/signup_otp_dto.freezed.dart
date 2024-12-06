// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_otp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupOtpDto _$SignupOtpDtoFromJson(Map<String, dynamic> json) {
  return _SignupOtpDto.fromJson(json);
}

/// @nodoc
mixin _$SignupOtpDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupOtpDtoCopyWith<SignupOtpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupOtpDtoCopyWith<$Res> {
  factory $SignupOtpDtoCopyWith(
          SignupOtpDto value, $Res Function(SignupOtpDto) then) =
      _$SignupOtpDtoCopyWithImpl<$Res, SignupOtpDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SignupOtpDtoCopyWithImpl<$Res, $Val extends SignupOtpDto>
    implements $SignupOtpDtoCopyWith<$Res> {
  _$SignupOtpDtoCopyWithImpl(this._value, this._then);

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
              as Data?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignupOtpDtoImplCopyWith<$Res>
    implements $SignupOtpDtoCopyWith<$Res> {
  factory _$$SignupOtpDtoImplCopyWith(
          _$SignupOtpDtoImpl value, $Res Function(_$SignupOtpDtoImpl) then) =
      __$$SignupOtpDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SignupOtpDtoImplCopyWithImpl<$Res>
    extends _$SignupOtpDtoCopyWithImpl<$Res, _$SignupOtpDtoImpl>
    implements _$$SignupOtpDtoImplCopyWith<$Res> {
  __$$SignupOtpDtoImplCopyWithImpl(
      _$SignupOtpDtoImpl _value, $Res Function(_$SignupOtpDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SignupOtpDtoImpl(
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
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupOtpDtoImpl implements _SignupOtpDto {
  const _$SignupOtpDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$SignupOtpDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupOtpDtoImplFromJson(json);

  @override
  @JsonKey(name: "responseCode")
  final int? responseCode;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final Data? data;

  @override
  String toString() {
    return 'SignupOtpDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupOtpDtoImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupOtpDtoImplCopyWith<_$SignupOtpDtoImpl> get copyWith =>
      __$$SignupOtpDtoImplCopyWithImpl<_$SignupOtpDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupOtpDtoImplToJson(
      this,
    );
  }
}

abstract class _SignupOtpDto implements SignupOtpDto {
  const factory _SignupOtpDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$SignupOtpDtoImpl;

  factory _SignupOtpDto.fromJson(Map<String, dynamic> json) =
      _$SignupOtpDtoImpl.fromJson;

  @override
  @JsonKey(name: "responseCode")
  int? get responseCode;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$SignupOtpDtoImplCopyWith<_$SignupOtpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "otpVerificationId")
  String? get otpVerificationId => throw _privateConstructorUsedError;
  @JsonKey(name: "accountStatus")
  String? get accountStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "countryStatus")
  String? get countryStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "countryCode")
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "countryName")
  String? get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "otpVerificationId") String? otpVerificationId,
      @JsonKey(name: "accountStatus") String? accountStatus,
      @JsonKey(name: "countryStatus") String? countryStatus,
      @JsonKey(name: "countryCode") String? countryCode,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "countryName") String? countryName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String? email});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "otpVerificationId") String? otpVerificationId,
      @JsonKey(name: "accountStatus") String? accountStatus,
      @JsonKey(name: "countryStatus") String? countryStatus,
      @JsonKey(name: "countryCode") String? countryCode,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "countryName") String? countryName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String? email});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
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
    return _then(_$DataImpl(
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
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "otpVerificationId") this.otpVerificationId,
      @JsonKey(name: "accountStatus") this.accountStatus,
      @JsonKey(name: "countryStatus") this.countryStatus,
      @JsonKey(name: "countryCode") this.countryCode,
      @JsonKey(name: "mobileNumber") this.mobileNumber,
      @JsonKey(name: "countryName") this.countryName,
      @JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "email") this.email});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "otpVerificationId")
  final String? otpVerificationId;
  @override
  @JsonKey(name: "accountStatus")
  final String? accountStatus;
  @override
  @JsonKey(name: "countryStatus")
  final String? countryStatus;
  @override
  @JsonKey(name: "countryCode")
  final String? countryCode;
  @override
  @JsonKey(name: "mobileNumber")
  final String? mobileNumber;
  @override
  @JsonKey(name: "countryName")
  final String? countryName;
  @override
  @JsonKey(name: "fullName")
  final String? fullName;
  @override
  @JsonKey(name: "email")
  final String? email;

  @override
  String toString() {
    return 'Data(customerId: $customerId, otpVerificationId: $otpVerificationId, accountStatus: $accountStatus, countryStatus: $countryStatus, countryCode: $countryCode, mobileNumber: $mobileNumber, countryName: $countryName, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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

  @JsonKey(ignore: true)
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
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: "customerId") final String? customerId,
      @JsonKey(name: "otpVerificationId") final String? otpVerificationId,
      @JsonKey(name: "accountStatus") final String? accountStatus,
      @JsonKey(name: "countryStatus") final String? countryStatus,
      @JsonKey(name: "countryCode") final String? countryCode,
      @JsonKey(name: "mobileNumber") final String? mobileNumber,
      @JsonKey(name: "countryName") final String? countryName,
      @JsonKey(name: "fullName") final String? fullName,
      @JsonKey(name: "email") final String? email}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "otpVerificationId")
  String? get otpVerificationId;
  @override
  @JsonKey(name: "accountStatus")
  String? get accountStatus;
  @override
  @JsonKey(name: "countryStatus")
  String? get countryStatus;
  @override
  @JsonKey(name: "countryCode")
  String? get countryCode;
  @override
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber;
  @override
  @JsonKey(name: "countryName")
  String? get countryName;
  @override
  @JsonKey(name: "fullName")
  String? get fullName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
