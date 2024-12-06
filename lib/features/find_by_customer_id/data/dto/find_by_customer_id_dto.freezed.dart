// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_by_customer_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindByCustomerIdDto _$FindByCustomerIdDtoFromJson(Map<String, dynamic> json) {
  return _FindByCustomerIdDto.fromJson(json);
}

/// @nodoc
mixin _$FindByCustomerIdDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindByCustomerIdDtoCopyWith<FindByCustomerIdDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindByCustomerIdDtoCopyWith<$Res> {
  factory $FindByCustomerIdDtoCopyWith(
          FindByCustomerIdDto value, $Res Function(FindByCustomerIdDto) then) =
      _$FindByCustomerIdDtoCopyWithImpl<$Res, FindByCustomerIdDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FindByCustomerIdDtoCopyWithImpl<$Res, $Val extends FindByCustomerIdDto>
    implements $FindByCustomerIdDtoCopyWith<$Res> {
  _$FindByCustomerIdDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$FindByCustomerIdDtoImplCopyWith<$Res>
    implements $FindByCustomerIdDtoCopyWith<$Res> {
  factory _$$FindByCustomerIdDtoImplCopyWith(_$FindByCustomerIdDtoImpl value,
          $Res Function(_$FindByCustomerIdDtoImpl) then) =
      __$$FindByCustomerIdDtoImplCopyWithImpl<$Res>;
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
class __$$FindByCustomerIdDtoImplCopyWithImpl<$Res>
    extends _$FindByCustomerIdDtoCopyWithImpl<$Res, _$FindByCustomerIdDtoImpl>
    implements _$$FindByCustomerIdDtoImplCopyWith<$Res> {
  __$$FindByCustomerIdDtoImplCopyWithImpl(_$FindByCustomerIdDtoImpl _value,
      $Res Function(_$FindByCustomerIdDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FindByCustomerIdDtoImpl(
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
class _$FindByCustomerIdDtoImpl implements _FindByCustomerIdDto {
  const _$FindByCustomerIdDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$FindByCustomerIdDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindByCustomerIdDtoImplFromJson(json);

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
    return 'FindByCustomerIdDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindByCustomerIdDtoImpl &&
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
  _$$FindByCustomerIdDtoImplCopyWith<_$FindByCustomerIdDtoImpl> get copyWith =>
      __$$FindByCustomerIdDtoImplCopyWithImpl<_$FindByCustomerIdDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindByCustomerIdDtoImplToJson(
      this,
    );
  }
}

abstract class _FindByCustomerIdDto implements FindByCustomerIdDto {
  const factory _FindByCustomerIdDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$FindByCustomerIdDtoImpl;

  factory _FindByCustomerIdDto.fromJson(Map<String, dynamic> json) =
      _$FindByCustomerIdDtoImpl.fromJson;

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
  _$$FindByCustomerIdDtoImplCopyWith<_$FindByCustomerIdDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "firstName")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "lastName")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "phoneCode")
  String? get phoneCode => throw _privateConstructorUsedError;
  @JsonKey(name: "phoneNo")
  String? get phoneNo => throw _privateConstructorUsedError;
  @JsonKey(name: "application")
  Application? get application => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet")
  Wallet? get wallet => throw _privateConstructorUsedError;
  @JsonKey(name: "authToken")
  String? get authToken =>
      throw _privateConstructorUsedError; // @JsonKey(name: "createdDateTime") List<int>? createdDateTime,
// @JsonKey(name: "updatedDateTime") List<int>? updatedDateTime,
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "postalCode")
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "newUser")
  bool? get newUser => throw _privateConstructorUsedError;
  @JsonKey(name: "brandName")
  String? get brandName => throw _privateConstructorUsedError;

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
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "phoneCode") String? phoneCode,
      @JsonKey(name: "phoneNo") String? phoneNo,
      @JsonKey(name: "application") Application? application,
      @JsonKey(name: "wallet") Wallet? wallet,
      @JsonKey(name: "authToken") String? authToken,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "postalCode") String? postalCode,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "newUser") bool? newUser,
      @JsonKey(name: "brandName") String? brandName});

  $ApplicationCopyWith<$Res>? get application;
  $WalletCopyWith<$Res>? get wallet;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneCode = freezed,
    Object? phoneNo = freezed,
    Object? application = freezed,
    Object? wallet = freezed,
    Object? authToken = freezed,
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
              as String?,
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
              as Application?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @override
  @pragma('vm:prefer-inline')
  $ApplicationCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $ApplicationCopyWith<$Res>(_value.application!, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
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
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "phoneCode") String? phoneCode,
      @JsonKey(name: "phoneNo") String? phoneNo,
      @JsonKey(name: "application") Application? application,
      @JsonKey(name: "wallet") Wallet? wallet,
      @JsonKey(name: "authToken") String? authToken,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "postalCode") String? postalCode,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "newUser") bool? newUser,
      @JsonKey(name: "brandName") String? brandName});

  @override
  $ApplicationCopyWith<$Res>? get application;
  @override
  $WalletCopyWith<$Res>? get wallet;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneCode = freezed,
    Object? phoneNo = freezed,
    Object? application = freezed,
    Object? wallet = freezed,
    Object? authToken = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? newUser = freezed,
    Object? brandName = freezed,
  }) {
    return _then(_$DataImpl(
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
              as String?,
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
              as Application?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "firstName") this.firstName,
      @JsonKey(name: "lastName") this.lastName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "password") this.password,
      @JsonKey(name: "phoneCode") this.phoneCode,
      @JsonKey(name: "phoneNo") this.phoneNo,
      @JsonKey(name: "application") this.application,
      @JsonKey(name: "wallet") this.wallet,
      @JsonKey(name: "authToken") this.authToken,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "state") this.state,
      @JsonKey(name: "postalCode") this.postalCode,
      @JsonKey(name: "country") this.country,
      @JsonKey(name: "newUser") this.newUser,
      @JsonKey(name: "brandName") this.brandName});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "firstName")
  final String? firstName;
  @override
  @JsonKey(name: "lastName")
  final String? lastName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "password")
  final String? password;
  @override
  @JsonKey(name: "phoneCode")
  final String? phoneCode;
  @override
  @JsonKey(name: "phoneNo")
  final String? phoneNo;
  @override
  @JsonKey(name: "application")
  final Application? application;
  @override
  @JsonKey(name: "wallet")
  final Wallet? wallet;
  @override
  @JsonKey(name: "authToken")
  final String? authToken;
