// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_a_user_otp_verification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyAUserOtpVerificationDto _$VerifyAUserOtpVerificationDtoFromJson(
    Map<String, dynamic> json) {
  return _VerifyAUserOtpVerificationDto.fromJson(json);
}

/// @nodoc
mixin _$VerifyAUserOtpVerificationDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyAUserOtpVerificationDtoCopyWith<VerifyAUserOtpVerificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyAUserOtpVerificationDtoCopyWith<$Res> {
  factory $VerifyAUserOtpVerificationDtoCopyWith(
          VerifyAUserOtpVerificationDto value,
          $Res Function(VerifyAUserOtpVerificationDto) then) =
      _$VerifyAUserOtpVerificationDtoCopyWithImpl<$Res,
          VerifyAUserOtpVerificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$VerifyAUserOtpVerificationDtoCopyWithImpl<$Res,
        $Val extends VerifyAUserOtpVerificationDto>
    implements $VerifyAUserOtpVerificationDtoCopyWith<$Res> {
  _$VerifyAUserOtpVerificationDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$VerifyAUserOtpVerificationDtoImplCopyWith<$Res>
    implements $VerifyAUserOtpVerificationDtoCopyWith<$Res> {
  factory _$$VerifyAUserOtpVerificationDtoImplCopyWith(
          _$VerifyAUserOtpVerificationDtoImpl value,
          $Res Function(_$VerifyAUserOtpVerificationDtoImpl) then) =
      __$$VerifyAUserOtpVerificationDtoImplCopyWithImpl<$Res>;
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
class __$$VerifyAUserOtpVerificationDtoImplCopyWithImpl<$Res>
    extends _$VerifyAUserOtpVerificationDtoCopyWithImpl<$Res,
        _$VerifyAUserOtpVerificationDtoImpl>
    implements _$$VerifyAUserOtpVerificationDtoImplCopyWith<$Res> {
  __$$VerifyAUserOtpVerificationDtoImplCopyWithImpl(
      _$VerifyAUserOtpVerificationDtoImpl _value,
      $Res Function(_$VerifyAUserOtpVerificationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$VerifyAUserOtpVerificationDtoImpl(
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
class _$VerifyAUserOtpVerificationDtoImpl
    implements _VerifyAUserOtpVerificationDto {
  const _$VerifyAUserOtpVerificationDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$VerifyAUserOtpVerificationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyAUserOtpVerificationDtoImplFromJson(json);

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
    return 'VerifyAUserOtpVerificationDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyAUserOtpVerificationDtoImpl &&
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
  _$$VerifyAUserOtpVerificationDtoImplCopyWith<
          _$VerifyAUserOtpVerificationDtoImpl>
      get copyWith => __$$VerifyAUserOtpVerificationDtoImplCopyWithImpl<
          _$VerifyAUserOtpVerificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyAUserOtpVerificationDtoImplToJson(
      this,
    );
  }
}

abstract class _VerifyAUserOtpVerificationDto
    implements VerifyAUserOtpVerificationDto {
  const factory _VerifyAUserOtpVerificationDto(
          {@JsonKey(name: "responseCode") final int? responseCode,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final Data? data}) =
      _$VerifyAUserOtpVerificationDtoImpl;

  factory _VerifyAUserOtpVerificationDto.fromJson(Map<String, dynamic> json) =
      _$VerifyAUserOtpVerificationDtoImpl.fromJson;

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
  _$$VerifyAUserOtpVerificationDtoImplCopyWith<
          _$VerifyAUserOtpVerificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "verificationId")
  int? get verificationId => throw _privateConstructorUsedError;
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "verificationStatus")
  String? get verificationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "responseCode")
  String? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "errorMessage")
  dynamic get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "transactionId")
  dynamic get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: "authToken")
  dynamic get authToken => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "verificationId") int? verificationId,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "verificationStatus") String? verificationStatus,
      @JsonKey(name: "responseCode") String? responseCode,
      @JsonKey(name: "errorMessage") dynamic errorMessage,
      @JsonKey(name: "transactionId") dynamic transactionId,
      @JsonKey(name: "authToken") dynamic authToken});
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
              as dynamic,
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
      {@JsonKey(name: "verificationId") int? verificationId,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "verificationStatus") String? verificationStatus,
      @JsonKey(name: "responseCode") String? responseCode,
      @JsonKey(name: "errorMessage") dynamic errorMessage,
      @JsonKey(name: "transactionId") dynamic transactionId,
      @JsonKey(name: "authToken") dynamic authToken});
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
    Object? verificationId = freezed,
    Object? mobileNumber = freezed,
    Object? verificationStatus = freezed,
    Object? responseCode = freezed,
    Object? errorMessage = freezed,
    Object? transactionId = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_$DataImpl(
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
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "verificationId") this.verificationId,
      @JsonKey(name: "mobileNumber") this.mobileNumber,
      @JsonKey(name: "verificationStatus") this.verificationStatus,
      @JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "errorMessage") this.errorMessage,
      @JsonKey(name: "transactionId") this.transactionId,
      @JsonKey(name: "authToken") this.authToken});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "verificationId")
  final int? verificationId;
  @override
  @JsonKey(name: "mobileNumber")
  final String? mobileNumber;
  @override
  @JsonKey(name: "verificationStatus")
  final String? verificationStatus;
  @override
  @JsonKey(name: "responseCode")
  final String? responseCode;
  @override
  @JsonKey(name: "errorMessage")
  final dynamic errorMessage;
  @override
  @JsonKey(name: "transactionId")
  final dynamic transactionId;
  @override
  @JsonKey(name: "authToken")
  final dynamic authToken;

  @override
  String toString() {
    return 'Data(verificationId: $verificationId, mobileNumber: $mobileNumber, verificationStatus: $verificationStatus, responseCode: $responseCode, errorMessage: $errorMessage, transactionId: $transactionId, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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
            const DeepCollectionEquality().equals(other.authToken, authToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      verificationId,
      mobileNumber,
      verificationStatus,
      responseCode,
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(transactionId),
      const DeepCollectionEquality().hash(authToken));

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
      {@JsonKey(name: "verificationId") final int? verificationId,
      @JsonKey(name: "mobileNumber") final String? mobileNumber,
      @JsonKey(name: "verificationStatus") final String? verificationStatus,
      @JsonKey(name: "responseCode") final String? responseCode,
      @JsonKey(name: "errorMessage") final dynamic errorMessage,
      @JsonKey(name: "transactionId") final dynamic transactionId,
      @JsonKey(name: "authToken") final dynamic authToken}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "verificationId")
  int? get verificationId;
  @override
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber;
  @override
  @JsonKey(name: "verificationStatus")
  String? get verificationStatus;
  @override
  @JsonKey(name: "responseCode")
  String? get responseCode;
  @override
  @JsonKey(name: "errorMessage")
  dynamic get errorMessage;
  @override
  @JsonKey(name: "transactionId")
  dynamic get transactionId;
  @override
  @JsonKey(name: "authToken")
  dynamic get authToken;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
