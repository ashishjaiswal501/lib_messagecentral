// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stepone_register_save_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SteponeRegisterSaveDto _$SteponeRegisterSaveDtoFromJson(
    Map<String, dynamic> json) {
  return _SteponeRegisterSaveDto.fromJson(json);
}

/// @nodoc
mixin _$SteponeRegisterSaveDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SteponeRegisterSaveDtoCopyWith<SteponeRegisterSaveDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SteponeRegisterSaveDtoCopyWith<$Res> {
  factory $SteponeRegisterSaveDtoCopyWith(SteponeRegisterSaveDto value,
          $Res Function(SteponeRegisterSaveDto) then) =
      _$SteponeRegisterSaveDtoCopyWithImpl<$Res, SteponeRegisterSaveDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SteponeRegisterSaveDtoCopyWithImpl<$Res,
        $Val extends SteponeRegisterSaveDto>
    implements $SteponeRegisterSaveDtoCopyWith<$Res> {
  _$SteponeRegisterSaveDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$SteponeRegisterSaveDtoImplCopyWith<$Res>
    implements $SteponeRegisterSaveDtoCopyWith<$Res> {
  factory _$$SteponeRegisterSaveDtoImplCopyWith(
          _$SteponeRegisterSaveDtoImpl value,
          $Res Function(_$SteponeRegisterSaveDtoImpl) then) =
      __$$SteponeRegisterSaveDtoImplCopyWithImpl<$Res>;
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
class __$$SteponeRegisterSaveDtoImplCopyWithImpl<$Res>
    extends _$SteponeRegisterSaveDtoCopyWithImpl<$Res,
        _$SteponeRegisterSaveDtoImpl>
    implements _$$SteponeRegisterSaveDtoImplCopyWith<$Res> {
  __$$SteponeRegisterSaveDtoImplCopyWithImpl(
      _$SteponeRegisterSaveDtoImpl _value,
      $Res Function(_$SteponeRegisterSaveDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SteponeRegisterSaveDtoImpl(
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
class _$SteponeRegisterSaveDtoImpl implements _SteponeRegisterSaveDto {
  const _$SteponeRegisterSaveDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$SteponeRegisterSaveDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SteponeRegisterSaveDtoImplFromJson(json);

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
    return 'SteponeRegisterSaveDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SteponeRegisterSaveDtoImpl &&
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
  _$$SteponeRegisterSaveDtoImplCopyWith<_$SteponeRegisterSaveDtoImpl>
      get copyWith => __$$SteponeRegisterSaveDtoImplCopyWithImpl<
          _$SteponeRegisterSaveDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SteponeRegisterSaveDtoImplToJson(
      this,
    );
  }
}

abstract class _SteponeRegisterSaveDto implements SteponeRegisterSaveDto {
  const factory _SteponeRegisterSaveDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$SteponeRegisterSaveDtoImpl;

  factory _SteponeRegisterSaveDto.fromJson(Map<String, dynamic> json) =
      _$SteponeRegisterSaveDtoImpl.fromJson;

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
  _$$SteponeRegisterSaveDtoImplCopyWith<_$SteponeRegisterSaveDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "userName")
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: "companyName")
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: "companyWebsite")
  String? get companyWebsite => throw _privateConstructorUsedError;
  @JsonKey(name: "workingEmail")
  String? get workingEmail => throw _privateConstructorUsedError;
  @JsonKey(name: "contactNumber")
  String? get contactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "countryToSendSMS")
  String? get countryToSendSms => throw _privateConstructorUsedError;
  @JsonKey(name: "hasIndianRegisteredSenderID")
  bool? get hasIndianRegisteredSenderId => throw _privateConstructorUsedError;
  @JsonKey(name: "usageDescription")
  String? get usageDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "userAccountType")
  String? get userAccountType => throw _privateConstructorUsedError;
  @JsonKey(name: "userAddress")
  String? get userAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "userCountry")
  String? get userCountry => throw _privateConstructorUsedError;
  @JsonKey(name: "userCity")
  String? get userCity => throw _privateConstructorUsedError;
  @JsonKey(name: "userState")
  String? get userState => throw _privateConstructorUsedError;
  @JsonKey(name: "userZipCode")
  int? get userZipCode => throw _privateConstructorUsedError;
  @JsonKey(name: "resellerType")
  bool? get resellerType => throw _privateConstructorUsedError;
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "userName") String? userName,
      @JsonKey(name: "companyName") String? companyName,
      @JsonKey(name: "companyWebsite") String? companyWebsite,
      @JsonKey(name: "workingEmail") String? workingEmail,
      @JsonKey(name: "contactNumber") String? contactNumber,
      @JsonKey(name: "countryToSendSMS") String? countryToSendSms,
      @JsonKey(name: "hasIndianRegisteredSenderID")
      bool? hasIndianRegisteredSenderId,
      @JsonKey(name: "usageDescription") String? usageDescription,
      @JsonKey(name: "userAccountType") String? userAccountType,
      @JsonKey(name: "userAddress") String? userAddress,
      @JsonKey(name: "userCountry") String? userCountry,
      @JsonKey(name: "userCity") String? userCity,
      @JsonKey(name: "userState") String? userState,
      @JsonKey(name: "userZipCode") int? userZipCode,
      @JsonKey(name: "resellerType") bool? resellerType,
      @JsonKey(name: "customerId") String? customerId});
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
    Object? userName = freezed,
    Object? companyName = freezed,
    Object? companyWebsite = freezed,
    Object? workingEmail = freezed,
    Object? contactNumber = freezed,
    Object? countryToSendSms = freezed,
    Object? hasIndianRegisteredSenderId = freezed,
    Object? usageDescription = freezed,
    Object? userAccountType = freezed,
    Object? userAddress = freezed,
    Object? userCountry = freezed,
    Object? userCity = freezed,
    Object? userState = freezed,
    Object? userZipCode = freezed,
    Object? resellerType = freezed,
    Object? customerId = freezed,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyWebsite: freezed == companyWebsite
          ? _value.companyWebsite
          : companyWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      workingEmail: freezed == workingEmail
          ? _value.workingEmail
          : workingEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryToSendSms: freezed == countryToSendSms
          ? _value.countryToSendSms
          : countryToSendSms // ignore: cast_nullable_to_non_nullable
              as String?,
      hasIndianRegisteredSenderId: freezed == hasIndianRegisteredSenderId
          ? _value.hasIndianRegisteredSenderId
          : hasIndianRegisteredSenderId // ignore: cast_nullable_to_non_nullable
              as bool?,
      usageDescription: freezed == usageDescription
          ? _value.usageDescription
          : usageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      userAccountType: freezed == userAccountType
          ? _value.userAccountType
          : userAccountType // ignore: cast_nullable_to_non_nullable
              as String?,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userCountry: freezed == userCountry
          ? _value.userCountry
          : userCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      userCity: freezed == userCity
          ? _value.userCity
          : userCity // ignore: cast_nullable_to_non_nullable
              as String?,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as String?,
      userZipCode: freezed == userZipCode
          ? _value.userZipCode
          : userZipCode // ignore: cast_nullable_to_non_nullable
              as int?,
      resellerType: freezed == resellerType
          ? _value.resellerType
          : resellerType // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: "userName") String? userName,
      @JsonKey(name: "companyName") String? companyName,
      @JsonKey(name: "companyWebsite") String? companyWebsite,
      @JsonKey(name: "workingEmail") String? workingEmail,
      @JsonKey(name: "contactNumber") String? contactNumber,
      @JsonKey(name: "countryToSendSMS") String? countryToSendSms,
      @JsonKey(name: "hasIndianRegisteredSenderID")
      bool? hasIndianRegisteredSenderId,
      @JsonKey(name: "usageDescription") String? usageDescription,
      @JsonKey(name: "userAccountType") String? userAccountType,
      @JsonKey(name: "userAddress") String? userAddress,
      @JsonKey(name: "userCountry") String? userCountry,
      @JsonKey(name: "userCity") String? userCity,
      @JsonKey(name: "userState") String? userState,
      @JsonKey(name: "userZipCode") int? userZipCode,
      @JsonKey(name: "resellerType") bool? resellerType,
      @JsonKey(name: "customerId") String? customerId});
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
    Object? userName = freezed,
    Object? companyName = freezed,
    Object? companyWebsite = freezed,
    Object? workingEmail = freezed,
    Object? contactNumber = freezed,
    Object? countryToSendSms = freezed,
    Object? hasIndianRegisteredSenderId = freezed,
    Object? usageDescription = freezed,
    Object? userAccountType = freezed,
    Object? userAddress = freezed,
    Object? userCountry = freezed,
    Object? userCity = freezed,
    Object? userState = freezed,
    Object? userZipCode = freezed,
    Object? resellerType = freezed,
    Object? customerId = freezed,
  }) {
    return _then(_$DataImpl(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyWebsite: freezed == companyWebsite
          ? _value.companyWebsite
          : companyWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      workingEmail: freezed == workingEmail
          ? _value.workingEmail
          : workingEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryToSendSms: freezed == countryToSendSms
          ? _value.countryToSendSms
          : countryToSendSms // ignore: cast_nullable_to_non_nullable
              as String?,
      hasIndianRegisteredSenderId: freezed == hasIndianRegisteredSenderId
          ? _value.hasIndianRegisteredSenderId
          : hasIndianRegisteredSenderId // ignore: cast_nullable_to_non_nullable
              as bool?,
      usageDescription: freezed == usageDescription
          ? _value.usageDescription
          : usageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      userAccountType: freezed == userAccountType
          ? _value.userAccountType
          : userAccountType // ignore: cast_nullable_to_non_nullable
              as String?,
      userAddress: freezed == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userCountry: freezed == userCountry
          ? _value.userCountry
          : userCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      userCity: freezed == userCity
          ? _value.userCity
          : userCity // ignore: cast_nullable_to_non_nullable
              as String?,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as String?,
      userZipCode: freezed == userZipCode
          ? _value.userZipCode
          : userZipCode // ignore: cast_nullable_to_non_nullable
              as int?,
      resellerType: freezed == resellerType
          ? _value.resellerType
          : resellerType // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "userName") this.userName,
      @JsonKey(name: "companyName") this.companyName,
      @JsonKey(name: "companyWebsite") this.companyWebsite,
      @JsonKey(name: "workingEmail") this.workingEmail,
      @JsonKey(name: "contactNumber") this.contactNumber,
      @JsonKey(name: "countryToSendSMS") this.countryToSendSms,
      @JsonKey(name: "hasIndianRegisteredSenderID")
      this.hasIndianRegisteredSenderId,
      @JsonKey(name: "usageDescription") this.usageDescription,
      @JsonKey(name: "userAccountType") this.userAccountType,
      @JsonKey(name: "userAddress") this.userAddress,
      @JsonKey(name: "userCountry") this.userCountry,
      @JsonKey(name: "userCity") this.userCity,
      @JsonKey(name: "userState") this.userState,
      @JsonKey(name: "userZipCode") this.userZipCode,
      @JsonKey(name: "resellerType") this.resellerType,
      @JsonKey(name: "customerId") this.customerId});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "userName")
  final String? userName;
  @override
  @JsonKey(name: "companyName")
  final String? companyName;
  @override
  @JsonKey(name: "companyWebsite")
  final String? companyWebsite;
  @override
  @JsonKey(name: "workingEmail")
  final String? workingEmail;
  @override
  @JsonKey(name: "contactNumber")
  final String? contactNumber;
  @override
  @JsonKey(name: "countryToSendSMS")
  final String? countryToSendSms;
  @override
  @JsonKey(name: "hasIndianRegisteredSenderID")
  final bool? hasIndianRegisteredSenderId;
  @override
  @JsonKey(name: "usageDescription")
  final String? usageDescription;
  @override
  @JsonKey(name: "userAccountType")
  final String? userAccountType;
  @override
  @JsonKey(name: "userAddress")
  final String? userAddress;
  @override
  @JsonKey(name: "userCountry")
  final String? userCountry;
  @override
  @JsonKey(name: "userCity")
  final String? userCity;
  @override
  @JsonKey(name: "userState")
  final String? userState;
  @override
  @JsonKey(name: "userZipCode")
  final int? userZipCode;
  @override
  @JsonKey(name: "resellerType")
  final bool? resellerType;
  @override
  @JsonKey(name: "customerId")
  final String? customerId;

  @override
  String toString() {
    return 'Data(userName: $userName, companyName: $companyName, companyWebsite: $companyWebsite, workingEmail: $workingEmail, contactNumber: $contactNumber, countryToSendSms: $countryToSendSms, hasIndianRegisteredSenderId: $hasIndianRegisteredSenderId, usageDescription: $usageDescription, userAccountType: $userAccountType, userAddress: $userAddress, userCountry: $userCountry, userCity: $userCity, userState: $userState, userZipCode: $userZipCode, resellerType: $resellerType, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyWebsite, companyWebsite) ||
                other.companyWebsite == companyWebsite) &&
            (identical(other.workingEmail, workingEmail) ||
                other.workingEmail == workingEmail) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.countryToSendSms, countryToSendSms) ||
                other.countryToSendSms == countryToSendSms) &&
            (identical(other.hasIndianRegisteredSenderId,
                    hasIndianRegisteredSenderId) ||
                other.hasIndianRegisteredSenderId ==
                    hasIndianRegisteredSenderId) &&
            (identical(other.usageDescription, usageDescription) ||
                other.usageDescription == usageDescription) &&
            (identical(other.userAccountType, userAccountType) ||
                other.userAccountType == userAccountType) &&
            (identical(other.userAddress, userAddress) ||
                other.userAddress == userAddress) &&
            (identical(other.userCountry, userCountry) ||
                other.userCountry == userCountry) &&
            (identical(other.userCity, userCity) ||
                other.userCity == userCity) &&
            (identical(other.userState, userState) ||
                other.userState == userState) &&
            (identical(other.userZipCode, userZipCode) ||
                other.userZipCode == userZipCode) &&
            (identical(other.resellerType, resellerType) ||
                other.resellerType == resellerType) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      companyName,
      companyWebsite,
      workingEmail,
      contactNumber,
      countryToSendSms,
      hasIndianRegisteredSenderId,
      usageDescription,
      userAccountType,
      userAddress,
      userCountry,
      userCity,
      userState,
      userZipCode,
      resellerType,
      customerId);

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
      {@JsonKey(name: "userName") final String? userName,
      @JsonKey(name: "companyName") final String? companyName,
      @JsonKey(name: "companyWebsite") final String? companyWebsite,
      @JsonKey(name: "workingEmail") final String? workingEmail,
      @JsonKey(name: "contactNumber") final String? contactNumber,
      @JsonKey(name: "countryToSendSMS") final String? countryToSendSms,
      @JsonKey(name: "hasIndianRegisteredSenderID")
      final bool? hasIndianRegisteredSenderId,
      @JsonKey(name: "usageDescription") final String? usageDescription,
      @JsonKey(name: "userAccountType") final String? userAccountType,
      @JsonKey(name: "userAddress") final String? userAddress,
      @JsonKey(name: "userCountry") final String? userCountry,
      @JsonKey(name: "userCity") final String? userCity,
      @JsonKey(name: "userState") final String? userState,
      @JsonKey(name: "userZipCode") final int? userZipCode,
      @JsonKey(name: "resellerType") final bool? resellerType,
      @JsonKey(name: "customerId") final String? customerId}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "userName")
  String? get userName;
  @override
  @JsonKey(name: "companyName")
  String? get companyName;
  @override
  @JsonKey(name: "companyWebsite")
  String? get companyWebsite;
  @override
  @JsonKey(name: "workingEmail")
  String? get workingEmail;
  @override
  @JsonKey(name: "contactNumber")
  String? get contactNumber;
  @override
  @JsonKey(name: "countryToSendSMS")
  String? get countryToSendSms;
  @override
  @JsonKey(name: "hasIndianRegisteredSenderID")
  bool? get hasIndianRegisteredSenderId;
  @override
  @JsonKey(name: "usageDescription")
  String? get usageDescription;
  @override
  @JsonKey(name: "userAccountType")
  String? get userAccountType;
  @override
  @JsonKey(name: "userAddress")
  String? get userAddress;
  @override
  @JsonKey(name: "userCountry")
  String? get userCountry;
  @override
  @JsonKey(name: "userCity")
  String? get userCity;
  @override
  @JsonKey(name: "userState")
  String? get userState;
  @override
  @JsonKey(name: "userZipCode")
  int? get userZipCode;
  @override
  @JsonKey(name: "resellerType")
  bool? get resellerType;
  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
