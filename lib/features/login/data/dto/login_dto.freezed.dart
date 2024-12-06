// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) {
  return _LoginDto.fromJson(json);
}

/// @nodoc
mixin _$LoginDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDtoCopyWith<LoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDtoCopyWith<$Res> {
  factory $LoginDtoCopyWith(LoginDto value, $Res Function(LoginDto) then) =
      _$LoginDtoCopyWithImpl<$Res, LoginDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoginDtoCopyWithImpl<$Res, $Val extends LoginDto>
    implements $LoginDtoCopyWith<$Res> {
  _$LoginDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$LoginDtoImplCopyWith<$Res>
    implements $LoginDtoCopyWith<$Res> {
  factory _$$LoginDtoImplCopyWith(
          _$LoginDtoImpl value, $Res Function(_$LoginDtoImpl) then) =
      __$$LoginDtoImplCopyWithImpl<$Res>;
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
class __$$LoginDtoImplCopyWithImpl<$Res>
    extends _$LoginDtoCopyWithImpl<$Res, _$LoginDtoImpl>
    implements _$$LoginDtoImplCopyWith<$Res> {
  __$$LoginDtoImplCopyWithImpl(
      _$LoginDtoImpl _value, $Res Function(_$LoginDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LoginDtoImpl(
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
class _$LoginDtoImpl implements _LoginDto {
  const _$LoginDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$LoginDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDtoImplFromJson(json);

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
    return 'LoginDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDtoImpl &&
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
  _$$LoginDtoImplCopyWith<_$LoginDtoImpl> get copyWith =>
      __$$LoginDtoImplCopyWithImpl<_$LoginDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDtoImplToJson(
      this,
    );
  }
}

abstract class _LoginDto implements LoginDto {
  const factory _LoginDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$LoginDtoImpl;

  factory _LoginDto.fromJson(Map<String, dynamic> json) =
      _$LoginDtoImpl.fromJson;

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
  _$$LoginDtoImplCopyWith<_$LoginDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "authToken")
  String? get authToken => throw _privateConstructorUsedError;
  @JsonKey(name: "tempToken")
  String? get tempToken => throw _privateConstructorUsedError;
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "accountStatus")
  String? get accountStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "countryStatus")
  String? get countryStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "countryCode")
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: "phoneNo")
  String? get phoneNo => throw _privateConstructorUsedError;
  @JsonKey(name: "mobileNumberAvailable")
  String? get mobileNumberAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: "firstName")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "otpVerification")
  bool? get otpVerification => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "authToken") String? authToken,
      @JsonKey(name: "tempToken") String? tempToken,
      @JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "accountStatus") String? accountStatus,
      @JsonKey(name: "countryStatus") String? countryStatus,
      @JsonKey(name: "countryCode") String? countryCode,
      @JsonKey(name: "phoneNo") String? phoneNo,
      @JsonKey(name: "mobileNumberAvailable") String? mobileNumberAvailable,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "otpVerification") bool? otpVerification});
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "authToken") String? authToken,
      @JsonKey(name: "tempToken") String? tempToken,
      @JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "accountStatus") String? accountStatus,
      @JsonKey(name: "countryStatus") String? countryStatus,
      @JsonKey(name: "countryCode") String? countryCode,
      @JsonKey(name: "phoneNo") String? phoneNo,
      @JsonKey(name: "mobileNumberAvailable") String? mobileNumberAvailable,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "otpVerification") bool? otpVerification});
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
    return _then(_$DataImpl(
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
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "authToken") this.authToken,
      @JsonKey(name: "tempToken") this.tempToken,
      @JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "accountStatus") this.accountStatus,
      @JsonKey(name: "countryStatus") this.countryStatus,
      @JsonKey(name: "countryCode") this.countryCode,
      @JsonKey(name: "phoneNo") this.phoneNo,
      @JsonKey(name: "mobileNumberAvailable") this.mobileNumberAvailable,
      @JsonKey(name: "firstName") this.firstName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "otpVerification") this.otpVerification});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "authToken")
  final String? authToken;
  @override
  @JsonKey(name: "tempToken")
  final String? tempToken;
  @override
  @JsonKey(name: "customerId")
  final String? customerId;
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
  @JsonKey(name: "phoneNo")
  final String? phoneNo;
  @override
  @JsonKey(name: "mobileNumberAvailable")
  final String? mobileNumberAvailable;
  @override
  @JsonKey(name: "firstName")
  final String? firstName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "otpVerification")
  final bool? otpVerification;

  @override
  String toString() {
    return 'Data(authToken: $authToken, tempToken: $tempToken, customerId: $customerId, accountStatus: $accountStatus, countryStatus: $countryStatus, countryCode: $countryCode, phoneNo: $phoneNo, mobileNumberAvailable: $mobileNumberAvailable, firstName: $firstName, email: $email, otpVerification: $otpVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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

  @JsonKey(ignore: true)
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
          {@JsonKey(name: "authToken") final String? authToken,
          @JsonKey(name: "tempToken") final String? tempToken,
          @JsonKey(name: "customerId") final String? customerId,
          @JsonKey(name: "accountStatus") final String? accountStatus,
          @JsonKey(name: "countryStatus") final String? countryStatus,
          @JsonKey(name: "countryCode") final String? countryCode,
          @JsonKey(name: "phoneNo") final String? phoneNo,
          @JsonKey(name: "mobileNumberAvailable")
          final String? mobileNumberAvailable,
          @JsonKey(name: "firstName") final String? firstName,
          @JsonKey(name: "email") final String? email,
          @JsonKey(name: "otpVerification") final bool? otpVerification}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "authToken")
  String? get authToken;
  @override
  @JsonKey(name: "tempToken")
  String? get tempToken;
  @override
  @JsonKey(name: "customerId")
  String? get customerId;
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
  @JsonKey(name: "phoneNo")
  String? get phoneNo;
  @override
  @JsonKey(name: "mobileNumberAvailable")
  String? get mobileNumberAvailable;
  @override
  @JsonKey(name: "firstName")
  String? get firstName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "otpVerification")
  bool? get otpVerification;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