// @JsonKey(name: "createdDateTime") List<int>? createdDateTime,
// @JsonKey(name: "updatedDateTime") List<int>? updatedDateTime,
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "postalCode")
  final String? postalCode;
  @override
  @JsonKey(name: "country")
  final String? country;
  @override
  @JsonKey(name: "newUser")
  final bool? newUser;
  @override
  @JsonKey(name: "brandName")
  final String? brandName;

  @override
  String toString() {
    return 'Data(customerId: $customerId, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneCode: $phoneCode, phoneNo: $phoneNo, application: $application, wallet: $wallet, authToken: $authToken, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, newUser: $newUser, brandName: $brandName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.application, application) ||
                other.application == application) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.newUser, newUser) || other.newUser == newUser) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      firstName,
      lastName,
      email,
      password,
      phoneCode,
      phoneNo,
      application,
      wallet,
      authToken,
      address,
      city,
      state,
      postalCode,
      country,
      newUser,
      brandName);

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
      @JsonKey(name: "firstName") final String? firstName,
      @JsonKey(name: "lastName") final String? lastName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "password") final String? password,
      @JsonKey(name: "phoneCode") final String? phoneCode,
      @JsonKey(name: "phoneNo") final String? phoneNo,
      @JsonKey(name: "application") final Application? application,
      @JsonKey(name: "wallet") final Wallet? wallet,
      @JsonKey(name: "authToken") final String? authToken,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "city") final String? city,
      @JsonKey(name: "state") final String? state,
      @JsonKey(name: "postalCode") final String? postalCode,
      @JsonKey(name: "country") final String? country,
      @JsonKey(name: "newUser") final bool? newUser,
      @JsonKey(name: "brandName") final String? brandName}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "firstName")
  String? get firstName;
  @override
  @JsonKey(name: "lastName")
  String? get lastName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "password")
  String? get password;
  @override
  @JsonKey(name: "phoneCode")
  String? get phoneCode;
  @override
  @JsonKey(name: "phoneNo")
  String? get phoneNo;
  @override
  @JsonKey(name: "application")
  Application? get application;
  @override
  @JsonKey(name: "wallet")
  Wallet? get wallet;
  @override
  @JsonKey(name: "authToken")
  String? get authToken;
  @override // @JsonKey(name: "createdDateTime") List<int>? createdDateTime,
// @JsonKey(name: "updatedDateTime") List<int>? updatedDateTime,
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "postalCode")
  String? get postalCode;
  @override
  @JsonKey(name: "country")
  String? get country;
  @override
  @JsonKey(name: "newUser")
  bool? get newUser;
  @override
  @JsonKey(name: "brandName")
  String? get brandName;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return _Application.fromJson(json);
}

/// @nodoc
mixin _$Application {
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "clientId")
  String? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: "apiKey")
  String? get apiKey => throw _privateConstructorUsedError;
  @JsonKey(name: "createdDateTime")
  List<dynamic>? get createdDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedDateTime")
  List<dynamic>? get updatedDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  dynamic get description => throw _privateConstructorUsedError;
  @JsonKey(name: "displayAppName")
  dynamic get displayAppName => throw _privateConstructorUsedError;
  @JsonKey(name: "otpLength")
  String? get otpLength => throw _privateConstructorUsedError;
  @JsonKey(name: "isActive")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "isSmsActive")
  bool? get isSmsActive => throw _privateConstructorUsedError;
  @JsonKey(name: "isSmsDiscountAvaliable")
  bool? get isSmsDiscountAvaliable => throw _privateConstructorUsedError;
  @JsonKey(name: "clientIdSms")
  dynamic get clientIdSms => throw _privateConstructorUsedError;
  @JsonKey(name: "apiKeySms")
  dynamic get apiKeySms => throw _privateConstructorUsedError;
  @JsonKey(name: "senderIdSms")
  dynamic get senderIdSms => throw _privateConstructorUsedError;
  @JsonKey(name: "smsDiscountPercentage")
  int? get smsDiscountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "isEmailActive")
  bool? get isEmailActive => throw _privateConstructorUsedError;
  @JsonKey(name: "isEmailDiscountAvaliable")
  bool? get isEmailDiscountAvaliable => throw _privateConstructorUsedError;
  @JsonKey(name: "emailDiscountPercentage")
  int? get emailDiscountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "isWhatsAppActive")
  bool? get isWhatsAppActive => throw _privateConstructorUsedError;
  @JsonKey(name: "isWhatsAppDiscountAvaliable")
  bool? get isWhatsAppDiscountAvaliable => throw _privateConstructorUsedError;
  @JsonKey(name: "wnMarketingDiscountPercentage")
  int? get wnMarketingDiscountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "wnUtilityDiscountPercentage")
  int? get wnUtilityDiscountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "wnServiceDiscountPercentage")
  int? get wnServiceDiscountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "wnAuthenticationDiscountPercentage")
  int? get wnAuthenticationDiscountPercentage =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "priceDeductionMode")
  String? get priceDeductionMode => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "smsActive")
  bool? get smsActive => throw _privateConstructorUsedError;
  @JsonKey(name: "smsDiscountAvaliable")
  bool? get smsDiscountAvaliable => throw _privateConstructorUsedError;
  @JsonKey(name: "emailActive")
  bool? get emailActive => throw _privateConstructorUsedError;
  @JsonKey(name: "emailDiscountAvaliable")
  bool? get emailDiscountAvaliable => throw _privateConstructorUsedError;
  @JsonKey(name: "whatsAppActive")
  bool? get whatsAppActive => throw _privateConstructorUsedError;
  @JsonKey(name: "whatsAppDiscountAvaliable")
  bool? get whatsAppDiscountAvaliable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationCopyWith<Application> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationCopyWith<$Res> {
  factory $ApplicationCopyWith(
          Application value, $Res Function(Application) then) =
      _$ApplicationCopyWithImpl<$Res, Application>;
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "clientId") String? clientId,
      @JsonKey(name: "apiKey") String? apiKey,
      @JsonKey(name: "createdDateTime") List<dynamic>? createdDateTime,
      @JsonKey(name: "updatedDateTime") List<dynamic>? updatedDateTime,
      @JsonKey(name: "description") dynamic description,
      @JsonKey(name: "displayAppName") dynamic displayAppName,
      @JsonKey(name: "otpLength") String? otpLength,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "isSmsActive") bool? isSmsActive,
      @JsonKey(name: "isSmsDiscountAvaliable") bool? isSmsDiscountAvaliable,
      @JsonKey(name: "clientIdSms") dynamic clientIdSms,
      @JsonKey(name: "apiKeySms") dynamic apiKeySms,
      @JsonKey(name: "senderIdSms") dynamic senderIdSms,
      @JsonKey(name: "smsDiscountPercentage") int? smsDiscountPercentage,
      @JsonKey(name: "isEmailActive") bool? isEmailActive,
      @JsonKey(name: "isEmailDiscountAvaliable") bool? isEmailDiscountAvaliable,
      @JsonKey(name: "emailDiscountPercentage") int? emailDiscountPercentage,
      @JsonKey(name: "isWhatsAppActive") bool? isWhatsAppActive,
      @JsonKey(name: "isWhatsAppDiscountAvaliable")
      bool? isWhatsAppDiscountAvaliable,
      @JsonKey(name: "wnMarketingDiscountPercentage")
      int? wnMarketingDiscountPercentage,
      @JsonKey(name: "wnUtilityDiscountPercentage")
      int? wnUtilityDiscountPercentage,
      @JsonKey(name: "wnServiceDiscountPercentage")
      int? wnServiceDiscountPercentage,
      @JsonKey(name: "wnAuthenticationDiscountPercentage")
      int? wnAuthenticationDiscountPercentage,
      @JsonKey(name: "priceDeductionMode") String? priceDeductionMode,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "smsActive") bool? smsActive,
      @JsonKey(name: "smsDiscountAvaliable") bool? smsDiscountAvaliable,
      @JsonKey(name: "emailActive") bool? emailActive,
      @JsonKey(name: "emailDiscountAvaliable") bool? emailDiscountAvaliable,
      @JsonKey(name: "whatsAppActive") bool? whatsAppActive,
      @JsonKey(name: "whatsAppDiscountAvaliable")
      bool? whatsAppDiscountAvaliable});
}

