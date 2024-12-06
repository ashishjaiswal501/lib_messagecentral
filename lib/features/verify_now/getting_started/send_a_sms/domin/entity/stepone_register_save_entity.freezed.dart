// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stepone_register_save_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SteponeRegisterSaveEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  RegisterData? get registerData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SteponeRegisterSaveEntityCopyWith<SteponeRegisterSaveEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SteponeRegisterSaveEntityCopyWith<$Res> {
  factory $SteponeRegisterSaveEntityCopyWith(SteponeRegisterSaveEntity value,
          $Res Function(SteponeRegisterSaveEntity) then) =
      _$SteponeRegisterSaveEntityCopyWithImpl<$Res, SteponeRegisterSaveEntity>;
  @useResult
  $Res call({int? responseCode, String? message, RegisterData? registerData});

  $RegisterDataCopyWith<$Res>? get registerData;
}

/// @nodoc
class _$SteponeRegisterSaveEntityCopyWithImpl<$Res,
        $Val extends SteponeRegisterSaveEntity>
    implements $SteponeRegisterSaveEntityCopyWith<$Res> {
  _$SteponeRegisterSaveEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? registerData = freezed,
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
      registerData: freezed == registerData
          ? _value.registerData
          : registerData // ignore: cast_nullable_to_non_nullable
              as RegisterData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterDataCopyWith<$Res>? get registerData {
    if (_value.registerData == null) {
      return null;
    }

    return $RegisterDataCopyWith<$Res>(_value.registerData!, (value) {
      return _then(_value.copyWith(registerData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SteponeRegisterSaveEntityImplCopyWith<$Res>
    implements $SteponeRegisterSaveEntityCopyWith<$Res> {
  factory _$$SteponeRegisterSaveEntityImplCopyWith(
          _$SteponeRegisterSaveEntityImpl value,
          $Res Function(_$SteponeRegisterSaveEntityImpl) then) =
      __$$SteponeRegisterSaveEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, RegisterData? registerData});

  @override
  $RegisterDataCopyWith<$Res>? get registerData;
}

/// @nodoc
class __$$SteponeRegisterSaveEntityImplCopyWithImpl<$Res>
    extends _$SteponeRegisterSaveEntityCopyWithImpl<$Res,
        _$SteponeRegisterSaveEntityImpl>
    implements _$$SteponeRegisterSaveEntityImplCopyWith<$Res> {
  __$$SteponeRegisterSaveEntityImplCopyWithImpl(
      _$SteponeRegisterSaveEntityImpl _value,
      $Res Function(_$SteponeRegisterSaveEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? registerData = freezed,
  }) {
    return _then(_$SteponeRegisterSaveEntityImpl(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      registerData: freezed == registerData
          ? _value.registerData
          : registerData // ignore: cast_nullable_to_non_nullable
              as RegisterData?,
    ));
  }
}

/// @nodoc

class _$SteponeRegisterSaveEntityImpl implements _SteponeRegisterSaveEntity {
  const _$SteponeRegisterSaveEntityImpl(
      {this.responseCode, this.message, this.registerData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final RegisterData? registerData;

  @override
  String toString() {
    return 'SteponeRegisterSaveEntity(responseCode: $responseCode, message: $message, registerData: $registerData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SteponeRegisterSaveEntityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.registerData, registerData) ||
                other.registerData == registerData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, responseCode, message, registerData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SteponeRegisterSaveEntityImplCopyWith<_$SteponeRegisterSaveEntityImpl>
      get copyWith => __$$SteponeRegisterSaveEntityImplCopyWithImpl<
          _$SteponeRegisterSaveEntityImpl>(this, _$identity);
}

abstract class _SteponeRegisterSaveEntity implements SteponeRegisterSaveEntity {
  const factory _SteponeRegisterSaveEntity(
      {final int? responseCode,
      final String? message,
      final RegisterData? registerData}) = _$SteponeRegisterSaveEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  RegisterData? get registerData;
  @override
  @JsonKey(ignore: true)
  _$$SteponeRegisterSaveEntityImplCopyWith<_$SteponeRegisterSaveEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterData {
  String? get userName => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  String? get companyWebsite => throw _privateConstructorUsedError;
  String? get workingEmail => throw _privateConstructorUsedError;
  String? get contactNumber => throw _privateConstructorUsedError;
  String? get countryToSendSms => throw _privateConstructorUsedError;
  bool? get hasIndianRegisteredSenderId => throw _privateConstructorUsedError;
  String? get usageDescription => throw _privateConstructorUsedError;
  String? get userAccountType => throw _privateConstructorUsedError;
  String? get userAddress => throw _privateConstructorUsedError;
  String? get userCountry => throw _privateConstructorUsedError;
  String? get userCity => throw _privateConstructorUsedError;
  String? get userState => throw _privateConstructorUsedError;
  int? get userZipCode => throw _privateConstructorUsedError;
  bool? get resellerType => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterDataCopyWith<RegisterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDataCopyWith<$Res> {
  factory $RegisterDataCopyWith(
          RegisterData value, $Res Function(RegisterData) then) =
      _$RegisterDataCopyWithImpl<$Res, RegisterData>;
  @useResult
  $Res call(
      {String? userName,
      String? companyName,
      String? companyWebsite,
      String? workingEmail,
      String? contactNumber,
      String? countryToSendSms,
      bool? hasIndianRegisteredSenderId,
      String? usageDescription,
      String? userAccountType,
      String? userAddress,
      String? userCountry,
      String? userCity,
      String? userState,
      int? userZipCode,
      bool? resellerType,
      String? customerId});
}

/// @nodoc
class _$RegisterDataCopyWithImpl<$Res, $Val extends RegisterData>
    implements $RegisterDataCopyWith<$Res> {
  _$RegisterDataCopyWithImpl(this._value, this._then);

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
abstract class _$$RegisterDataImplCopyWith<$Res>
    implements $RegisterDataCopyWith<$Res> {
  factory _$$RegisterDataImplCopyWith(
          _$RegisterDataImpl value, $Res Function(_$RegisterDataImpl) then) =
      __$$RegisterDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userName,
      String? companyName,
      String? companyWebsite,
      String? workingEmail,
      String? contactNumber,
      String? countryToSendSms,
      bool? hasIndianRegisteredSenderId,
      String? usageDescription,
      String? userAccountType,
      String? userAddress,
      String? userCountry,
      String? userCity,
      String? userState,
      int? userZipCode,
      bool? resellerType,
      String? customerId});
}

/// @nodoc
class __$$RegisterDataImplCopyWithImpl<$Res>
    extends _$RegisterDataCopyWithImpl<$Res, _$RegisterDataImpl>
    implements _$$RegisterDataImplCopyWith<$Res> {
  __$$RegisterDataImplCopyWithImpl(
      _$RegisterDataImpl _value, $Res Function(_$RegisterDataImpl) _then)
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
    return _then(_$RegisterDataImpl(
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

class _$RegisterDataImpl implements _RegisterData {
  const _$RegisterDataImpl(
      {this.userName,
      this.companyName,
      this.companyWebsite,
      this.workingEmail,
      this.contactNumber,
      this.countryToSendSms,
      this.hasIndianRegisteredSenderId,
      this.usageDescription,
      this.userAccountType,
      this.userAddress,
      this.userCountry,
      this.userCity,
      this.userState,
      this.userZipCode,
      this.resellerType,
      this.customerId});

  @override
  final String? userName;
  @override
  final String? companyName;
  @override
  final String? companyWebsite;
  @override
  final String? workingEmail;
  @override
  final String? contactNumber;
  @override
  final String? countryToSendSms;
  @override
  final bool? hasIndianRegisteredSenderId;
  @override
  final String? usageDescription;
  @override
  final String? userAccountType;
  @override
  final String? userAddress;
  @override
  final String? userCountry;
  @override
  final String? userCity;
  @override
  final String? userState;
  @override
  final int? userZipCode;
  @override
  final bool? resellerType;
  @override
  final String? customerId;

  @override
  String toString() {
    return 'RegisterData(userName: $userName, companyName: $companyName, companyWebsite: $companyWebsite, workingEmail: $workingEmail, contactNumber: $contactNumber, countryToSendSms: $countryToSendSms, hasIndianRegisteredSenderId: $hasIndianRegisteredSenderId, usageDescription: $usageDescription, userAccountType: $userAccountType, userAddress: $userAddress, userCountry: $userCountry, userCity: $userCity, userState: $userState, userZipCode: $userZipCode, resellerType: $resellerType, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDataImpl &&
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
  _$$RegisterDataImplCopyWith<_$RegisterDataImpl> get copyWith =>
      __$$RegisterDataImplCopyWithImpl<_$RegisterDataImpl>(this, _$identity);
}

abstract class _RegisterData implements RegisterData {
  const factory _RegisterData(
      {final String? userName,
      final String? companyName,
      final String? companyWebsite,
      final String? workingEmail,
      final String? contactNumber,
      final String? countryToSendSms,
      final bool? hasIndianRegisteredSenderId,
      final String? usageDescription,
      final String? userAccountType,
      final String? userAddress,
      final String? userCountry,
      final String? userCity,
      final String? userState,
      final int? userZipCode,
      final bool? resellerType,
      final String? customerId}) = _$RegisterDataImpl;

  @override
  String? get userName;
  @override
  String? get companyName;
  @override
  String? get companyWebsite;
  @override
  String? get workingEmail;
  @override
  String? get contactNumber;
  @override
  String? get countryToSendSms;
  @override
  bool? get hasIndianRegisteredSenderId;
  @override
  String? get usageDescription;
  @override
  String? get userAccountType;
  @override
  String? get userAddress;
  @override
  String? get userCountry;
  @override
  String? get userCity;
  @override
  String? get userState;
  @override
  int? get userZipCode;
  @override
  bool? get resellerType;
  @override
  String? get customerId;
  @override
  @JsonKey(ignore: true)
  _$$RegisterDataImplCopyWith<_$RegisterDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
