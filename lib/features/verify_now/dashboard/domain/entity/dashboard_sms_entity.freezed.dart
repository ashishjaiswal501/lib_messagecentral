// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_sms_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardSmsEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardSmsEntityCopyWith<DashboardSmsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardSmsEntityCopyWith<$Res> {
  factory $DashboardSmsEntityCopyWith(
          DashboardSmsEntity value, $Res Function(DashboardSmsEntity) then) =
      _$DashboardSmsEntityCopyWithImpl<$Res, DashboardSmsEntity>;
  @useResult
  $Res call({int? responseCode, String? message, UserData? data});

  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DashboardSmsEntityCopyWithImpl<$Res, $Val extends DashboardSmsEntity>
    implements $DashboardSmsEntityCopyWith<$Res> {
  _$DashboardSmsEntityCopyWithImpl(this._value, this._then);

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
              as UserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardSmsEntityImplCopyWith<$Res>
    implements $DashboardSmsEntityCopyWith<$Res> {
  factory _$$DashboardSmsEntityImplCopyWith(_$DashboardSmsEntityImpl value,
          $Res Function(_$DashboardSmsEntityImpl) then) =
      __$$DashboardSmsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, UserData? data});

  @override
  $UserDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DashboardSmsEntityImplCopyWithImpl<$Res>
    extends _$DashboardSmsEntityCopyWithImpl<$Res, _$DashboardSmsEntityImpl>
    implements _$$DashboardSmsEntityImplCopyWith<$Res> {
  __$$DashboardSmsEntityImplCopyWithImpl(_$DashboardSmsEntityImpl _value,
      $Res Function(_$DashboardSmsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DashboardSmsEntityImpl(
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
              as UserData?,
    ));
  }
}

/// @nodoc

class _$DashboardSmsEntityImpl implements _DashboardSmsEntity {
  const _$DashboardSmsEntityImpl({this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final UserData? data;

  @override
  String toString() {
    return 'DashboardSmsEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardSmsEntityImpl &&
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
  _$$DashboardSmsEntityImplCopyWith<_$DashboardSmsEntityImpl> get copyWith =>
      __$$DashboardSmsEntityImplCopyWithImpl<_$DashboardSmsEntityImpl>(
          this, _$identity);
}

abstract class _DashboardSmsEntity implements DashboardSmsEntity {
  const factory _DashboardSmsEntity(
      {final int? responseCode,
      final String? message,
      final UserData? data}) = _$DashboardSmsEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  UserData? get data;
  @override
  @JsonKey(ignore: true)
  _$$DashboardSmsEntityImplCopyWith<_$DashboardSmsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserData {
  String? get customerId => throw _privateConstructorUsedError;
  int? get sent => throw _privateConstructorUsedError;
  int? get delivered => throw _privateConstructorUsedError;
  int? get verified => throw _privateConstructorUsedError;
  int? get failed => throw _privateConstructorUsedError;
  double? get deliveredPercentage => throw _privateConstructorUsedError;
  double? get verifiedPercentage => throw _privateConstructorUsedError;
  double? get failedPercentage => throw _privateConstructorUsedError;
  double? get totalCost => throw _privateConstructorUsedError;
  List<CountryWiseCount>? get countryWiseCount =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String? customerId,
      int? sent,
      int? delivered,
      int? verified,
      int? failed,
      double? deliveredPercentage,
      double? verifiedPercentage,
      double? failedPercentage,
      double? totalCost,
      List<CountryWiseCount>? countryWiseCount});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? sent = freezed,
    Object? delivered = freezed,
    Object? verified = freezed,
    Object? failed = freezed,
    Object? deliveredPercentage = freezed,
    Object? verifiedPercentage = freezed,
    Object? failedPercentage = freezed,
    Object? totalCost = freezed,
    Object? countryWiseCount = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      sent: freezed == sent
          ? _value.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int?,
      delivered: freezed == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      failed: freezed == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveredPercentage: freezed == deliveredPercentage
          ? _value.deliveredPercentage
          : deliveredPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      verifiedPercentage: freezed == verifiedPercentage
          ? _value.verifiedPercentage
          : verifiedPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      failedPercentage: freezed == failedPercentage
          ? _value.failedPercentage
          : failedPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      countryWiseCount: freezed == countryWiseCount
          ? _value.countryWiseCount
          : countryWiseCount // ignore: cast_nullable_to_non_nullable
              as List<CountryWiseCount>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customerId,
      int? sent,
      int? delivered,
      int? verified,
      int? failed,
      double? deliveredPercentage,
      double? verifiedPercentage,
      double? failedPercentage,
      double? totalCost,
      List<CountryWiseCount>? countryWiseCount});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? sent = freezed,
    Object? delivered = freezed,
    Object? verified = freezed,
    Object? failed = freezed,
    Object? deliveredPercentage = freezed,
    Object? verifiedPercentage = freezed,
    Object? failedPercentage = freezed,
    Object? totalCost = freezed,
    Object? countryWiseCount = freezed,
  }) {
    return _then(_$UserDataImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      sent: freezed == sent
          ? _value.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int?,
      delivered: freezed == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      failed: freezed == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveredPercentage: freezed == deliveredPercentage
          ? _value.deliveredPercentage
          : deliveredPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      verifiedPercentage: freezed == verifiedPercentage
          ? _value.verifiedPercentage
          : verifiedPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      failedPercentage: freezed == failedPercentage
          ? _value.failedPercentage
          : failedPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      countryWiseCount: freezed == countryWiseCount
          ? _value._countryWiseCount
          : countryWiseCount // ignore: cast_nullable_to_non_nullable
              as List<CountryWiseCount>?,
    ));
  }
}