/// @nodoc
class _$ApplicationCopyWithImpl<$Res, $Val extends Application>
    implements $ApplicationCopyWith<$Res> {
  _$ApplicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? clientId = freezed,
    Object? apiKey = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? description = freezed,
    Object? displayAppName = freezed,
    Object? otpLength = freezed,
    Object? isActive = freezed,
    Object? isSmsActive = freezed,
    Object? isSmsDiscountAvaliable = freezed,
    Object? clientIdSms = freezed,
    Object? apiKeySms = freezed,
    Object? senderIdSms = freezed,
    Object? smsDiscountPercentage = freezed,
    Object? isEmailActive = freezed,
    Object? isEmailDiscountAvaliable = freezed,
    Object? emailDiscountPercentage = freezed,
    Object? isWhatsAppActive = freezed,
    Object? isWhatsAppDiscountAvaliable = freezed,
    Object? wnMarketingDiscountPercentage = freezed,
    Object? wnUtilityDiscountPercentage = freezed,
    Object? wnServiceDiscountPercentage = freezed,
    Object? wnAuthenticationDiscountPercentage = freezed,
    Object? priceDeductionMode = freezed,
    Object? active = freezed,
    Object? smsActive = freezed,
    Object? smsDiscountAvaliable = freezed,
    Object? emailActive = freezed,
    Object? emailDiscountAvaliable = freezed,
    Object? whatsAppActive = freezed,
    Object? whatsAppDiscountAvaliable = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayAppName: freezed == displayAppName
          ? _value.displayAppName
          : displayAppName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otpLength: freezed == otpLength
          ? _value.otpLength
          : otpLength // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSmsActive: freezed == isSmsActive
          ? _value.isSmsActive
          : isSmsActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSmsDiscountAvaliable: freezed == isSmsDiscountAvaliable
          ? _value.isSmsDiscountAvaliable
          : isSmsDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientIdSms: freezed == clientIdSms
          ? _value.clientIdSms
          : clientIdSms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      apiKeySms: freezed == apiKeySms
          ? _value.apiKeySms
          : apiKeySms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      senderIdSms: freezed == senderIdSms
          ? _value.senderIdSms
          : senderIdSms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      smsDiscountPercentage: freezed == smsDiscountPercentage
          ? _value.smsDiscountPercentage
          : smsDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailActive: freezed == isEmailActive
          ? _value.isEmailActive
          : isEmailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailDiscountAvaliable: freezed == isEmailDiscountAvaliable
          ? _value.isEmailDiscountAvaliable
          : isEmailDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountPercentage: freezed == emailDiscountPercentage
          ? _value.emailDiscountPercentage
          : emailDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isWhatsAppActive: freezed == isWhatsAppActive
          ? _value.isWhatsAppActive
          : isWhatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWhatsAppDiscountAvaliable: freezed == isWhatsAppDiscountAvaliable
          ? _value.isWhatsAppDiscountAvaliable
          : isWhatsAppDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      wnMarketingDiscountPercentage: freezed == wnMarketingDiscountPercentage
          ? _value.wnMarketingDiscountPercentage
          : wnMarketingDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      wnUtilityDiscountPercentage: freezed == wnUtilityDiscountPercentage
          ? _value.wnUtilityDiscountPercentage
          : wnUtilityDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      wnServiceDiscountPercentage: freezed == wnServiceDiscountPercentage
          ? _value.wnServiceDiscountPercentage
          : wnServiceDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      wnAuthenticationDiscountPercentage: freezed ==
              wnAuthenticationDiscountPercentage
          ? _value.wnAuthenticationDiscountPercentage
          : wnAuthenticationDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      priceDeductionMode: freezed == priceDeductionMode
          ? _value.priceDeductionMode
          : priceDeductionMode // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      smsActive: freezed == smsActive
          ? _value.smsActive
          : smsActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      smsDiscountAvaliable: freezed == smsDiscountAvaliable
          ? _value.smsDiscountAvaliable
          : smsDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailActive: freezed == emailActive
          ? _value.emailActive
          : emailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountAvaliable: freezed == emailDiscountAvaliable
          ? _value.emailDiscountAvaliable
          : emailDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppActive: freezed == whatsAppActive
          ? _value.whatsAppActive
          : whatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppDiscountAvaliable: freezed == whatsAppDiscountAvaliable
          ? _value.whatsAppDiscountAvaliable
          : whatsAppDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationImplCopyWith<$Res>
    implements $ApplicationCopyWith<$Res> {
  factory _$$ApplicationImplCopyWith(
          _$ApplicationImpl value, $Res Function(_$ApplicationImpl) then) =
      __$$ApplicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "clientId") String? clientId,
      @JsonKey(name: "apiKey") String? apiKey,
      @JsonKey(name: "createdDateTime") List<dynamic>? createdDateTime,
      @JsonKey(name: "updatedDateTime") List<dynamic>? updatedDateTime,
      @JsonKey(name: "description") dynamic description,
      @JsonKey(name: "displayAppName") dynamic displayAppName,
      @JsonKey(name: "otpLength") String? otpLength,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "isSmsActive") bool? isSmsActive,
      @JsonKey(name: "isSmsDiscountAvaliable") bool? isSmsDiscountAvaliable,
      @JsonKey(name: "clientIdSms") dynamic clientIdSms,
      @JsonKey(name: "apiKeySms") dynamic apiKeySms,
      @JsonKey(name: "senderIdSms") dynamic senderIdSms,
      @JsonKey(name: "smsDiscountPercentage") int? smsDiscountPercentage,
      @JsonKey(name: "isEmailActive") bool? isEmailActive,
      @JsonKey(name: "isEmailDiscountAvaliable") bool? isEmailDiscountAvaliable,
      @JsonKey(name: "emailDiscountPercentage") int? emailDiscountPercentage,
      @JsonKey(name: "isWhatsAppActive") bool? isWhatsAppActive,
      @JsonKey(name: "isWhatsAppDiscountAvaliable")
      bool? isWhatsAppDiscountAvaliable,
      @JsonKey(name: "wnMarketingDiscountPercentage")
      int? wnMarketingDiscountPercentage,
      @JsonKey(name: "wnUtilityDiscountPercentage")
      int? wnUtilityDiscountPercentage,
      @JsonKey(name: "wnServiceDiscountPercentage")
      int? wnServiceDiscountPercentage,
      @JsonKey(name: "wnAuthenticationDiscountPercentage")
      int? wnAuthenticationDiscountPercentage,
      @JsonKey(name: "priceDeductionMode") String? priceDeductionMode,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "smsActive") bool? smsActive,
      @JsonKey(name: "smsDiscountAvaliable") bool? smsDiscountAvaliable,
      @JsonKey(name: "emailActive") bool? emailActive,
      @JsonKey(name: "emailDiscountAvaliable") bool? emailDiscountAvaliable,
      @JsonKey(name: "whatsAppActive") bool? whatsAppActive,
      @JsonKey(name: "whatsAppDiscountAvaliable")
      bool? whatsAppDiscountAvaliable});
}

