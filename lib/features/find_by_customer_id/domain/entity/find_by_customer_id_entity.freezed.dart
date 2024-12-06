// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_by_customer_id_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FindByCustomerIdEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  GetUserData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindByCustomerIdEntityCopyWith<FindByCustomerIdEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindByCustomerIdEntityCopyWith<$Res> {
  factory $FindByCustomerIdEntityCopyWith(FindByCustomerIdEntity value,
          $Res Function(FindByCustomerIdEntity) then) =
      _$FindByCustomerIdEntityCopyWithImpl<$Res, FindByCustomerIdEntity>;
  @useResult
  $Res call({int? responseCode, String? message, GetUserData? data});

  $GetUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FindByCustomerIdEntityCopyWithImpl<$Res,
        $Val extends FindByCustomerIdEntity>
    implements $FindByCustomerIdEntityCopyWith<$Res> {
  _$FindByCustomerIdEntityCopyWithImpl(this._value, this._then);

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
              as GetUserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetUserDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GetUserDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FindByCustomerIdEntityImplCopyWith<$Res>
    implements $FindByCustomerIdEntityCopyWith<$Res> {
  factory _$$FindByCustomerIdEntityImplCopyWith(
          _$FindByCustomerIdEntityImpl value,
          $Res Function(_$FindByCustomerIdEntityImpl) then) =
      __$$FindByCustomerIdEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, GetUserData? data});

  @override
  $GetUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$FindByCustomerIdEntityImplCopyWithImpl<$Res>
    extends _$FindByCustomerIdEntityCopyWithImpl<$Res,
        _$FindByCustomerIdEntityImpl>
    implements _$$FindByCustomerIdEntityImplCopyWith<$Res> {
  __$$FindByCustomerIdEntityImplCopyWithImpl(
      _$FindByCustomerIdEntityImpl _value,
      $Res Function(_$FindByCustomerIdEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FindByCustomerIdEntityImpl(
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
              as GetUserData?,
    ));
  }
}

/// @nodoc

class _$FindByCustomerIdEntityImpl implements _FindByCustomerIdEntity {
  const _$FindByCustomerIdEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final GetUserData? data;

  @override
  String toString() {
    return 'FindByCustomerIdEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindByCustomerIdEntityImpl &&
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
  _$$FindByCustomerIdEntityImplCopyWith<_$FindByCustomerIdEntityImpl>
      get copyWith => __$$FindByCustomerIdEntityImplCopyWithImpl<
          _$FindByCustomerIdEntityImpl>(this, _$identity);
}

abstract class _FindByCustomerIdEntity implements FindByCustomerIdEntity {
  const factory _FindByCustomerIdEntity(
      {final int? responseCode,
      final String? message,
      final GetUserData? data}) = _$FindByCustomerIdEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  GetUserData? get data;
  @override
  @JsonKey(ignore: true)
  _$$FindByCustomerIdEntityImplCopyWith<_$FindByCustomerIdEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetUserData {
  String? get customerId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get phoneCode => throw _privateConstructorUsedError;
  String? get phoneNo => throw _privateConstructorUsedError;
  String? get authToken => throw _privateConstructorUsedError;
  List<dynamic>? get createdDateTime => throw _privateConstructorUsedError;
  List<dynamic>? get updatedDateTime => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  bool? get newUser => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  WalletEntity? get wallet => throw _privateConstructorUsedError;
  ApplicationEntity? get application => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetUserDataCopyWith<GetUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserDataCopyWith<$Res> {
  factory $GetUserDataCopyWith(
          GetUserData value, $Res Function(GetUserData) then) =
      _$GetUserDataCopyWithImpl<$Res, GetUserData>;
  @useResult
  $Res call(
      {String? customerId,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phoneCode,
      String? phoneNo,
      String? authToken,
      List<dynamic>? createdDateTime,
      List<dynamic>? updatedDateTime,
      String? address,
      String? city,
      String? state,
      String? postalCode,
      String? country,
      bool? newUser,
      String? brandName,
      WalletEntity? wallet,
      ApplicationEntity? application});

  $WalletEntityCopyWith<$Res>? get wallet;
  $ApplicationEntityCopyWith<$Res>? get application;
}

/// @nodoc
class _$GetUserDataCopyWithImpl<$Res, $Val extends GetUserData>
    implements $GetUserDataCopyWith<$Res> {
  _$GetUserDataCopyWithImpl(this._value, this._then);

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
    Object? wallet = freezed,
    Object? application = freezed,
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
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletEntityCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletEntityCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationEntityCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $ApplicationEntityCopyWith<$Res>(_value.application!, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserDataImplCopyWith<$Res>
    implements $GetUserDataCopyWith<$Res> {
  factory _$$GetUserDataImplCopyWith(
          _$GetUserDataImpl value, $Res Function(_$GetUserDataImpl) then) =
      __$$GetUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customerId,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phoneCode,
      String? phoneNo,
      String? authToken,
      List<dynamic>? createdDateTime,
      List<dynamic>? updatedDateTime,
      String? address,
      String? city,
      String? state,
      String? postalCode,
      String? country,
      bool? newUser,
      String? brandName,
      WalletEntity? wallet,
      ApplicationEntity? application});

  @override
  $WalletEntityCopyWith<$Res>? get wallet;
  @override
  $ApplicationEntityCopyWith<$Res>? get application;
}

/// @nodoc
class __$$GetUserDataImplCopyWithImpl<$Res>
    extends _$GetUserDataCopyWithImpl<$Res, _$GetUserDataImpl>
    implements _$$GetUserDataImplCopyWith<$Res> {
  __$$GetUserDataImplCopyWithImpl(
      _$GetUserDataImpl _value, $Res Function(_$GetUserDataImpl) _then)
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
    Object? wallet = freezed,
    Object? application = freezed,
  }) {
    return _then(_$GetUserDataImpl(
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
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _value._createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      updatedDateTime: freezed == updatedDateTime
          ? _value._updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationEntity?,
    ));
  }
}

/// @nodoc

class _$GetUserDataImpl implements _GetUserData {
  const _$GetUserDataImpl(
      {this.customerId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneCode,
      this.phoneNo,
      this.authToken,
      final List<dynamic>? createdDateTime,
      final List<dynamic>? updatedDateTime,
      this.address,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.newUser,
      this.brandName,
      this.wallet,
      this.application})
      : _createdDateTime = createdDateTime,
        _updatedDateTime = updatedDateTime;

