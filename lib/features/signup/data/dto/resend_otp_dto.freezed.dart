// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_otp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResendOtpDto _$ResendOtpDtoFromJson(Map<String, dynamic> json) {
  return _ResendOtpDto.fromJson(json);
}

/// @nodoc
mixin _$ResendOtpDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResendOtpDtoCopyWith<ResendOtpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendOtpDtoCopyWith<$Res> {
  factory $ResendOtpDtoCopyWith(
          ResendOtpDto value, $Res Function(ResendOtpDto) then) =
      _$ResendOtpDtoCopyWithImpl<$Res, ResendOtpDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResendOtpDtoCopyWithImpl<$Res, $Val extends ResendOtpDto>
    implements $ResendOtpDtoCopyWith<$Res> {
  _$ResendOtpDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$ResendOtpDtoImplCopyWith<$Res>
    implements $ResendOtpDtoCopyWith<$Res> {
  factory _$$ResendOtpDtoImplCopyWith(
          _$ResendOtpDtoImpl value, $Res Function(_$ResendOtpDtoImpl) then) =
      __$$ResendOtpDtoImplCopyWithImpl<$Res>;
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
class __$$ResendOtpDtoImplCopyWithImpl<$Res>
    extends _$ResendOtpDtoCopyWithImpl<$Res, _$ResendOtpDtoImpl>
    implements _$$ResendOtpDtoImplCopyWith<$Res> {
  __$$ResendOtpDtoImplCopyWithImpl(
      _$ResendOtpDtoImpl _value, $Res Function(_$ResendOtpDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResendOtpDtoImpl(
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
class _$ResendOtpDtoImpl implements _ResendOtpDto {
  const _$ResendOtpDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$ResendOtpDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResendOtpDtoImplFromJson(json);

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
    return 'ResendOtpDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendOtpDtoImpl &&
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
  _$$ResendOtpDtoImplCopyWith<_$ResendOtpDtoImpl> get copyWith =>
      __$$ResendOtpDtoImplCopyWithImpl<_$ResendOtpDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResendOtpDtoImplToJson(
      this,
    );
  }
}

abstract class _ResendOtpDto implements ResendOtpDto {
  const factory _ResendOtpDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$ResendOtpDtoImpl;

  factory _ResendOtpDto.fromJson(Map<String, dynamic> json) =
      _$ResendOtpDtoImpl.fromJson;

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
  _$$ResendOtpDtoImplCopyWith<_$ResendOtpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "verificationId")
  String? get verificationId => throw _privateConstructorUsedError;
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "responseCode")
  String? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "errorMessage")
  String? get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(name: "timeout")
  String? get timeout => throw _privateConstructorUsedError;
  @JsonKey(name: "smsCLI")
  dynamic get smsCli => throw _privateConstructorUsedError;
  @JsonKey(name: "transactionId")
  dynamic get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: "newUser")
  bool? get newUser => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "verificationId") String? verificationId,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "responseCode") String? responseCode,
      @JsonKey(name: "errorMessage") String? errorMessage,
      @JsonKey(name: "timeout") String? timeout,
      @JsonKey(name: "smsCLI") dynamic smsCli,
      @JsonKey(name: "transactionId") dynamic transactionId,
      @JsonKey(name: "newUser") bool? newUser});
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
    Object? responseCode = freezed,
    Object? errorMessage = freezed,
    Object? timeout = freezed,
    Object? smsCli = freezed,
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
      {@JsonKey(name: "verificationId") String? verificationId,
      @JsonKey(name: "mobileNumber") String? mobileNumber,
      @JsonKey(name: "responseCode") String? responseCode,
      @JsonKey(name: "errorMessage") String? errorMessage,
      @JsonKey(name: "timeout") String? timeout,
      @JsonKey(name: "smsCLI") dynamic smsCli,
      @JsonKey(name: "transactionId") dynamic transactionId,
      @JsonKey(name: "newUser") bool? newUser});
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
    Object? responseCode = freezed,
    Object? errorMessage = freezed,
    Object? timeout = freezed,
    Object? smsCli = freezed,
    Object? transactionId = freezed,
    Object? newUser = freezed,
  }) {
    return _then(_$DataImpl(
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
              as dynamic,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "verificationId") this.verificationId,
      @JsonKey(name: "mobileNumber") this.mobileNumber,
      @JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "errorMessage") this.errorMessage,
      @JsonKey(name: "timeout") this.timeout,
      @JsonKey(name: "smsCLI") this.smsCli,
      @JsonKey(name: "transactionId") this.transactionId,
      @JsonKey(name: "newUser") this.newUser});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "verificationId")
  final String? verificationId;
  @override
  @JsonKey(name: "mobileNumber")
  final String? mobileNumber;
  @override
  @JsonKey(name: "responseCode")
  final String? responseCode;
  @override
  @JsonKey(name: "errorMessage")
  final String? errorMessage;
  @override
  @JsonKey(name: "timeout")
  final String? timeout;
  @override
  @JsonKey(name: "smsCLI")
  final dynamic smsCli;
  @override
  @JsonKey(name: "transactionId")
  final dynamic transactionId;
  @override
  @JsonKey(name: "newUser")
  final bool? newUser;

  @override
  String toString() {
    return 'Data(verificationId: $verificationId, mobileNumber: $mobileNumber, responseCode: $responseCode, errorMessage: $errorMessage, timeout: $timeout, smsCli: $smsCli, transactionId: $transactionId, newUser: $newUser)';
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
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            const DeepCollectionEquality().equals(other.smsCli, smsCli) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId) &&
            (identical(other.newUser, newUser) || other.newUser == newUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      verificationId,
      mobileNumber,
      responseCode,
      errorMessage,
      timeout,
      const DeepCollectionEquality().hash(smsCli),
      const DeepCollectionEquality().hash(transactionId),
      newUser);

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
      {@JsonKey(name: "verificationId") final String? verificationId,
      @JsonKey(name: "mobileNumber") final String? mobileNumber,
      @JsonKey(name: "responseCode") final String? responseCode,
      @JsonKey(name: "errorMessage") final String? errorMessage,
      @JsonKey(name: "timeout") final String? timeout,
      @JsonKey(name: "smsCLI") final dynamic smsCli,
      @JsonKey(name: "transactionId") final dynamic transactionId,
      @JsonKey(name: "newUser") final bool? newUser}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "verificationId")
  String? get verificationId;
  @override
  @JsonKey(name: "mobileNumber")
  String? get mobileNumber;
  @override
  @JsonKey(name: "responseCode")
  String? get responseCode;
  @override
  @JsonKey(name: "errorMessage")
  String? get errorMessage;
  @override
  @JsonKey(name: "timeout")
  String? get timeout;
  @override
  @JsonKey(name: "smsCLI")
  dynamic get smsCli;
  @override
  @JsonKey(name: "transactionId")
  dynamic get transactionId;
  @override
  @JsonKey(name: "newUser")
  bool? get newUser;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