/// @nodoc
class __$$ApplicationImplCopyWithImpl<$Res>
    extends _$ApplicationCopyWithImpl<$Res, _$ApplicationImpl>
    implements _$$ApplicationImplCopyWith<$Res> {
  __$$ApplicationImplCopyWithImpl(
      _$ApplicationImpl _value, $Res Function(_$ApplicationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? clientId = freezed,
    Object? apiKey = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? description = freezed,
    Object? displayAppName = freezed,
    Object? otpLength = freezed,
    Object? isActive = freezed,
    Object? isSmsActive = freezed,
    Object? isSmsDiscountAvaliable = freezed,
    Object? clientIdSms = freezed,
    Object? apiKeySms = freezed,
    Object? senderIdSms = freezed,
    Object? smsDiscountPercentage = freezed,
    Object? isEmailActive = freezed,
    Object? isEmailDiscountAvaliable = freezed,
    Object? emailDiscountPercentage = freezed,
    Object? isWhatsAppActive = freezed,
    Object? isWhatsAppDiscountAvaliable = freezed,
    Object? wnMarketingDiscountPercentage = freezed,
    Object? wnUtilityDiscountPercentage = freezed,
    Object? wnServiceDiscountPercentage = freezed,
    Object? wnAuthenticationDiscountPercentage = freezed,
    Object? priceDeductionMode = freezed,
    Object? active = freezed,
    Object? smsActive = freezed,
    Object? smsDiscountAvaliable = freezed,
    Object? emailActive = freezed,
    Object? emailDiscountAvaliable = freezed,
    Object? whatsAppActive = freezed,
    Object? whatsAppDiscountAvaliable = freezed,
  }) {
    return _then(_$ApplicationImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _value._createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      updatedDateTime: freezed == updatedDateTime
          ? _value._updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayAppName: freezed == displayAppName
          ? _value.displayAppName
          : displayAppName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otpLength: freezed == otpLength
          ? _value.otpLength
          : otpLength // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSmsActive: freezed == isSmsActive
          ? _value.isSmsActive
          : isSmsActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSmsDiscountAvaliable: freezed == isSmsDiscountAvaliable
          ? _value.isSmsDiscountAvaliable
          : isSmsDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientIdSms: freezed == clientIdSms
          ? _value.clientIdSms
          : clientIdSms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      apiKeySms: freezed == apiKeySms
          ? _value.apiKeySms
          : apiKeySms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      senderIdSms: freezed == senderIdSms
          ? _value.senderIdSms
          : senderIdSms // ignore: cast_nullable_to_non_nullable
              as dynamic,
      smsDiscountPercentage: freezed == smsDiscountPercentage
          ? _value.smsDiscountPercentage
          : smsDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailActive: freezed == isEmailActive
          ? _value.isEmailActive
          : isEmailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailDiscountAvaliable: freezed == isEmailDiscountAvaliable
          ? _value.isEmailDiscountAvaliable
          : isEmailDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountPercentage: freezed == emailDiscountPercentage
          ? _value.emailDiscountPercentage
          : emailDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isWhatsAppActive: freezed == isWhatsAppActive
          ? _value.isWhatsAppActive
          : isWhatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWhatsAppDiscountAvaliable: freezed == isWhatsAppDiscountAvaliable
          ? _value.isWhatsAppDiscountAvaliable
          : isWhatsAppDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      wnMarketingDiscountPercentage: freezed == wnMarketingDiscountPercentage
          ? _value.wnMarketingDiscountPercentage
          : wnMarketingDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      wnUtilityDiscountPercentage: freezed == wnUtilityDiscountPercentage
          ? _value.wnUtilityDiscountPercentage
          : wnUtilityDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      wnServiceDiscountPercentage: freezed == wnServiceDiscountPercentage
          ? _value.wnServiceDiscountPercentage
          : wnServiceDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      wnAuthenticationDiscountPercentage: freezed ==
              wnAuthenticationDiscountPercentage
          ? _value.wnAuthenticationDiscountPercentage
          : wnAuthenticationDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      priceDeductionMode: freezed == priceDeductionMode
          ? _value.priceDeductionMode
          : priceDeductionMode // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      smsActive: freezed == smsActive
          ? _value.smsActive
          : smsActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      smsDiscountAvaliable: freezed == smsDiscountAvaliable
          ? _value.smsDiscountAvaliable
          : smsDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailActive: freezed == emailActive
          ? _value.emailActive
          : emailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountAvaliable: freezed == emailDiscountAvaliable
          ? _value.emailDiscountAvaliable
          : emailDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppActive: freezed == whatsAppActive
          ? _value.whatsAppActive
          : whatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppDiscountAvaliable: freezed == whatsAppDiscountAvaliable
          ? _value.whatsAppDiscountAvaliable
          : whatsAppDiscountAvaliable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplicationImpl implements _Application {
  const _$ApplicationImpl(
      {@JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "clientId") this.clientId,
      @JsonKey(name: "apiKey") this.apiKey,
      @JsonKey(name: "createdDateTime") final List<dynamic>? createdDateTime,
      @JsonKey(name: "updatedDateTime") final List<dynamic>? updatedDateTime,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "displayAppName") this.displayAppName,
      @JsonKey(name: "otpLength") this.otpLength,
      @JsonKey(name: "isActive") this.isActive,
      @JsonKey(name: "isSmsActive") this.isSmsActive,
      @JsonKey(name: "isSmsDiscountAvaliable") this.isSmsDiscountAvaliable,
      @JsonKey(name: "clientIdSms") this.clientIdSms,
      @JsonKey(name: "apiKeySms") this.apiKeySms,
      @JsonKey(name: "senderIdSms") this.senderIdSms,
      @JsonKey(name: "smsDiscountPercentage") this.smsDiscountPercentage,
      @JsonKey(name: "isEmailActive") this.isEmailActive,
      @JsonKey(name: "isEmailDiscountAvaliable") this.isEmailDiscountAvaliable,
      @JsonKey(name: "emailDiscountPercentage") this.emailDiscountPercentage,
      @JsonKey(name: "isWhatsAppActive") this.isWhatsAppActive,
      @JsonKey(name: "isWhatsAppDiscountAvaliable")
      this.isWhatsAppDiscountAvaliable,
      @JsonKey(name: "wnMarketingDiscountPercentage")
      this.wnMarketingDiscountPercentage,
      @JsonKey(name: "wnUtilityDiscountPercentage")
      this.wnUtilityDiscountPercentage,
      @JsonKey(name: "wnServiceDiscountPercentage")
      this.wnServiceDiscountPercentage,
      @JsonKey(name: "wnAuthenticationDiscountPercentage")
      this.wnAuthenticationDiscountPercentage,
      @JsonKey(name: "priceDeductionMode") this.priceDeductionMode,
      @JsonKey(name: "active") this.active,
      @JsonKey(name: "smsActive") this.smsActive,
      @JsonKey(name: "smsDiscountAvaliable") this.smsDiscountAvaliable,
      @JsonKey(name: "emailActive") this.emailActive,
      @JsonKey(name: "emailDiscountAvaliable") this.emailDiscountAvaliable,
      @JsonKey(name: "whatsAppActive") this.whatsAppActive,
      @JsonKey(name: "whatsAppDiscountAvaliable")
      this.whatsAppDiscountAvaliable})
      : _createdDateTime = createdDateTime,
        _updatedDateTime = updatedDateTime;

  factory _$ApplicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationImplFromJson(json);

  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "clientId")
  final String? clientId;
  @override
  @JsonKey(name: "apiKey")
  final String? apiKey;
  final List<dynamic>? _createdDateTime;
  @override
  @JsonKey(name: "createdDateTime")
  List<dynamic>? get createdDateTime {
    final value = _createdDateTime;
    if (value == null) return null;
    if (_createdDateTime is EqualUnmodifiableListView) return _createdDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _updatedDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  List<dynamic>? get updatedDateTime {
    final value = _updatedDateTime;
    if (value == null) return null;
    if (_updatedDateTime is EqualUnmodifiableListView) return _updatedDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "description")
  final dynamic description;
  @override
  @JsonKey(name: "displayAppName")
  final dynamic displayAppName;
  @override
  @JsonKey(name: "otpLength")
  final String? otpLength;
  @override
  @JsonKey(name: "isActive")
  final bool? isActive;
  @override
  @JsonKey(name: "isSmsActive")
  final bool? isSmsActive;
  @override
  @JsonKey(name: "isSmsDiscountAvaliable")
  final bool? isSmsDiscountAvaliable;
  @override
  @JsonKey(name: "clientIdSms")
  final dynamic clientIdSms;
  @override
  @JsonKey(name: "apiKeySms")
  final dynamic apiKeySms;
  @override
  @JsonKey(name: "senderIdSms")
  final dynamic senderIdSms;
  @override
  @JsonKey(name: "smsDiscountPercentage")
  final int? smsDiscountPercentage;
  @override
  @JsonKey(name: "isEmailActive")
  final bool? isEmailActive;
  @override
  @JsonKey(name: "isEmailDiscountAvaliable")
  final bool? isEmailDiscountAvaliable;
  @override
  @JsonKey(name: "emailDiscountPercentage")
  final int? emailDiscountPercentage;
  @override
  @JsonKey(name: "isWhatsAppActive")
  final bool? isWhatsAppActive;
  @override
  @JsonKey(name: "isWhatsAppDiscountAvaliable")
  final bool? isWhatsAppDiscountAvaliable;
  @override
  @JsonKey(name: "wnMarketingDiscountPercentage")
  final int? wnMarketingDiscountPercentage;
  @override
  @JsonKey(name: "wnUtilityDiscountPercentage")
  final int? wnUtilityDiscountPercentage;
  @override
  @JsonKey(name: "wnServiceDiscountPercentage")
  final int? wnServiceDiscountPercentage;
  @override
  @JsonKey(name: "wnAuthenticationDiscountPercentage")
  final int? wnAuthenticationDiscountPercentage;
  @override
  @JsonKey(name: "priceDeductionMode")
  final String? priceDeductionMode;
  @override
  @JsonKey(name: "active")
  final bool? active;
  @override
  @JsonKey(name: "smsActive")
  final bool? smsActive;
  @override
  @JsonKey(name: "smsDiscountAvaliable")
  final bool? smsDiscountAvaliable;
  @override
  @JsonKey(name: "emailActive")
  final bool? emailActive;
  @override
  @JsonKey(name: "emailDiscountAvaliable")
  final bool? emailDiscountAvaliable;
  @override
  @JsonKey(name: "whatsAppActive")
  final bool? whatsAppActive;
  @override
  @JsonKey(name: "whatsAppDiscountAvaliable")
  final bool? whatsAppDiscountAvaliable;

  @override
  String toString() {
    return 'Application(customerId: $customerId, clientId: $clientId, apiKey: $apiKey, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, description: $description, displayAppName: $displayAppName, otpLength: $otpLength, isActive: $isActive, isSmsActive: $isSmsActive, isSmsDiscountAvaliable: $isSmsDiscountAvaliable, clientIdSms: $clientIdSms, apiKeySms: $apiKeySms, senderIdSms: $senderIdSms, smsDiscountPercentage: $smsDiscountPercentage, isEmailActive: $isEmailActive, isEmailDiscountAvaliable: $isEmailDiscountAvaliable, emailDiscountPercentage: $emailDiscountPercentage, isWhatsAppActive: $isWhatsAppActive, isWhatsAppDiscountAvaliable: $isWhatsAppDiscountAvaliable, wnMarketingDiscountPercentage: $wnMarketingDiscountPercentage, wnUtilityDiscountPercentage: $wnUtilityDiscountPercentage, wnServiceDiscountPercentage: $wnServiceDiscountPercentage, wnAuthenticationDiscountPercentage: $wnAuthenticationDiscountPercentage, priceDeductionMode: $priceDeductionMode, active: $active, smsActive: $smsActive, smsDiscountAvaliable: $smsDiscountAvaliable, emailActive: $emailActive, emailDiscountAvaliable: $emailDiscountAvaliable, whatsAppActive: $whatsAppActive, whatsAppDiscountAvaliable: $whatsAppDiscountAvaliable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            const DeepCollectionEquality()
                .equals(other._createdDateTime, _createdDateTime) &&
            const DeepCollectionEquality()
                .equals(other._updatedDateTime, _updatedDateTime) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.displayAppName, displayAppName) &&
            (identical(other.otpLength, otpLength) ||
                other.otpLength == otpLength) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSmsActive, isSmsActive) ||
                other.isSmsActive == isSmsActive) &&
            (identical(other.isSmsDiscountAvaliable, isSmsDiscountAvaliable) ||
                other.isSmsDiscountAvaliable == isSmsDiscountAvaliable) &&
            const DeepCollectionEquality()
                .equals(other.clientIdSms, clientIdSms) &&
            const DeepCollectionEquality().equals(other.apiKeySms, apiKeySms) &&
            const DeepCollectionEquality()
                .equals(other.senderIdSms, senderIdSms) &&
            (identical(other.smsDiscountPercentage, smsDiscountPercentage) ||
                other.smsDiscountPercentage == smsDiscountPercentage) &&
            (identical(other.isEmailActive, isEmailActive) ||
                other.isEmailActive == isEmailActive) &&
            (identical(other.isEmailDiscountAvaliable, isEmailDiscountAvaliable) ||
                other.isEmailDiscountAvaliable == isEmailDiscountAvaliable) &&
            (identical(other.emailDiscountPercentage, emailDiscountPercentage) ||
                other.emailDiscountPercentage == emailDiscountPercentage) &&
            (identical(other.isWhatsAppActive, isWhatsAppActive) ||
                other.isWhatsAppActive == isWhatsAppActive) &&
            (identical(other.isWhatsAppDiscountAvaliable, isWhatsAppDiscountAvaliable) ||
                other.isWhatsAppDiscountAvaliable ==
                    isWhatsAppDiscountAvaliable) &&
            (identical(other.wnMarketingDiscountPercentage, wnMarketingDiscountPercentage) ||
                other.wnMarketingDiscountPercentage ==
                    wnMarketingDiscountPercentage) &&
            (identical(other.wnUtilityDiscountPercentage, wnUtilityDiscountPercentage) ||
                other.wnUtilityDiscountPercentage ==
                    wnUtilityDiscountPercentage) &&
            (identical(other.wnServiceDiscountPercentage, wnServiceDiscountPercentage) ||
                other.wnServiceDiscountPercentage ==
                    wnServiceDiscountPercentage) &&
            (identical(other.wnAuthenticationDiscountPercentage, wnAuthenticationDiscountPercentage) ||
                other.wnAuthenticationDiscountPercentage ==
                    wnAuthenticationDiscountPercentage) &&
            (identical(other.priceDeductionMode, priceDeductionMode) ||
                other.priceDeductionMode == priceDeductionMode) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.smsActive, smsActive) ||
                other.smsActive == smsActive) &&
            (identical(other.smsDiscountAvaliable, smsDiscountAvaliable) ||
                other.smsDiscountAvaliable == smsDiscountAvaliable) &&
            (identical(other.emailActive, emailActive) ||
                other.emailActive == emailActive) &&
            (identical(other.emailDiscountAvaliable, emailDiscountAvaliable) ||
                other.emailDiscountAvaliable == emailDiscountAvaliable) &&
            (identical(other.whatsAppActive, whatsAppActive) || other.whatsAppActive == whatsAppActive) &&
            (identical(other.whatsAppDiscountAvaliable, whatsAppDiscountAvaliable) || other.whatsAppDiscountAvaliable == whatsAppDiscountAvaliable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerId,
        clientId,
        apiKey,
        const DeepCollectionEquality().hash(_createdDateTime),
        const DeepCollectionEquality().hash(_updatedDateTime),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(displayAppName),
        otpLength,
        isActive,
        isSmsActive,
        isSmsDiscountAvaliable,
        const DeepCollectionEquality().hash(clientIdSms),
        const DeepCollectionEquality().hash(apiKeySms),
        const DeepCollectionEquality().hash(senderIdSms),
        smsDiscountPercentage,
        isEmailActive,
        isEmailDiscountAvaliable,
        emailDiscountPercentage,
        isWhatsAppActive,
        isWhatsAppDiscountAvaliable,
        wnMarketingDiscountPercentage,
        wnUtilityDiscountPercentage,
        wnServiceDiscountPercentage,
        wnAuthenticationDiscountPercentage,
        priceDeductionMode,
        active,
        smsActive,
        smsDiscountAvaliable,
        emailActive,
        emailDiscountAvaliable,
        whatsAppActive,
        whatsAppDiscountAvaliable
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationImplCopyWith<_$ApplicationImpl> get copyWith =>
      __$$ApplicationImplCopyWithImpl<_$ApplicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationImplToJson(
      this,
    );
  }
}

