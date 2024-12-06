// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfirmPasswordDto _$ConfirmPasswordDtoFromJson(Map<String, dynamic> json) {
  return _ConfirmPasswordDto.fromJson(json);
}

/// @nodoc
mixin _$ConfirmPasswordDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfirmPasswordDtoCopyWith<ConfirmPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmPasswordDtoCopyWith<$Res> {
  factory $ConfirmPasswordDtoCopyWith(
          ConfirmPasswordDto value, $Res Function(ConfirmPasswordDto) then) =
      _$ConfirmPasswordDtoCopyWithImpl<$Res, ConfirmPasswordDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ConfirmPasswordDtoCopyWithImpl<$Res, $Val extends ConfirmPasswordDto>
    implements $ConfirmPasswordDtoCopyWith<$Res> {
  _$ConfirmPasswordDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$ConfirmPasswordDtoImplCopyWith<$Res>
    implements $ConfirmPasswordDtoCopyWith<$Res> {
  factory _$$ConfirmPasswordDtoImplCopyWith(_$ConfirmPasswordDtoImpl value,
          $Res Function(_$ConfirmPasswordDtoImpl) then) =
      __$$ConfirmPasswordDtoImplCopyWithImpl<$Res>;
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
class __$$ConfirmPasswordDtoImplCopyWithImpl<$Res>
    extends _$ConfirmPasswordDtoCopyWithImpl<$Res, _$ConfirmPasswordDtoImpl>
    implements _$$ConfirmPasswordDtoImplCopyWith<$Res> {
  __$$ConfirmPasswordDtoImplCopyWithImpl(_$ConfirmPasswordDtoImpl _value,
      $Res Function(_$ConfirmPasswordDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ConfirmPasswordDtoImpl(
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
class _$ConfirmPasswordDtoImpl implements _ConfirmPasswordDto {
  const _$ConfirmPasswordDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$ConfirmPasswordDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmPasswordDtoImplFromJson(json);

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
    return 'ConfirmPasswordDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPasswordDtoImpl &&
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
  _$$ConfirmPasswordDtoImplCopyWith<_$ConfirmPasswordDtoImpl> get copyWith =>
      __$$ConfirmPasswordDtoImplCopyWithImpl<_$ConfirmPasswordDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmPasswordDtoImplToJson(
      this,
    );
  }
}

abstract class _ConfirmPasswordDto implements ConfirmPasswordDto {
  const factory _ConfirmPasswordDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$ConfirmPasswordDtoImpl;

  factory _ConfirmPasswordDto.fromJson(Map<String, dynamic> json) =
      _$ConfirmPasswordDtoImpl.fromJson;

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
  _$$ConfirmPasswordDtoImplCopyWith<_$ConfirmPasswordDtoImpl> get copyWith =>
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
  dynamic get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "phoneCode")
  String? get phoneCode => throw _privateConstructorUsedError;
  @JsonKey(name: "phoneNo")
  String? get phoneNo => throw _privateConstructorUsedError;
  @JsonKey(name: "application")
  dynamic get application => throw _privateConstructorUsedError;
  @JsonKey(name: "wallet")
  dynamic get wallet => throw _privateConstructorUsedError;
  @JsonKey(name: "authToken")
  dynamic get authToken => throw _privateConstructorUsedError;
  @JsonKey(name: "createdDateTime")
  DateTime? get createdDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedDateTime")
  dynamic get updatedDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  dynamic get address => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  dynamic get city => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  dynamic get state => throw _privateConstructorUsedError;
  @JsonKey(name: "postalCode")
  dynamic get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  dynamic get country => throw _privateConstructorUsedError;
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
      @JsonKey(name: "lastName") dynamic lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "phoneCode") String? phoneCode,
      @JsonKey(name: "phoneNo") String? phoneNo,
      @JsonKey(name: "application") dynamic application,
      @JsonKey(name: "wallet") dynamic wallet,
      @JsonKey(name: "authToken") dynamic authToken,
      @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") dynamic updatedDateTime,
      @JsonKey(name: "address") dynamic address,
      @JsonKey(name: "city") dynamic city,
      @JsonKey(name: "state") dynamic state,
      @JsonKey(name: "postalCode") dynamic postalCode,
      @JsonKey(name: "country") dynamic country,
      @JsonKey(name: "newUser") bool? newUser,
      @JsonKey(name: "brandName") String? brandName});
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") dynamic lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "phoneCode") String? phoneCode,
      @JsonKey(name: "phoneNo") String? phoneNo,
      @JsonKey(name: "application") dynamic application,
      @JsonKey(name: "wallet") dynamic wallet,
      @JsonKey(name: "authToken") dynamic authToken,
      @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") dynamic updatedDateTime,
      @JsonKey(name: "address") dynamic address,
      @JsonKey(name: "city") dynamic city,
      @JsonKey(name: "state") dynamic state,
      @JsonKey(name: "postalCode") dynamic postalCode,
      @JsonKey(name: "country") dynamic country,
      @JsonKey(name: "newUser") bool? newUser,
      @JsonKey(name: "brandName") String? brandName});
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
      @JsonKey(name: "createdDateTime") this.createdDateTime,
      @JsonKey(name: "updatedDateTime") this.updatedDateTime,
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
  final dynamic lastName;
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
  final dynamic application;
  @override
  @JsonKey(name: "wallet")
  final dynamic wallet;
  @override
  @JsonKey(name: "authToken")
  final dynamic authToken;
  @override
  @JsonKey(name: "createdDateTime")
  final DateTime? createdDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  final dynamic updatedDateTime;
  @override
  @JsonKey(name: "address")
  final dynamic address;
  @override
  @JsonKey(name: "city")
  final dynamic city;
  @override
  @JsonKey(name: "state")
  final dynamic state;
  @override
  @JsonKey(name: "postalCode")
  final dynamic postalCode;
  @override
  @JsonKey(name: "country")
  final dynamic country;
  @override
  @JsonKey(name: "newUser")
  final bool? newUser;
  @override
  @JsonKey(name: "brandName")
  final String? brandName;

  @override
  String toString() {
    return 'Data(customerId: $customerId, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneCode: $phoneCode, phoneNo: $phoneNo, application: $application, wallet: $wallet, authToken: $authToken, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, newUser: $newUser, brandName: $brandName)';
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

  @JsonKey(ignore: true)
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
      @JsonKey(name: "lastName") final dynamic lastName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "password") final String? password,
      @JsonKey(name: "phoneCode") final String? phoneCode,
      @JsonKey(name: "phoneNo") final String? phoneNo,
      @JsonKey(name: "application") final dynamic application,
      @JsonKey(name: "wallet") final dynamic wallet,
      @JsonKey(name: "authToken") final dynamic authToken,
      @JsonKey(name: "createdDateTime") final DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") final dynamic updatedDateTime,
      @JsonKey(name: "address") final dynamic address,
      @JsonKey(name: "city") final dynamic city,
      @JsonKey(name: "state") final dynamic state,
      @JsonKey(name: "postalCode") final dynamic postalCode,
      @JsonKey(name: "country") final dynamic country,
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
  dynamic get lastName;
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
  dynamic get application;
  @override
  @JsonKey(name: "wallet")
  dynamic get wallet;
  @override
  @JsonKey(name: "authToken")
  dynamic get authToken;
  @override
  @JsonKey(name: "createdDateTime")
  DateTime? get createdDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  dynamic get updatedDateTime;
  @override
  @JsonKey(name: "address")
  dynamic get address;
  @override
  @JsonKey(name: "city")
  dynamic get city;
  @override
  @JsonKey(name: "state")
  dynamic get state;
  @override
  @JsonKey(name: "postalCode")
  dynamic get postalCode;
  @override
  @JsonKey(name: "country")
  dynamic get country;
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