/// @nodoc

class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.customerId,
      this.sent,
      this.delivered,
      this.verified,
      this.failed,
      this.deliveredPercentage,
      this.verifiedPercentage,
      this.failedPercentage,
      this.totalCost,
      final List<CountryWiseCount>? countryWiseCount})
      : _countryWiseCount = countryWiseCount;

  @override
  final String? customerId;
  @override
  final int? sent;
  @override
  final int? delivered;
  @override
  final int? verified;
  @override
  final int? failed;
  @override
  final double? deliveredPercentage;
  @override
  final double? verifiedPercentage;
  @override
  final double? failedPercentage;
  @override
  final double? totalCost;
  final List<CountryWiseCount>? _countryWiseCount;
  @override
  List<CountryWiseCount>? get countryWiseCount {
    final value = _countryWiseCount;
    if (value == null) return null;
    if (_countryWiseCount is EqualUnmodifiableListView)
      return _countryWiseCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserData(customerId: $customerId, sent: $sent, delivered: $delivered, verified: $verified, failed: $failed, deliveredPercentage: $deliveredPercentage, verifiedPercentage: $verifiedPercentage, failedPercentage: $failedPercentage, totalCost: $totalCost, countryWiseCount: $countryWiseCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.sent, sent) || other.sent == sent) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.failed, failed) || other.failed == failed) &&
            (identical(other.deliveredPercentage, deliveredPercentage) ||
                other.deliveredPercentage == deliveredPercentage) &&
            (identical(other.verifiedPercentage, verifiedPercentage) ||
                other.verifiedPercentage == verifiedPercentage) &&
            (identical(other.failedPercentage, failedPercentage) ||
                other.failedPercentage == failedPercentage) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            const DeepCollectionEquality()
                .equals(other._countryWiseCount, _countryWiseCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      sent,
      delivered,
      verified,
      failed,
      deliveredPercentage,
      verifiedPercentage,
      failedPercentage,
      totalCost,
      const DeepCollectionEquality().hash(_countryWiseCount));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final String? customerId,
      final int? sent,
      final int? delivered,
      final int? verified,
      final int? failed,
      final double? deliveredPercentage,
      final double? verifiedPercentage,
      final double? failedPercentage,
      final double? totalCost,
      final List<CountryWiseCount>? countryWiseCount}) = _$UserDataImpl;

  @override
  String? get customerId;
  @override
  int? get sent;
  @override
  int? get delivered;
  @override
  int? get verified;
  @override
  int? get failed;
  @override
  double? get deliveredPercentage;
  @override
  double? get verifiedPercentage;
  @override
  double? get failedPercentage;
  @override
  double? get totalCost;
  @override
  List<CountryWiseCount>? get countryWiseCount;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CountryWiseCount {
  String? get countryName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  int? get sent => throw _privateConstructorUsedError;
  int? get delivered => throw _privateConstructorUsedError;
  int? get verified => throw _privateConstructorUsedError;
  int? get failed => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryWiseCountCopyWith<CountryWiseCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryWiseCountCopyWith<$Res> {
  factory $CountryWiseCountCopyWith(
          CountryWiseCount value, $Res Function(CountryWiseCount) then) =
      _$CountryWiseCountCopyWithImpl<$Res, CountryWiseCount>;
  @useResult
  $Res call(
      {String? countryName,
      String? countryCode,
      int? sent,
      int? delivered,
      int? verified,
      int? failed,
      double? cost});
}

/// @nodoc
class _$CountryWiseCountCopyWithImpl<$Res, $Val extends CountryWiseCount>
    implements $CountryWiseCountCopyWith<$Res> {
  _$CountryWiseCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = freezed,
    Object? countryCode = freezed,
    Object? sent = freezed,
    Object? delivered = freezed,
    Object? verified = freezed,
    Object? failed = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      sent: freezed == sent
          ? _value.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int?,
      delivered: freezed == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      failed: freezed == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryWiseCountImplCopyWith<$Res>
    implements $CountryWiseCountCopyWith<$Res> {
  factory _$$CountryWiseCountImplCopyWith(_$CountryWiseCountImpl value,
          $Res Function(_$CountryWiseCountImpl) then) =
      __$$CountryWiseCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? countryName,
      String? countryCode,
      int? sent,
      int? delivered,
      int? verified,
      int? failed,
      double? cost});
}