abstract class _Application implements Application {
  const factory _Application(
      {@JsonKey(name: "customerId") final String? customerId,
      @JsonKey(name: "clientId") final String? clientId,
      @JsonKey(name: "apiKey") final String? apiKey,
      @JsonKey(name: "createdDateTime") final List<dynamic>? createdDateTime,
      @JsonKey(name: "updatedDateTime") final List<dynamic>? updatedDateTime,
      @JsonKey(name: "description") final dynamic description,
      @JsonKey(name: "displayAppName") final dynamic displayAppName,
      @JsonKey(name: "otpLength") final String? otpLength,
      @JsonKey(name: "isActive") final bool? isActive,
      @JsonKey(name: "isSmsActive") final bool? isSmsActive,
      @JsonKey(name: "isSmsDiscountAvaliable")
      final bool? isSmsDiscountAvaliable,
      @JsonKey(name: "clientIdSms") final dynamic clientIdSms,
      @JsonKey(name: "apiKeySms") final dynamic apiKeySms,
      @JsonKey(name: "senderIdSms") final dynamic senderIdSms,
      @JsonKey(name: "smsDiscountPercentage") final int? smsDiscountPercentage,
      @JsonKey(name: "isEmailActive") final bool? isEmailActive,
      @JsonKey(name: "isEmailDiscountAvaliable")
      final bool? isEmailDiscountAvaliable,
      @JsonKey(name: "emailDiscountPercentage")
      final int? emailDiscountPercentage,
      @JsonKey(name: "isWhatsAppActive") final bool? isWhatsAppActive,
      @JsonKey(name: "isWhatsAppDiscountAvaliable")
      final bool? isWhatsAppDiscountAvaliable,
      @JsonKey(name: "wnMarketingDiscountPercentage")
      final int? wnMarketingDiscountPercentage,
      @JsonKey(name: "wnUtilityDiscountPercentage")
      final int? wnUtilityDiscountPercentage,
      @JsonKey(name: "wnServiceDiscountPercentage")
      final int? wnServiceDiscountPercentage,
      @JsonKey(name: "wnAuthenticationDiscountPercentage")
      final int? wnAuthenticationDiscountPercentage,
      @JsonKey(name: "priceDeductionMode") final String? priceDeductionMode,
      @JsonKey(name: "active") final bool? active,
      @JsonKey(name: "smsActive") final bool? smsActive,
      @JsonKey(name: "smsDiscountAvaliable") final bool? smsDiscountAvaliable,
      @JsonKey(name: "emailActive") final bool? emailActive,
      @JsonKey(name: "emailDiscountAvaliable")
      final bool? emailDiscountAvaliable,
      @JsonKey(name: "whatsAppActive") final bool? whatsAppActive,
      @JsonKey(name: "whatsAppDiscountAvaliable")
      final bool? whatsAppDiscountAvaliable}) = _$ApplicationImpl;

