// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_password_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConfirmPasswordEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ConfirmPaasswordData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfirmPasswordEntityCopyWith<ConfirmPasswordEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmPasswordEntityCopyWith<$Res> {
  factory $ConfirmPasswordEntityCopyWith(ConfirmPasswordEntity value,
          $Res Function(ConfirmPasswordEntity) then) =
      _$ConfirmPasswordEntityCopyWithImpl<$Res, ConfirmPasswordEntity>;
  @useResult
  $Res call({int? responseCode, String? message, ConfirmPaasswordData? data});

  $ConfirmPaasswordDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ConfirmPasswordEntityCopyWithImpl<$Res,
        $Val extends ConfirmPasswordEntity>
    implements $ConfirmPasswordEntityCopyWith<$Res> {
  _$ConfirmPasswordEntityCopyWithImpl(this._value, this._then);

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
              as ConfirmPaasswordData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConfirmPaasswordDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ConfirmPaasswordDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfirmPasswordEntityImplCopyWith<$Res>
    implements $ConfirmPasswordEntityCopyWith<$Res> {
  factory _$$ConfirmPasswordEntityImplCopyWith(
          _$ConfirmPasswordEntityImpl value,
          $Res Function(_$ConfirmPasswordEntityImpl) then) =
      __$$ConfirmPasswordEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, ConfirmPaasswordData? data});

  @override
  $ConfirmPaasswordDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ConfirmPasswordEntityImplCopyWithImpl<$Res>
    extends _$ConfirmPasswordEntityCopyWithImpl<$Res,
        _$ConfirmPasswordEntityImpl>
    implements _$$ConfirmPasswordEntityImplCopyWith<$Res> {
  __$$ConfirmPasswordEntityImplCopyWithImpl(_$ConfirmPasswordEntityImpl _value,
      $Res Function(_$ConfirmPasswordEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ConfirmPasswordEntityImpl(
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
              as ConfirmPaasswordData?,
    ));
  }
}

/// @nodoc

class _$ConfirmPasswordEntityImpl implements _ConfirmPasswordEntity {
  const _$ConfirmPasswordEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final ConfirmPaasswordData? data;