/// @nodoc
class __$$CountryWiseCountImplCopyWithImpl<$Res>
    extends _$CountryWiseCountCopyWithImpl<$Res, _$CountryWiseCountImpl>
    implements _$$CountryWiseCountImplCopyWith<$Res> {
  __$$CountryWiseCountImplCopyWithImpl(_$CountryWiseCountImpl _value,
      $Res Function(_$CountryWiseCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = freezed,
    Object? countryCode = freezed,
    Object? sent = freezed,
    Object? delivered = freezed,
    Object? verified = freezed,
    Object? failed = freezed,
    Object? cost = freezed,
  }) {
    return _then(_$CountryWiseCountImpl(
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      sent: freezed == sent
          ? _value.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int?,
      delivered: freezed == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      failed: freezed == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$CountryWiseCountImpl implements _CountryWiseCount {
  const _$CountryWiseCountImpl(
      {this.countryName,
      this.countryCode,
      this.sent,
      this.delivered,
      this.verified,
      this.failed,
      this.cost});

  @override
  final String? countryName;
  @override
  final String? countryCode;
  @override
  final int? sent;
  @override
  final int? delivered;
  @override
  final int? verified;
  @override
  final int? failed;
  @override
  final double? cost;

  @override
  String toString() {
    return 'CountryWiseCount(countryName: $countryName, countryCode: $countryCode, sent: $sent, delivered: $delivered, verified: $verified, failed: $failed, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryWiseCountImpl &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.sent, sent) || other.sent == sent) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.failed, failed) || other.failed == failed) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryName, countryCode, sent,
      delivered, verified, failed, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryWiseCountImplCopyWith<_$CountryWiseCountImpl> get copyWith =>
      __$$CountryWiseCountImplCopyWithImpl<_$CountryWiseCountImpl>(
          this, _$identity);
}

abstract class _CountryWiseCount implements CountryWiseCount {
  const factory _CountryWiseCount(
      {final String? countryName,
      final String? countryCode,
      final int? sent,
      final int? delivered,
      final int? verified,
      final int? failed,
      final double? cost}) = _$CountryWiseCountImpl;

  @override
  String? get countryName;
  @override
  String? get countryCode;
  @override
  int? get sent;
  @override
  int? get delivered;
  @override
  int? get verified;
  @override
  int? get failed;
  @override
  double? get cost;
  @override
  @JsonKey(ignore: true)
  _$$CountryWiseCountImplCopyWith<_$CountryWiseCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