  factory _Application.fromJson(Map<String, dynamic> json) =
      _$ApplicationImpl.fromJson;

  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "clientId")
  String? get clientId;
  @override
  @JsonKey(name: "apiKey")
  String? get apiKey;
  @override
  @JsonKey(name: "createdDateTime")
  List<dynamic>? get createdDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  List<dynamic>? get updatedDateTime;
  @override
  @JsonKey(name: "description")
  dynamic get description;
  @override
  @JsonKey(name: "displayAppName")
  dynamic get displayAppName;
  @override
  @JsonKey(name: "otpLength")
  String? get otpLength;
  @override
  @JsonKey(name: "isActive")
  bool? get isActive;
  @override
  @JsonKey(name: "isSmsActive")
  bool? get isSmsActive;
  @override
  @JsonKey(name: "isSmsDiscountAvaliable")
  bool? get isSmsDiscountAvaliable;
  @override
  @JsonKey(name: "clientIdSms")
  dynamic get clientIdSms;
  @override
  @JsonKey(name: "apiKeySms")
  dynamic get apiKeySms;
  @override
  @JsonKey(name: "senderIdSms")
  dynamic get senderIdSms;
  @override
  @JsonKey(name: "smsDiscountPercentage")
  int? get smsDiscountPercentage;
  @override
  @JsonKey(name: "isEmailActive")
  bool? get isEmailActive;
  @override
  @JsonKey(name: "isEmailDiscountAvaliable")
  bool? get isEmailDiscountAvaliable;
  @override
  @JsonKey(name: "emailDiscountPercentage")
  int? get emailDiscountPercentage;
  @override
  @JsonKey(name: "isWhatsAppActive")
  bool? get isWhatsAppActive;
  @override
  @JsonKey(name: "isWhatsAppDiscountAvaliable")
  bool? get isWhatsAppDiscountAvaliable;
  @override
  @JsonKey(name: "wnMarketingDiscountPercentage")
  int? get wnMarketingDiscountPercentage;
  @override
  @JsonKey(name: "wnUtilityDiscountPercentage")
  int? get wnUtilityDiscountPercentage;
  @override
  @JsonKey(name: "wnServiceDiscountPercentage")
  int? get wnServiceDiscountPercentage;
  @override
  @JsonKey(name: "wnAuthenticationDiscountPercentage")
  int? get wnAuthenticationDiscountPercentage;
  @override
  @JsonKey(name: "priceDeductionMode")
  String? get priceDeductionMode;
  @override
  @JsonKey(name: "active")
  bool? get active;
  @override
  @JsonKey(name: "smsActive")
  bool? get smsActive;
  @override
  @JsonKey(name: "smsDiscountAvaliable")
  bool? get smsDiscountAvaliable;
  @override
  @JsonKey(name: "emailActive")
  bool? get emailActive;
  @override
  @JsonKey(name: "emailDiscountAvaliable")
  bool? get emailDiscountAvaliable;
  @override
  @JsonKey(name: "whatsAppActive")
  bool? get whatsAppActive;
  @override
  @JsonKey(name: "whatsAppDiscountAvaliable")
  bool? get whatsAppDiscountAvaliable;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationImplCopyWith<_$ApplicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "credits")
  double? get credits => throw _privateConstructorUsedError;
  @JsonKey(name: "lastRechargedCredit")
  double? get lastRechargedCredit => throw _privateConstructorUsedError;
  @JsonKey(name: "createdDateTime")
  DateTime? get createdDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedDateTime")
  DateTime? get updatedDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "credits") double? credits,
      @JsonKey(name: "lastRechargedCredit") double? lastRechargedCredit,
      @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") DateTime? updatedDateTime});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? credits = freezed,
    Object? lastRechargedCredit = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletImplCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$WalletImplCopyWith(
          _$WalletImpl value, $Res Function(_$WalletImpl) then) =
      __$$WalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "credits") double? credits,
      @JsonKey(name: "lastRechargedCredit") double? lastRechargedCredit,
      @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") DateTime? updatedDateTime});
}