  @override
  String toString() {
    return 'ConfirmPasswordEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPasswordEntityImpl &&
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
  _$$ConfirmPasswordEntityImplCopyWith<_$ConfirmPasswordEntityImpl>
      get copyWith => __$$ConfirmPasswordEntityImplCopyWithImpl<
          _$ConfirmPasswordEntityImpl>(this, _$identity);
}

abstract class _ConfirmPasswordEntity implements ConfirmPasswordEntity {
  const factory _ConfirmPasswordEntity(
      {final int? responseCode,
      final String? message,
      final ConfirmPaasswordData? data}) = _$ConfirmPasswordEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  ConfirmPaasswordData? get data;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmPasswordEntityImplCopyWith<_$ConfirmPasswordEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConfirmPaasswordData {
  String? get customerId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  dynamic get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get phoneCode => throw _privateConstructorUsedError;
  String? get phoneNo => throw _privateConstructorUsedError;
  dynamic get application => throw _privateConstructorUsedError;
  dynamic get wallet => throw _privateConstructorUsedError;
  dynamic get authToken => throw _privateConstructorUsedError;
  DateTime? get createdDateTime => throw _privateConstructorUsedError;
  dynamic get updatedDateTime => throw _privateConstructorUsedError;
  dynamic get address => throw _privateConstructorUsedError;
  dynamic get city => throw _privateConstructorUsedError;
  dynamic get state => throw _privateConstructorUsedError;
  dynamic get postalCode => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  bool? get newUser => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfirmPaasswordDataCopyWith<ConfirmPaasswordData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmPaasswordDataCopyWith<$Res> {
  factory $ConfirmPaasswordDataCopyWith(ConfirmPaasswordData value,
          $Res Function(ConfirmPaasswordData) then) =
      _$ConfirmPaasswordDataCopyWithImpl<$Res, ConfirmPaasswordData>;
  @useResult
  $Res call(
      {String? customerId,
      String? firstName,
      dynamic lastName,
      String? email,
      String? password,
      String? phoneCode,
      String? phoneNo,
      dynamic application,
      dynamic wallet,
      dynamic authToken,
      DateTime? createdDateTime,
      dynamic updatedDateTime,
      dynamic address,
      dynamic city,
      dynamic state,
      dynamic postalCode,
      dynamic country,
      bool? newUser,
      String? brandName});
}

/// @nodoc
class _$ConfirmPaasswordDataCopyWithImpl<$Res,
        $Val extends ConfirmPaasswordData>
    implements $ConfirmPaasswordDataCopyWith<$Res> {
  _$ConfirmPaasswordDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneCode = freezed,
    Object? phoneNo = freezed,
    Object? application = freezed,
    Object? wallet = freezed,
    Object? authToken = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? newUser = freezed,
    Object? brandName = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as dynamic,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmPaasswordDataImplCopyWith<$Res>
    implements $ConfirmPaasswordDataCopyWith<$Res> {
  factory _$$ConfirmPaasswordDataImplCopyWith(_$ConfirmPaasswordDataImpl value,
          $Res Function(_$ConfirmPaasswordDataImpl) then) =
      __$$ConfirmPaasswordDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customerId,
      String? firstName,
      dynamic lastName,
      String? email,
      String? password,
      String? phoneCode,
      String? phoneNo,
      dynamic application,
      dynamic wallet,
      dynamic authToken,
      DateTime? createdDateTime,
      dynamic updatedDateTime,
      dynamic address,
      dynamic city,
      dynamic state,
      dynamic postalCode,
      dynamic country,
      bool? newUser,
      String? brandName});
}

/// @nodoc
class __$$ConfirmPaasswordDataImplCopyWithImpl<$Res>
    extends _$ConfirmPaasswordDataCopyWithImpl<$Res, _$ConfirmPaasswordDataImpl>
    implements _$$ConfirmPaasswordDataImplCopyWith<$Res> {
  __$$ConfirmPaasswordDataImplCopyWithImpl(_$ConfirmPaasswordDataImpl _value,
      $Res Function(_$ConfirmPaasswordDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneCode = freezed,
    Object? phoneNo = freezed,
    Object? application = freezed,
    Object? wallet = freezed,
    Object? authToken = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? newUser = freezed,
    Object? brandName = freezed,
  }) {
    return _then(_$ConfirmPaasswordDataImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNo: freezed == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as dynamic,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as dynamic,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConfirmPaasswordDataImpl implements _ConfirmPaasswordData {
  const _$ConfirmPaasswordDataImpl(
      {this.customerId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneCode,
      this.phoneNo,
      this.application,
      this.wallet,
      this.authToken,
      this.createdDateTime,
      this.updatedDateTime,
      this.address,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.newUser,
      this.brandName});

  @override
  final String? customerId;
  @override
  final String? firstName;
  @override
  final dynamic lastName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phoneCode;
  @override
  final String? phoneNo;
  @override
  final dynamic application;
  @override
  final dynamic wallet;
  @override
  final dynamic authToken;
  @override
  final DateTime? createdDateTime;
  @override
  final dynamic updatedDateTime;
  @override
  final dynamic address;
  @override
  final dynamic city;
  @override
  final dynamic state;
  @override
  final dynamic postalCode;
  @override
  final dynamic country;
  @override
  final bool? newUser;
  @override
  final String? brandName;

  @override
  String toString() {
    return 'ConfirmPaasswordData(customerId: $customerId, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneCode: $phoneCode, phoneNo: $phoneNo, application: $application, wallet: $wallet, authToken: $authToken, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, newUser: $newUser, brandName: $brandName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPaasswordDataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            const DeepCollectionEquality()
                .equals(other.application, application) &&
            const DeepCollectionEquality().equals(other.wallet, wallet) &&
            const DeepCollectionEquality().equals(other.authToken, authToken) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            const DeepCollectionEquality()
                .equals(other.updatedDateTime, updatedDateTime) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            (identical(other.newUser, newUser) || other.newUser == newUser) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerId,
        firstName,
        const DeepCollectionEquality().hash(lastName),
        email,
        password,
        phoneCode,
        phoneNo,
        const DeepCollectionEquality().hash(application),
        const DeepCollectionEquality().hash(wallet),
        const DeepCollectionEquality().hash(authToken),
        createdDateTime,
        const DeepCollectionEquality().hash(updatedDateTime),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(city),
        const DeepCollectionEquality().hash(state),
        const DeepCollectionEquality().hash(postalCode),
        const DeepCollectionEquality().hash(country),
        newUser,
        brandName
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmPaasswordDataImplCopyWith<_$ConfirmPaasswordDataImpl>
      get copyWith =>
          __$$ConfirmPaasswordDataImplCopyWithImpl<_$ConfirmPaasswordDataImpl>(
              this, _$identity);
}

abstract class _ConfirmPaasswordData implements ConfirmPaasswordData {
  const factory _ConfirmPaasswordData(
      {final String? customerId,
      final String? firstName,
      final dynamic lastName,
      final String? email,
      final String? password,
      final String? phoneCode,
      final String? phoneNo,
      final dynamic application,
      final dynamic wallet,
      final dynamic authToken,
      final DateTime? createdDateTime,
      final dynamic updatedDateTime,
      final dynamic address,
      final dynamic city,
      final dynamic state,
      final dynamic postalCode,
      final dynamic country,
      final bool? newUser,
      final String? brandName}) = _$ConfirmPaasswordDataImpl;

  @override
  String? get customerId;
  @override
  String? get firstName;
  @override
  dynamic get lastName;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get phoneCode;
  @override
  String? get phoneNo;
  @override
  dynamic get application;
  @override
  dynamic get wallet;
  @override
  dynamic get authToken;
  @override
  DateTime? get createdDateTime;
  @override
  dynamic get updatedDateTime;
  @override
  dynamic get address;
  @override
  dynamic get city;
  @override
  dynamic get state;
  @override
  dynamic get postalCode;
  @override
  dynamic get country;
  @override
  bool? get newUser;
  @override
  String? get brandName;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmPaasswordDataImplCopyWith<_$ConfirmPaasswordDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
