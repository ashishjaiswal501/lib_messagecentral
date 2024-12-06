// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalyticsEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  AnalyticsData? get analyticsData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyticsEntityCopyWith<AnalyticsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsEntityCopyWith<$Res> {
  factory $AnalyticsEntityCopyWith(
          AnalyticsEntity value, $Res Function(AnalyticsEntity) then) =
      _$AnalyticsEntityCopyWithImpl<$Res, AnalyticsEntity>;
  @useResult
  $Res call({int? responseCode, String? message, AnalyticsData? analyticsData});

  $AnalyticsDataCopyWith<$Res>? get analyticsData;
}

/// @nodoc
class _$AnalyticsEntityCopyWithImpl<$Res, $Val extends AnalyticsEntity>
    implements $AnalyticsEntityCopyWith<$Res> {
  _$AnalyticsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? analyticsData = freezed,
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
      analyticsData: freezed == analyticsData
          ? _value.analyticsData
          : analyticsData // ignore: cast_nullable_to_non_nullable
              as AnalyticsData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnalyticsDataCopyWith<$Res>? get analyticsData {
    if (_value.analyticsData == null) {
      return null;
    }

    return $AnalyticsDataCopyWith<$Res>(_value.analyticsData!, (value) {
      return _then(_value.copyWith(analyticsData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsEntityImplCopyWith<$Res>
    implements $AnalyticsEntityCopyWith<$Res> {
  factory _$$AnalyticsEntityImplCopyWith(_$AnalyticsEntityImpl value,
          $Res Function(_$AnalyticsEntityImpl) then) =
      __$$AnalyticsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, AnalyticsData? analyticsData});

  @override
  $AnalyticsDataCopyWith<$Res>? get analyticsData;
}

/// @nodoc
class __$$AnalyticsEntityImplCopyWithImpl<$Res>
    extends _$AnalyticsEntityCopyWithImpl<$Res, _$AnalyticsEntityImpl>
    implements _$$AnalyticsEntityImplCopyWith<$Res> {
  __$$AnalyticsEntityImplCopyWithImpl(
      _$AnalyticsEntityImpl _value, $Res Function(_$AnalyticsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? analyticsData = freezed,
  }) {
    return _then(_$AnalyticsEntityImpl(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      analyticsData: freezed == analyticsData
          ? _value.analyticsData
          : analyticsData // ignore: cast_nullable_to_non_nullable
              as AnalyticsData?,
    ));
  }
}

/// @nodoc

class _$AnalyticsEntityImpl implements _AnalyticsEntity {
  const _$AnalyticsEntityImpl(
      {this.responseCode, this.message, this.analyticsData});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final AnalyticsData? analyticsData;

  @override
  String toString() {
    return 'AnalyticsEntity(responseCode: $responseCode, message: $message, analyticsData: $analyticsData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsEntityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.analyticsData, analyticsData) ||
                other.analyticsData == analyticsData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, responseCode, message, analyticsData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsEntityImplCopyWith<_$AnalyticsEntityImpl> get copyWith =>
      __$$AnalyticsEntityImplCopyWithImpl<_$AnalyticsEntityImpl>(
          this, _$identity);
}

abstract class _AnalyticsEntity implements AnalyticsEntity {
  const factory _AnalyticsEntity(
      {final int? responseCode,
      final String? message,
      final AnalyticsData? analyticsData}) = _$AnalyticsEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  AnalyticsData? get analyticsData;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsEntityImplCopyWith<_$AnalyticsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnalyticsData {
  String? get customerId => throw _privateConstructorUsedError;
  int? get sent => throw _privateConstructorUsedError;
  int? get delivered => throw _privateConstructorUsedError;
  int? get verified => throw _privateConstructorUsedError;
  int? get failed => throw _privateConstructorUsedError;
  double? get deliveredPercentage => throw _privateConstructorUsedError;
  double? get verifiedPercentage => throw _privateConstructorUsedError;
  double? get failedPercentage => throw _privateConstructorUsedError;
  double? get totalCost => throw _privateConstructorUsedError;
  List<CountryWiseCounts>? get countryWiseCount =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyticsDataCopyWith<AnalyticsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsDataCopyWith<$Res> {
  factory $AnalyticsDataCopyWith(
          AnalyticsData value, $Res Function(AnalyticsData) then) =
      _$AnalyticsDataCopyWithImpl<$Res, AnalyticsData>;
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
      List<CountryWiseCounts>? countryWiseCount});
}

/// @nodoc
class _$AnalyticsDataCopyWithImpl<$Res, $Val extends AnalyticsData>
    implements $AnalyticsDataCopyWith<$Res> {
  _$AnalyticsDataCopyWithImpl(this._value, this._then);

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
              as List<CountryWiseCounts>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsDataImplCopyWith<$Res>
    implements $AnalyticsDataCopyWith<$Res> {
  factory _$$AnalyticsDataImplCopyWith(
          _$AnalyticsDataImpl value, $Res Function(_$AnalyticsDataImpl) then) =
      __$$AnalyticsDataImplCopyWithImpl<$Res>;
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
      List<CountryWiseCounts>? countryWiseCount});
}

/// @nodoc
class __$$AnalyticsDataImplCopyWithImpl<$Res>
    extends _$AnalyticsDataCopyWithImpl<$Res, _$AnalyticsDataImpl>
    implements _$$AnalyticsDataImplCopyWith<$Res> {
  __$$AnalyticsDataImplCopyWithImpl(
      _$AnalyticsDataImpl _value, $Res Function(_$AnalyticsDataImpl) _then)
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
    return _then(_$AnalyticsDataImpl(
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
              as List<CountryWiseCounts>?,
    ));
  }
}

/// @nodoc

class _$AnalyticsDataImpl implements _AnalyticsData {
  const _$AnalyticsDataImpl(
      {this.customerId,
      this.sent,
      this.delivered,
      this.verified,
      this.failed,
      this.deliveredPercentage,
      this.verifiedPercentage,
      this.failedPercentage,
      this.totalCost,
      final List<CountryWiseCounts>? countryWiseCount})
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
  final List<CountryWiseCounts>? _countryWiseCount;
  @override
  List<CountryWiseCounts>? get countryWiseCount {
    final value = _countryWiseCount;
    if (value == null) return null;
    if (_countryWiseCount is EqualUnmodifiableListView)
      return _countryWiseCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnalyticsData(customerId: $customerId, sent: $sent, delivered: $delivered, verified: $verified, failed: $failed, deliveredPercentage: $deliveredPercentage, verifiedPercentage: $verifiedPercentage, failedPercentage: $failedPercentage, totalCost: $totalCost, countryWiseCount: $countryWiseCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsDataImpl &&
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
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      __$$AnalyticsDataImplCopyWithImpl<_$AnalyticsDataImpl>(this, _$identity);
}

abstract class _AnalyticsData implements AnalyticsData {
  const factory _AnalyticsData(
      {final String? customerId,
      final int? sent,
      final int? delivered,
      final int? verified,
      final int? failed,
      final double? deliveredPercentage,
      final double? verifiedPercentage,
      final double? failedPercentage,
      final double? totalCost,
      final List<CountryWiseCounts>? countryWiseCount}) = _$AnalyticsDataImpl;

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
  List<CountryWiseCounts>? get countryWiseCount;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CountryWiseCounts {
  String? get countryName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  int? get sent => throw _privateConstructorUsedError;
  int? get delivered => throw _privateConstructorUsedError;
  int? get verified => throw _privateConstructorUsedError;
  int? get failed => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryWiseCountsCopyWith<CountryWiseCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryWiseCountsCopyWith<$Res> {
  factory $CountryWiseCountsCopyWith(
          CountryWiseCounts value, $Res Function(CountryWiseCounts) then) =
      _$CountryWiseCountsCopyWithImpl<$Res, CountryWiseCounts>;
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
class _$CountryWiseCountsCopyWithImpl<$Res, $Val extends CountryWiseCounts>
    implements $CountryWiseCountsCopyWith<$Res> {
  _$CountryWiseCountsCopyWithImpl(this._value, this._then);

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
abstract class _$$CountryWiseCountsImplCopyWith<$Res>
    implements $CountryWiseCountsCopyWith<$Res> {
  factory _$$CountryWiseCountsImplCopyWith(_$CountryWiseCountsImpl value,
          $Res Function(_$CountryWiseCountsImpl) then) =
      __$$CountryWiseCountsImplCopyWithImpl<$Res>;
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
class __$$CountryWiseCountsImplCopyWithImpl<$Res>
    extends _$CountryWiseCountsCopyWithImpl<$Res, _$CountryWiseCountsImpl>
    implements _$$CountryWiseCountsImplCopyWith<$Res> {
  __$$CountryWiseCountsImplCopyWithImpl(_$CountryWiseCountsImpl _value,
      $Res Function(_$CountryWiseCountsImpl) _then)
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
    return _then(_$CountryWiseCountsImpl(
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

class _$CountryWiseCountsImpl implements _CountryWiseCounts {
  const _$CountryWiseCountsImpl(
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
    return 'CountryWiseCounts(countryName: $countryName, countryCode: $countryCode, sent: $sent, delivered: $delivered, verified: $verified, failed: $failed, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryWiseCountsImpl &&
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
  _$$CountryWiseCountsImplCopyWith<_$CountryWiseCountsImpl> get copyWith =>
      __$$CountryWiseCountsImplCopyWithImpl<_$CountryWiseCountsImpl>(
          this, _$identity);
}

abstract class _CountryWiseCounts implements CountryWiseCounts {
  const factory _CountryWiseCounts(
      {final String? countryName,
      final String? countryCode,
      final int? sent,
      final int? delivered,
      final int? verified,
      final int? failed,
      final double? cost}) = _$CountryWiseCountsImpl;

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
  _$$CountryWiseCountsImplCopyWith<_$CountryWiseCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