/// @nodoc
class __$$WalletImplCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$WalletImpl>
    implements _$$WalletImplCopyWith<$Res> {
  __$$WalletImplCopyWithImpl(
      _$WalletImpl _value, $Res Function(_$WalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? credits = freezed,
    Object? lastRechargedCredit = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
  }) {
    return _then(_$WalletImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletImpl implements _Wallet {
  const _$WalletImpl(
      {@JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "credits") this.credits,
      @JsonKey(name: "lastRechargedCredit") this.lastRechargedCredit,
      @JsonKey(name: "createdDateTime") this.createdDateTime,
      @JsonKey(name: "updatedDateTime") this.updatedDateTime});

  factory _$WalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletImplFromJson(json);

  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "credits")
  final double? credits;
  @override
  @JsonKey(name: "lastRechargedCredit")
  final double? lastRechargedCredit;
  @override
  @JsonKey(name: "createdDateTime")
  final DateTime? createdDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  final DateTime? updatedDateTime;

  @override
  String toString() {
    return 'Wallet(customerId: $customerId, credits: $credits, lastRechargedCredit: $lastRechargedCredit, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.lastRechargedCredit, lastRechargedCredit) ||
                other.lastRechargedCredit == lastRechargedCredit) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, credits,
      lastRechargedCredit, createdDateTime, updatedDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      __$$WalletImplCopyWithImpl<_$WalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletImplToJson(
      this,
    );
  }
}

abstract class _Wallet implements Wallet {
  const factory _Wallet(
      {@JsonKey(name: "customerId") final String? customerId,
      @JsonKey(name: "credits") final double? credits,
      @JsonKey(name: "lastRechargedCredit") final double? lastRechargedCredit,
      @JsonKey(name: "createdDateTime") final DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime")
      final DateTime? updatedDateTime}) = _$WalletImpl;

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$WalletImpl.fromJson;

  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "credits")
  double? get credits;
  @override
  @JsonKey(name: "lastRechargedCredit")
  double? get lastRechargedCredit;
  @override
  @JsonKey(name: "createdDateTime")
  DateTime? get createdDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  DateTime? get updatedDateTime;
  @override
  @JsonKey(ignore: true)
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
