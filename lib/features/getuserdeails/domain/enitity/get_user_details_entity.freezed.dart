// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetUserDetailsEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  GetUserData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetUserDetailsEntityCopyWith<GetUserDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserDetailsEntityCopyWith<$Res> {
  factory $GetUserDetailsEntityCopyWith(GetUserDetailsEntity value,
          $Res Function(GetUserDetailsEntity) then) =
      _$GetUserDetailsEntityCopyWithImpl<$Res, GetUserDetailsEntity>;
  @useResult
  $Res call({int? responseCode, String? message, GetUserData? data});

  $GetUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetUserDetailsEntityCopyWithImpl<$Res,
        $Val extends GetUserDetailsEntity>
    implements $GetUserDetailsEntityCopyWith<$Res> {
  _$GetUserDetailsEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$GetUserDetailsEntityImplCopyWith<$Res>
    implements $GetUserDetailsEntityCopyWith<$Res> {
  factory _$$GetUserDetailsEntityImplCopyWith(_$GetUserDetailsEntityImpl value,
          $Res Function(_$GetUserDetailsEntityImpl) then) =
      __$$GetUserDetailsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, GetUserData? data});

  @override
  $GetUserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetUserDetailsEntityImplCopyWithImpl<$Res>
    extends _$GetUserDetailsEntityCopyWithImpl<$Res, _$GetUserDetailsEntityImpl>
    implements _$$GetUserDetailsEntityImplCopyWith<$Res> {
  __$$GetUserDetailsEntityImplCopyWithImpl(_$GetUserDetailsEntityImpl _value,
      $Res Function(_$GetUserDetailsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetUserDetailsEntityImpl(
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

class _$GetUserDetailsEntityImpl implements _GetUserDetailsEntity {
  const _$GetUserDetailsEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final GetUserData? data;

  @override
  String toString() {
    return 'GetUserDetailsEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserDetailsEntityImpl &&
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
  _$$GetUserDetailsEntityImplCopyWith<_$GetUserDetailsEntityImpl>
      get copyWith =>
          __$$GetUserDetailsEntityImplCopyWithImpl<_$GetUserDetailsEntityImpl>(
              this, _$identity);
}

abstract class _GetUserDetailsEntity implements GetUserDetailsEntity {
  const factory _GetUserDetailsEntity(
      {final int? responseCode,
      final String? message,
      final GetUserData? data}) = _$GetUserDetailsEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  GetUserData? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetUserDetailsEntityImplCopyWith<_$GetUserDetailsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetUserData {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  WalletEntity? get wallet => throw _privateConstructorUsedError;
  SubscriptionEntity? get subscription => throw _privateConstructorUsedError;

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
      {String? firstName,
      String? lastName,
      String? countryCode,
      String? phone,
      String? email,
      WalletEntity? wallet,
      SubscriptionEntity? subscription});

  $WalletEntityCopyWith<$Res>? get wallet;
  $SubscriptionEntityCopyWith<$Res>? get subscription;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? countryCode = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? wallet = freezed,
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionEntity?,
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
  $SubscriptionEntityCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $SubscriptionEntityCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
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
      {String? firstName,
      String? lastName,
      String? countryCode,
      String? phone,
      String? email,
      WalletEntity? wallet,
      SubscriptionEntity? subscription});

  @override
  $WalletEntityCopyWith<$Res>? get wallet;
  @override
  $SubscriptionEntityCopyWith<$Res>? get subscription;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? countryCode = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? wallet = freezed,
    Object? subscription = freezed,
  }) {
    return _then(_$GetUserDataImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletEntity?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionEntity?,
    ));
  }
}

/// @nodoc

class _$GetUserDataImpl implements _GetUserData {
  const _$GetUserDataImpl(
      {this.firstName,
      this.lastName,
      this.countryCode,
      this.phone,
      this.email,
      this.wallet,
      this.subscription});

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? countryCode;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final WalletEntity? wallet;
  @override
  final SubscriptionEntity? subscription;

  @override
  String toString() {
    return 'GetUserData(firstName: $firstName, lastName: $lastName, countryCode: $countryCode, phone: $phone, email: $email, wallet: $wallet, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserDataImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, countryCode,
      phone, email, wallet, subscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      __$$GetUserDataImplCopyWithImpl<_$GetUserDataImpl>(this, _$identity);
}

abstract class _GetUserData implements GetUserData {
  const factory _GetUserData(
      {final String? firstName,
      final String? lastName,
      final String? countryCode,
      final String? phone,
      final String? email,
      final WalletEntity? wallet,
      final SubscriptionEntity? subscription}) = _$GetUserDataImpl;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get countryCode;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  WalletEntity? get wallet;
  @override
  SubscriptionEntity? get subscription;
  @override
  @JsonKey(ignore: true)
  _$$GetUserDataImplCopyWith<_$GetUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubscriptionEntity {
  dynamic get lastSubscriptionDate => throw _privateConstructorUsedError;
  bool? get subscribed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionEntityCopyWith<SubscriptionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionEntityCopyWith<$Res> {
  factory $SubscriptionEntityCopyWith(
          SubscriptionEntity value, $Res Function(SubscriptionEntity) then) =
      _$SubscriptionEntityCopyWithImpl<$Res, SubscriptionEntity>;
  @useResult
  $Res call({dynamic lastSubscriptionDate, bool? subscribed});
}

/// @nodoc
class _$SubscriptionEntityCopyWithImpl<$Res, $Val extends SubscriptionEntity>
    implements $SubscriptionEntityCopyWith<$Res> {
  _$SubscriptionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSubscriptionDate = freezed,
    Object? subscribed = freezed,
  }) {
    return _then(_value.copyWith(
      lastSubscriptionDate: freezed == lastSubscriptionDate
          ? _value.lastSubscriptionDate
          : lastSubscriptionDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscribed: freezed == subscribed
          ? _value.subscribed
          : subscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionEntityImplCopyWith<$Res>
    implements $SubscriptionEntityCopyWith<$Res> {
  factory _$$SubscriptionEntityImplCopyWith(_$SubscriptionEntityImpl value,
          $Res Function(_$SubscriptionEntityImpl) then) =
      __$$SubscriptionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic lastSubscriptionDate, bool? subscribed});
}

/// @nodoc
class __$$SubscriptionEntityImplCopyWithImpl<$Res>
    extends _$SubscriptionEntityCopyWithImpl<$Res, _$SubscriptionEntityImpl>
    implements _$$SubscriptionEntityImplCopyWith<$Res> {
  __$$SubscriptionEntityImplCopyWithImpl(_$SubscriptionEntityImpl _value,
      $Res Function(_$SubscriptionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSubscriptionDate = freezed,
    Object? subscribed = freezed,
  }) {
    return _then(_$SubscriptionEntityImpl(
      lastSubscriptionDate: freezed == lastSubscriptionDate
          ? _value.lastSubscriptionDate
          : lastSubscriptionDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscribed: freezed == subscribed
          ? _value.subscribed
          : subscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SubscriptionEntityImpl implements _SubscriptionEntity {
  const _$SubscriptionEntityImpl({this.lastSubscriptionDate, this.subscribed});

  @override
  final dynamic lastSubscriptionDate;
  @override
  final bool? subscribed;

  @override
  String toString() {
    return 'SubscriptionEntity(lastSubscriptionDate: $lastSubscriptionDate, subscribed: $subscribed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionEntityImpl &&
            const DeepCollectionEquality()
                .equals(other.lastSubscriptionDate, lastSubscriptionDate) &&
            (identical(other.subscribed, subscribed) ||
                other.subscribed == subscribed));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(lastSubscriptionDate), subscribed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionEntityImplCopyWith<_$SubscriptionEntityImpl> get copyWith =>
      __$$SubscriptionEntityImplCopyWithImpl<_$SubscriptionEntityImpl>(
          this, _$identity);
}

abstract class _SubscriptionEntity implements SubscriptionEntity {
  const factory _SubscriptionEntity(
      {final dynamic lastSubscriptionDate,
      final bool? subscribed}) = _$SubscriptionEntityImpl;

  @override
  dynamic get lastSubscriptionDate;
  @override
  bool? get subscribed;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionEntityImplCopyWith<_$SubscriptionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WalletEntity {
  double? get credits => throw _privateConstructorUsedError;
  double? get lastRechargedCredit => throw _privateConstructorUsedError;

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
  $Res call({double? credits, double? lastRechargedCredit});
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
    Object? lastRechargedCredit = freezed,
  }) {
    return _then(_value.copyWith(
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
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
  $Res call({double? credits, double? lastRechargedCredit});
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
    Object? lastRechargedCredit = freezed,
  }) {
    return _then(_$WalletEntityImpl(
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$WalletEntityImpl implements _WalletEntity {
  const _$WalletEntityImpl({this.credits, this.lastRechargedCredit});

  @override
  final double? credits;
  @override
  final double? lastRechargedCredit;

  @override
  String toString() {
    return 'WalletEntity(credits: $credits, lastRechargedCredit: $lastRechargedCredit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEntityImpl &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.lastRechargedCredit, lastRechargedCredit) ||
                other.lastRechargedCredit == lastRechargedCredit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, credits, lastRechargedCredit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEntityImplCopyWith<_$WalletEntityImpl> get copyWith =>
      __$$WalletEntityImplCopyWithImpl<_$WalletEntityImpl>(this, _$identity);
}

abstract class _WalletEntity implements WalletEntity {
  const factory _WalletEntity(
      {final double? credits,
      final double? lastRechargedCredit}) = _$WalletEntityImpl;

  @override
  double? get credits;
  @override
  double? get lastRechargedCredit;
  @override
  @JsonKey(ignore: true)
  _$$WalletEntityImplCopyWith<_$WalletEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