  @override
  final String? customerId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phoneCode;
  @override
  final String? phoneNo;
  @override
  final String? authToken;
  final List<dynamic>? _createdDateTime;
  @override
  List<dynamic>? get createdDateTime {
    final value = _createdDateTime;
    if (value == null) return null;
    if (_createdDateTime is EqualUnmodifiableListView) return _createdDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _updatedDateTime;
  @override
  List<dynamic>? get updatedDateTime {
    final value = _updatedDateTime;
    if (value == null) return null;
    if (_updatedDateTime is EqualUnmodifiableListView) return _updatedDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? postalCode;
  @override
  final String? country;
  @override
  final bool? newUser;
  @override
  final String? brandName;
  @override
  final WalletEntity? wallet;
  @override
  final ApplicationEntity? application;

  @override
  String toString() {
    return 'GetUserData(customerId: $customerId, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneCode: $phoneCode, phoneNo: $phoneNo, authToken: $authToken, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, address: $address, city: $city, state: $state, postalCode: $postalCode, country: $country, newUser: $newUser, brandName: $brandName, wallet: $wallet, application: $application)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserDataImpl &&
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
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            const DeepCollectionEquality()
                .equals(other._createdDateTime, _createdDateTime) &&
            const DeepCollectionEquality()
                .equals(other._updatedDateTime, _updatedDateTime) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.newUser, newUser) || other.newUser == newUser) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.application, application) ||
                other.application == application));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerId,
        firstName,
        lastName,
        email,
        password,
        phoneCode,
        phoneNo,
        authToken,
        const DeepCollectionEquality().hash(_createdDateTime),
        const DeepCollectionEquality().hash(_updatedDateTime),
        address,
        city,
        state,
        postalCode,
        country,
        newUser,
        brandName,
        wallet,
        application
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      __$$GetUserDataImplCopyWithImpl<_$GetUserDataImpl>(this, _$identity);
}

abstract class _GetUserData implements GetUserData {
  const factory _GetUserData(
      {final String? customerId,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? password,
      final String? phoneCode,
      final String? phoneNo,
      final String? authToken,
      final List<dynamic>? createdDateTime,
      final List<dynamic>? updatedDateTime,
      final String? address,
      final String? city,
      final String? state,
      final String? postalCode,
      final String? country,
      final bool? newUser,
      final String? brandName,
      final WalletEntity? wallet,
      final ApplicationEntity? application}) = _$GetUserDataImpl;

  @override
  String? get customerId;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get phoneCode;
  @override
  String? get phoneNo;
  @override
  String? get authToken;
  @override
  List<dynamic>? get createdDateTime;
  @override
  List<dynamic>? get updatedDateTime;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get postalCode;
  @override
  String? get country;
  @override
  bool? get newUser;
  @override
  String? get brandName;
  @override
  WalletEntity? get wallet;
  @override
  ApplicationEntity? get application;
  @override
  @JsonKey(ignore: true)
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ApplicationEntity {
  String? get customerId => throw _privateConstructorUsedError;
  String? get clientId => throw _privateConstructorUsedError;
  String? get apiKey => throw _privateConstructorUsedError;
  List<dynamic>? get createdDateTime => throw _privateConstructorUsedError;
  List<dynamic>? get updatedDateTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get displayAppName => throw _privateConstructorUsedError;
  String? get otpLength => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isSmsActive => throw _privateConstructorUsedError;
  bool? get isSmsDiscountAvailable => throw _privateConstructorUsedError;
  String? get clientIdSms => throw _privateConstructorUsedError;
  String? get apiKeySms => throw _privateConstructorUsedError;
  String? get senderIdSms => throw _privateConstructorUsedError;
  int? get smsDiscountPercentage => throw _privateConstructorUsedError;
  bool? get isEmailActive => throw _privateConstructorUsedError;
  bool? get isEmailDiscountAvailable => throw _privateConstructorUsedError;
  int? get emailDiscountPercentage => throw _privateConstructorUsedError;
  bool? get isWhatsAppActive => throw _privateConstructorUsedError;
  bool? get isWhatsAppDiscountAvailable => throw _privateConstructorUsedError;
  int? get wnMarketingDiscountPercentage => throw _privateConstructorUsedError;
  int? get wnUtilityDiscountPercentage => throw _privateConstructorUsedError;
  int? get wnServiceDiscountPercentage => throw _privateConstructorUsedError;
  int? get wnAuthenticationDiscountPercentage =>
      throw _privateConstructorUsedError;
  String? get priceDeductionMode => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  bool? get smsActive => throw _privateConstructorUsedError;
  bool? get smsDiscountAvailable => throw _privateConstructorUsedError;
  bool? get emailActive => throw _privateConstructorUsedError;
  bool? get emailDiscountAvailable => throw _privateConstructorUsedError;
  bool? get whatsAppActive => throw _privateConstructorUsedError;
  bool? get whatsAppDiscountAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationEntityCopyWith<ApplicationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationEntityCopyWith<$Res> {
  factory $ApplicationEntityCopyWith(
          ApplicationEntity value, $Res Function(ApplicationEntity) then) =
      _$ApplicationEntityCopyWithImpl<$Res, ApplicationEntity>;
  @useResult
  $Res call(
      {String? customerId,
      String? clientId,
      String? apiKey,
      List<dynamic>? createdDateTime,
      List<dynamic>? updatedDateTime,
      String? description,
      String? displayAppName,
      String? otpLength,
      bool? isActive,
      bool? isSmsActive,
      bool? isSmsDiscountAvailable,
      String? clientIdSms,
      String? apiKeySms,
      String? senderIdSms,
      int? smsDiscountPercentage,
      bool? isEmailActive,
      bool? isEmailDiscountAvailable,
      int? emailDiscountPercentage,
      bool? isWhatsAppActive,
      bool? isWhatsAppDiscountAvailable,
      int? wnMarketingDiscountPercentage,
      int? wnUtilityDiscountPercentage,
      int? wnServiceDiscountPercentage,
      int? wnAuthenticationDiscountPercentage,
      String? priceDeductionMode,
      bool? active,
      bool? smsActive,
      bool? smsDiscountAvailable,
      bool? emailActive,
      bool? emailDiscountAvailable,
      bool? whatsAppActive,
      bool? whatsAppDiscountAvailable});
}

/// @nodoc
class _$ApplicationEntityCopyWithImpl<$Res, $Val extends ApplicationEntity>
    implements $ApplicationEntityCopyWith<$Res> {
  _$ApplicationEntityCopyWithImpl(this._value, this._then);

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
    Object? isSmsDiscountAvailable = freezed,
    Object? clientIdSms = freezed,
    Object? apiKeySms = freezed,
    Object? senderIdSms = freezed,
    Object? smsDiscountPercentage = freezed,
    Object? isEmailActive = freezed,
    Object? isEmailDiscountAvailable = freezed,
    Object? emailDiscountPercentage = freezed,
    Object? isWhatsAppActive = freezed,
    Object? isWhatsAppDiscountAvailable = freezed,
    Object? wnMarketingDiscountPercentage = freezed,
    Object? wnUtilityDiscountPercentage = freezed,
    Object? wnServiceDiscountPercentage = freezed,
    Object? wnAuthenticationDiscountPercentage = freezed,
    Object? priceDeductionMode = freezed,
    Object? active = freezed,
    Object? smsActive = freezed,
    Object? smsDiscountAvailable = freezed,
    Object? emailActive = freezed,
    Object? emailDiscountAvailable = freezed,
    Object? whatsAppActive = freezed,
    Object? whatsAppDiscountAvailable = freezed,
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
              as String?,
      displayAppName: freezed == displayAppName
          ? _value.displayAppName
          : displayAppName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isSmsDiscountAvailable: freezed == isSmsDiscountAvailable
          ? _value.isSmsDiscountAvailable
          : isSmsDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientIdSms: freezed == clientIdSms
          ? _value.clientIdSms
          : clientIdSms // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKeySms: freezed == apiKeySms
          ? _value.apiKeySms
          : apiKeySms // ignore: cast_nullable_to_non_nullable
              as String?,
      senderIdSms: freezed == senderIdSms
          ? _value.senderIdSms
          : senderIdSms // ignore: cast_nullable_to_non_nullable
              as String?,
      smsDiscountPercentage: freezed == smsDiscountPercentage
          ? _value.smsDiscountPercentage
          : smsDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailActive: freezed == isEmailActive
          ? _value.isEmailActive
          : isEmailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailDiscountAvailable: freezed == isEmailDiscountAvailable
          ? _value.isEmailDiscountAvailable
          : isEmailDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountPercentage: freezed == emailDiscountPercentage
          ? _value.emailDiscountPercentage
          : emailDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isWhatsAppActive: freezed == isWhatsAppActive
          ? _value.isWhatsAppActive
          : isWhatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWhatsAppDiscountAvailable: freezed == isWhatsAppDiscountAvailable
          ? _value.isWhatsAppDiscountAvailable
          : isWhatsAppDiscountAvailable // ignore: cast_nullable_to_non_nullable
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
      smsDiscountAvailable: freezed == smsDiscountAvailable
          ? _value.smsDiscountAvailable
          : smsDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailActive: freezed == emailActive
          ? _value.emailActive
          : emailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountAvailable: freezed == emailDiscountAvailable
          ? _value.emailDiscountAvailable
          : emailDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppActive: freezed == whatsAppActive
          ? _value.whatsAppActive
          : whatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppDiscountAvailable: freezed == whatsAppDiscountAvailable
          ? _value.whatsAppDiscountAvailable
          : whatsAppDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationEntityImplCopyWith<$Res>
    implements $ApplicationEntityCopyWith<$Res> {
  factory _$$ApplicationEntityImplCopyWith(_$ApplicationEntityImpl value,
          $Res Function(_$ApplicationEntityImpl) then) =
      __$$ApplicationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customerId,
      String? clientId,
      String? apiKey,
      List<dynamic>? createdDateTime,
      List<dynamic>? updatedDateTime,
      String? description,
      String? displayAppName,
      String? otpLength,
      bool? isActive,
      bool? isSmsActive,
      bool? isSmsDiscountAvailable,
      String? clientIdSms,
      String? apiKeySms,
      String? senderIdSms,
      int? smsDiscountPercentage,
      bool? isEmailActive,
      bool? isEmailDiscountAvailable,
      int? emailDiscountPercentage,
      bool? isWhatsAppActive,
      bool? isWhatsAppDiscountAvailable,
      int? wnMarketingDiscountPercentage,
      int? wnUtilityDiscountPercentage,
      int? wnServiceDiscountPercentage,
      int? wnAuthenticationDiscountPercentage,
      String? priceDeductionMode,
      bool? active,
      bool? smsActive,
      bool? smsDiscountAvailable,
      bool? emailActive,
      bool? emailDiscountAvailable,
      bool? whatsAppActive,
      bool? whatsAppDiscountAvailable});
}

/// @nodoc
class __$$ApplicationEntityImplCopyWithImpl<$Res>
    extends _$ApplicationEntityCopyWithImpl<$Res, _$ApplicationEntityImpl>
    implements _$$ApplicationEntityImplCopyWith<$Res> {
  __$$ApplicationEntityImplCopyWithImpl(_$ApplicationEntityImpl _value,
      $Res Function(_$ApplicationEntityImpl) _then)
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
    Object? isSmsDiscountAvailable = freezed,
    Object? clientIdSms = freezed,
    Object? apiKeySms = freezed,
    Object? senderIdSms = freezed,
    Object? smsDiscountPercentage = freezed,
    Object? isEmailActive = freezed,
    Object? isEmailDiscountAvailable = freezed,
    Object? emailDiscountPercentage = freezed,
    Object? isWhatsAppActive = freezed,
    Object? isWhatsAppDiscountAvailable = freezed,
    Object? wnMarketingDiscountPercentage = freezed,
    Object? wnUtilityDiscountPercentage = freezed,
    Object? wnServiceDiscountPercentage = freezed,
    Object? wnAuthenticationDiscountPercentage = freezed,
    Object? priceDeductionMode = freezed,
    Object? active = freezed,
    Object? smsActive = freezed,
    Object? smsDiscountAvailable = freezed,
    Object? emailActive = freezed,
    Object? emailDiscountAvailable = freezed,
    Object? whatsAppActive = freezed,
    Object? whatsAppDiscountAvailable = freezed,
  }) {
    return _then(_$ApplicationEntityImpl(
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
              as String?,
      displayAppName: freezed == displayAppName
          ? _value.displayAppName
          : displayAppName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isSmsDiscountAvailable: freezed == isSmsDiscountAvailable
          ? _value.isSmsDiscountAvailable
          : isSmsDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientIdSms: freezed == clientIdSms
          ? _value.clientIdSms
          : clientIdSms // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKeySms: freezed == apiKeySms
          ? _value.apiKeySms
          : apiKeySms // ignore: cast_nullable_to_non_nullable
              as String?,
      senderIdSms: freezed == senderIdSms
          ? _value.senderIdSms
          : senderIdSms // ignore: cast_nullable_to_non_nullable
              as String?,
      smsDiscountPercentage: freezed == smsDiscountPercentage
          ? _value.smsDiscountPercentage
          : smsDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailActive: freezed == isEmailActive
          ? _value.isEmailActive
          : isEmailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEmailDiscountAvailable: freezed == isEmailDiscountAvailable
          ? _value.isEmailDiscountAvailable
          : isEmailDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountPercentage: freezed == emailDiscountPercentage
          ? _value.emailDiscountPercentage
          : emailDiscountPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      isWhatsAppActive: freezed == isWhatsAppActive
          ? _value.isWhatsAppActive
          : isWhatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWhatsAppDiscountAvailable: freezed == isWhatsAppDiscountAvailable
          ? _value.isWhatsAppDiscountAvailable
          : isWhatsAppDiscountAvailable // ignore: cast_nullable_to_non_nullable
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
      smsDiscountAvailable: freezed == smsDiscountAvailable
          ? _value.smsDiscountAvailable
          : smsDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailActive: freezed == emailActive
          ? _value.emailActive
          : emailActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailDiscountAvailable: freezed == emailDiscountAvailable
          ? _value.emailDiscountAvailable
          : emailDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppActive: freezed == whatsAppActive
          ? _value.whatsAppActive
          : whatsAppActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      whatsAppDiscountAvailable: freezed == whatsAppDiscountAvailable
          ? _value.whatsAppDiscountAvailable
          : whatsAppDiscountAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ApplicationEntityImpl implements _ApplicationEntity {
  const _$ApplicationEntityImpl(
      {this.customerId,
      this.clientId,
      this.apiKey,
      final List<dynamic>? createdDateTime,
      final List<dynamic>? updatedDateTime,
      this.description,
      this.displayAppName,
      this.otpLength,
      this.isActive,
      this.isSmsActive,
      this.isSmsDiscountAvailable,
      this.clientIdSms,
      this.apiKeySms,
      this.senderIdSms,
      this.smsDiscountPercentage,
      this.isEmailActive,
      this.isEmailDiscountAvailable,
      this.emailDiscountPercentage,
      this.isWhatsAppActive,
      this.isWhatsAppDiscountAvailable,
      this.wnMarketingDiscountPercentage,
      this.wnUtilityDiscountPercentage,
      this.wnServiceDiscountPercentage,
      this.wnAuthenticationDiscountPercentage,
      this.priceDeductionMode,
      this.active,
      this.smsActive,
      this.smsDiscountAvailable,
      this.emailActive,
      this.emailDiscountAvailable,
      this.whatsAppActive,
      this.whatsAppDiscountAvailable})
      : _createdDateTime = createdDateTime,
        _updatedDateTime = updatedDateTime;

  @override
  final String? customerId;
  @override
  final String? clientId;
  @override
  final String? apiKey;
  final List<dynamic>? _createdDateTime;
  @override
  List<dynamic>? get createdDateTime {
    final value = _createdDateTime;
    if (value == null) return null;
    if (_createdDateTime is EqualUnmodifiableListView) return _createdDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _updatedDateTime;
  @override
  List<dynamic>? get updatedDateTime {
    final value = _updatedDateTime;
    if (value == null) return null;
    if (_updatedDateTime is EqualUnmodifiableListView) return _updatedDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  @override
  final String? displayAppName;
  @override
  final String? otpLength;
  @override
  final bool? isActive;
  @override
  final bool? isSmsActive;
  @override
  final bool? isSmsDiscountAvailable;
  @override
  final String? clientIdSms;
  @override
  final String? apiKeySms;
  @override
  final String? senderIdSms;
  @override
  final int? smsDiscountPercentage;
  @override
  final bool? isEmailActive;
  @override
  final bool? isEmailDiscountAvailable;
  @override
  final int? emailDiscountPercentage;
  @override
  final bool? isWhatsAppActive;
  @override
  final bool? isWhatsAppDiscountAvailable;
  @override
  final int? wnMarketingDiscountPercentage;
  @override
  final int? wnUtilityDiscountPercentage;
  @override
  final int? wnServiceDiscountPercentage;
  @override
  final int? wnAuthenticationDiscountPercentage;
  @override
  final String? priceDeductionMode;
  @override
  final bool? active;
  @override
  final bool? smsActive;
  @override
  final bool? smsDiscountAvailable;
  @override
  final bool? emailActive;
  @override
  final bool? emailDiscountAvailable;
  @override
  final bool? whatsAppActive;
  @override
  final bool? whatsAppDiscountAvailable;

  @override
  String toString() {
    return 'ApplicationEntity(customerId: $customerId, clientId: $clientId, apiKey: $apiKey, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, description: $description, displayAppName: $displayAppName, otpLength: $otpLength, isActive: $isActive, isSmsActive: $isSmsActive, isSmsDiscountAvailable: $isSmsDiscountAvailable, clientIdSms: $clientIdSms, apiKeySms: $apiKeySms, senderIdSms: $senderIdSms, smsDiscountPercentage: $smsDiscountPercentage, isEmailActive: $isEmailActive, isEmailDiscountAvailable: $isEmailDiscountAvailable, emailDiscountPercentage: $emailDiscountPercentage, isWhatsAppActive: $isWhatsAppActive, isWhatsAppDiscountAvailable: $isWhatsAppDiscountAvailable, wnMarketingDiscountPercentage: $wnMarketingDiscountPercentage, wnUtilityDiscountPercentage: $wnUtilityDiscountPercentage, wnServiceDiscountPercentage: $wnServiceDiscountPercentage, wnAuthenticationDiscountPercentage: $wnAuthenticationDiscountPercentage, priceDeductionMode: $priceDeductionMode, active: $active, smsActive: $smsActive, smsDiscountAvailable: $smsDiscountAvailable, emailActive: $emailActive, emailDiscountAvailable: $emailDiscountAvailable, whatsAppActive: $whatsAppActive, whatsAppDiscountAvailable: $whatsAppDiscountAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationEntityImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            const DeepCollectionEquality()
                .equals(other._createdDateTime, _createdDateTime) &&
            const DeepCollectionEquality()
                .equals(other._updatedDateTime, _updatedDateTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.displayAppName, displayAppName) ||
                other.displayAppName == displayAppName) &&
            (identical(other.otpLength, otpLength) ||
                other.otpLength == otpLength) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSmsActive, isSmsActive) ||
                other.isSmsActive == isSmsActive) &&
            (identical(other.isSmsDiscountAvailable, isSmsDiscountAvailable) ||
                other.isSmsDiscountAvailable == isSmsDiscountAvailable) &&
            (identical(other.clientIdSms, clientIdSms) ||
                other.clientIdSms == clientIdSms) &&
            (identical(other.apiKeySms, apiKeySms) ||
                other.apiKeySms == apiKeySms) &&
            (identical(other.senderIdSms, senderIdSms) ||
                other.senderIdSms == senderIdSms) &&
            (identical(other.smsDiscountPercentage, smsDiscountPercentage) ||
                other.smsDiscountPercentage == smsDiscountPercentage) &&
            (identical(other.isEmailActive, isEmailActive) ||
                other.isEmailActive == isEmailActive) &&
            (identical(other.isEmailDiscountAvailable, isEmailDiscountAvailable) ||
                other.isEmailDiscountAvailable == isEmailDiscountAvailable) &&
            (identical(other.emailDiscountPercentage, emailDiscountPercentage) ||
                other.emailDiscountPercentage == emailDiscountPercentage) &&
            (identical(other.isWhatsAppActive, isWhatsAppActive) ||
                other.isWhatsAppActive == isWhatsAppActive) &&
            (identical(other.isWhatsAppDiscountAvailable, isWhatsAppDiscountAvailable) ||
                other.isWhatsAppDiscountAvailable ==
                    isWhatsAppDiscountAvailable) &&
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
            (identical(other.smsDiscountAvailable, smsDiscountAvailable) ||
                other.smsDiscountAvailable == smsDiscountAvailable) &&
            (identical(other.emailActive, emailActive) ||
                other.emailActive == emailActive) &&
            (identical(other.emailDiscountAvailable, emailDiscountAvailable) || other.emailDiscountAvailable == emailDiscountAvailable) &&
            (identical(other.whatsAppActive, whatsAppActive) || other.whatsAppActive == whatsAppActive) &&
            (identical(other.whatsAppDiscountAvailable, whatsAppDiscountAvailable) || other.whatsAppDiscountAvailable == whatsAppDiscountAvailable));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerId,
        clientId,
        apiKey,
        const DeepCollectionEquality().hash(_createdDateTime),
        const DeepCollectionEquality().hash(_updatedDateTime),
        description,
        displayAppName,
        otpLength,
        isActive,
        isSmsActive,
        isSmsDiscountAvailable,
        clientIdSms,
        apiKeySms,
        senderIdSms,
        smsDiscountPercentage,
        isEmailActive,
        isEmailDiscountAvailable,
        emailDiscountPercentage,
        isWhatsAppActive,
        isWhatsAppDiscountAvailable,
        wnMarketingDiscountPercentage,
        wnUtilityDiscountPercentage,
        wnServiceDiscountPercentage,
        wnAuthenticationDiscountPercentage,
        priceDeductionMode,
        active,
        smsActive,
        smsDiscountAvailable,
        emailActive,
        emailDiscountAvailable,
        whatsAppActive,
        whatsAppDiscountAvailable
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationEntityImplCopyWith<_$ApplicationEntityImpl> get copyWith =>
      __$$ApplicationEntityImplCopyWithImpl<_$ApplicationEntityImpl>(
          this, _$identity);
}

abstract class _ApplicationEntity implements ApplicationEntity {
  const factory _ApplicationEntity(
      {final String? customerId,
      final String? clientId,
      final String? apiKey,
      final List<dynamic>? createdDateTime,
      final List<dynamic>? updatedDateTime,
      final String? description,
      final String? displayAppName,
      final String? otpLength,
      final bool? isActive,
      final bool? isSmsActive,
      final bool? isSmsDiscountAvailable,
      final String? clientIdSms,
      final String? apiKeySms,
      final String? senderIdSms,
      final int? smsDiscountPercentage,
      final bool? isEmailActive,
      final bool? isEmailDiscountAvailable,
      final int? emailDiscountPercentage,
      final bool? isWhatsAppActive,
      final bool? isWhatsAppDiscountAvailable,
      final int? wnMarketingDiscountPercentage,
      final int? wnUtilityDiscountPercentage,
      final int? wnServiceDiscountPercentage,
      final int? wnAuthenticationDiscountPercentage,
      final String? priceDeductionMode,
      final bool? active,
      final bool? smsActive,
      final bool? smsDiscountAvailable,
      final bool? emailActive,
      final bool? emailDiscountAvailable,
      final bool? whatsAppActive,
      final bool? whatsAppDiscountAvailable}) = _$ApplicationEntityImpl;

  @override
  String? get customerId;
  @override
  String? get clientId;
  @override
  String? get apiKey;
  @override
  List<dynamic>? get createdDateTime;
  @override
  List<dynamic>? get updatedDateTime;
  @override
  String? get description;
  @override
  String? get displayAppName;
  @override
  String? get otpLength;
  @override
  bool? get isActive;
  @override
  bool? get isSmsActive;
  @override
  bool? get isSmsDiscountAvailable;
  @override
  String? get clientIdSms;
  @override
  String? get apiKeySms;
  @override
  String? get senderIdSms;
  @override
  int? get smsDiscountPercentage;
  @override
  bool? get isEmailActive;
  @override
  bool? get isEmailDiscountAvailable;
  @override
  int? get emailDiscountPercentage;
  @override
  bool? get isWhatsAppActive;
  @override
  bool? get isWhatsAppDiscountAvailable;
  @override
  int? get wnMarketingDiscountPercentage;
  @override
  int? get wnUtilityDiscountPercentage;
  @override
  int? get wnServiceDiscountPercentage;
  @override
  int? get wnAuthenticationDiscountPercentage;
  @override
  String? get priceDeductionMode;
  @override
  bool? get active;
  @override
  bool? get smsActive;
  @override
  bool? get smsDiscountAvailable;
  @override
  bool? get emailActive;
  @override
  bool? get emailDiscountAvailable;
  @override
  bool? get whatsAppActive;
  @override
  bool? get whatsAppDiscountAvailable;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationEntityImplCopyWith<_$ApplicationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WalletEntity {
  double? get credits => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  double? get lastRechargedCredit => throw _privateConstructorUsedError;
  DateTime? get updatedDateTime => throw _privateConstructorUsedError;
  DateTime? get createdDateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletEntityCopyWith<WalletEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEntityCopyWith<$Res> {
  factory $WalletEntityCopyWith(
          WalletEntity value, $Res Function(WalletEntity) then) =
      _$WalletEntityCopyWithImpl<$Res, WalletEntity>;
  @useResult
  $Res call(
      {double? credits,
      String? customerId,
      double? lastRechargedCredit,
      DateTime? updatedDateTime,
      DateTime? createdDateTime});
}

/// @nodoc
class _$WalletEntityCopyWithImpl<$Res, $Val extends WalletEntity>
    implements $WalletEntityCopyWith<$Res> {
  _$WalletEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credits = freezed,
    Object? customerId = freezed,
    Object? lastRechargedCredit = freezed,
    Object? updatedDateTime = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletEntityImplCopyWith<$Res>
    implements $WalletEntityCopyWith<$Res> {
  factory _$$WalletEntityImplCopyWith(
          _$WalletEntityImpl value, $Res Function(_$WalletEntityImpl) then) =
      __$$WalletEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? credits,
      String? customerId,
      double? lastRechargedCredit,
      DateTime? updatedDateTime,
      DateTime? createdDateTime});
}

/// @nodoc
class __$$WalletEntityImplCopyWithImpl<$Res>
    extends _$WalletEntityCopyWithImpl<$Res, _$WalletEntityImpl>
    implements _$$WalletEntityImplCopyWith<$Res> {
  __$$WalletEntityImplCopyWithImpl(
      _$WalletEntityImpl _value, $Res Function(_$WalletEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credits = freezed,
    Object? customerId = freezed,
    Object? lastRechargedCredit = freezed,
    Object? updatedDateTime = freezed,
    Object? createdDateTime = freezed,
  }) {
    return _then(_$WalletEntityImpl(
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$WalletEntityImpl implements _WalletEntity {
  const _$WalletEntityImpl(
      {this.credits,
      this.customerId,
      this.lastRechargedCredit,
      this.updatedDateTime,
      this.createdDateTime});

  @override
  final double? credits;
  @override
  final String? customerId;
  @override
  final double? lastRechargedCredit;
  @override
  final DateTime? updatedDateTime;
  @override
  final DateTime? createdDateTime;

  @override
  String toString() {
    return 'WalletEntity(credits: $credits, customerId: $customerId, lastRechargedCredit: $lastRechargedCredit, updatedDateTime: $updatedDateTime, createdDateTime: $createdDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEntityImpl &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.lastRechargedCredit, lastRechargedCredit) ||
                other.lastRechargedCredit == lastRechargedCredit) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, credits, customerId,
      lastRechargedCredit, updatedDateTime, createdDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEntityImplCopyWith<_$WalletEntityImpl> get copyWith =>
      __$$WalletEntityImplCopyWithImpl<_$WalletEntityImpl>(this, _$identity);
}

abstract class _WalletEntity implements WalletEntity {
  const factory _WalletEntity(
      {final double? credits,
      final String? customerId,
      final double? lastRechargedCredit,
      final DateTime? updatedDateTime,
      final DateTime? createdDateTime}) = _$WalletEntityImpl;

  @override
  double? get credits;
  @override
  String? get customerId;
  @override
  double? get lastRechargedCredit;
  @override
  DateTime? get updatedDateTime;
  @override
  DateTime? get createdDateTime;
  @override
  @JsonKey(ignore: true)
  _$$WalletEntityImplCopyWith<_$WalletEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
