// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_sms_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardSmsDto _$DashboardSmsDtoFromJson(Map<String, dynamic> json) {
  return _DashboardSmsDto.fromJson(json);
}

/// @nodoc
mixin _$DashboardSmsDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardSmsDtoCopyWith<DashboardSmsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardSmsDtoCopyWith<$Res> {
  factory $DashboardSmsDtoCopyWith(
          DashboardSmsDto value, $Res Function(DashboardSmsDto) then) =
      _$DashboardSmsDtoCopyWithImpl<$Res, DashboardSmsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DashboardSmsDtoCopyWithImpl<$Res, $Val extends DashboardSmsDto>
    implements $DashboardSmsDtoCopyWith<$Res> {
  _$DashboardSmsDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$DashboardSmsDtoImplCopyWith<$Res>
    implements $DashboardSmsDtoCopyWith<$Res> {
  factory _$$DashboardSmsDtoImplCopyWith(_$DashboardSmsDtoImpl value,
          $Res Function(_$DashboardSmsDtoImpl) then) =
      __$$DashboardSmsDtoImplCopyWithImpl<$Res>;
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
class __$$DashboardSmsDtoImplCopyWithImpl<$Res>
    extends _$DashboardSmsDtoCopyWithImpl<$Res, _$DashboardSmsDtoImpl>
    implements _$$DashboardSmsDtoImplCopyWith<$Res> {
  __$$DashboardSmsDtoImplCopyWithImpl(
      _$DashboardSmsDtoImpl _value, $Res Function(_$DashboardSmsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DashboardSmsDtoImpl(
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
class _$DashboardSmsDtoImpl implements _DashboardSmsDto {
  const _$DashboardSmsDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$DashboardSmsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardSmsDtoImplFromJson(json);

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
    return 'DashboardSmsDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardSmsDtoImpl &&
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
  _$$DashboardSmsDtoImplCopyWith<_$DashboardSmsDtoImpl> get copyWith =>
      __$$DashboardSmsDtoImplCopyWithImpl<_$DashboardSmsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardSmsDtoImplToJson(
      this,
    );
  }
}

abstract class _DashboardSmsDto implements DashboardSmsDto {
  const factory _DashboardSmsDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$DashboardSmsDtoImpl;

  factory _DashboardSmsDto.fromJson(Map<String, dynamic> json) =
      _$DashboardSmsDtoImpl.fromJson;

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
  _$$DashboardSmsDtoImplCopyWith<_$DashboardSmsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "sent")
  int? get sent => throw _privateConstructorUsedError;
  @JsonKey(name: "delivered")
  int? get delivered => throw _privateConstructorUsedError;
  @JsonKey(name: "verified")
  int? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: "failed")
  int? get failed => throw _privateConstructorUsedError;
  @JsonKey(name: "deliveredPercentage")
  double? get deliveredPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "verifiedPercentage")
  double? get verifiedPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "failedPercentage")
  double? get failedPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: "totalCost")
  double? get totalCost => throw _privateConstructorUsedError;
  @JsonKey(name: "countryWiseCount")
  List<CountryWiseCount>? get countryWiseCount =>
      throw _privateConstructorUsedError;

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
      @JsonKey(name: "sent") int? sent,
      @JsonKey(name: "delivered") int? delivered,
      @JsonKey(name: "verified") int? verified,
      @JsonKey(name: "failed") int? failed,
      @JsonKey(name: "deliveredPercentage") double? deliveredPercentage,
      @JsonKey(name: "verifiedPercentage") double? verifiedPercentage,
      @JsonKey(name: "failedPercentage") double? failedPercentage,
      @JsonKey(name: "totalCost") double? totalCost,
      @JsonKey(name: "countryWiseCount")
      List<CountryWiseCount>? countryWiseCount});
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
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "sent") int? sent,
      @JsonKey(name: "delivered") int? delivered,
      @JsonKey(name: "verified") int? verified,
      @JsonKey(name: "failed") int? failed,
      @JsonKey(name: "deliveredPercentage") double? deliveredPercentage,
      @JsonKey(name: "verifiedPercentage") double? verifiedPercentage,
      @JsonKey(name: "failedPercentage") double? failedPercentage,
      @JsonKey(name: "totalCost") double? totalCost,
      @JsonKey(name: "countryWiseCount")
      List<CountryWiseCount>? countryWiseCount});
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
    return _then(_$DataImpl(
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
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "sent") this.sent,
      @JsonKey(name: "delivered") this.delivered,
      @JsonKey(name: "verified") this.verified,
      @JsonKey(name: "failed") this.failed,
      @JsonKey(name: "deliveredPercentage") this.deliveredPercentage,
      @JsonKey(name: "verifiedPercentage") this.verifiedPercentage,
      @JsonKey(name: "failedPercentage") this.failedPercentage,
      @JsonKey(name: "totalCost") this.totalCost,
      @JsonKey(name: "countryWiseCount")
      final List<CountryWiseCount>? countryWiseCount})
      : _countryWiseCount = countryWiseCount;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "sent")
  final int? sent;
  @override
  @JsonKey(name: "delivered")
  final int? delivered;
  @override
  @JsonKey(name: "verified")
  final int? verified;
  @override
  @JsonKey(name: "failed")
  final int? failed;
  @override
  @JsonKey(name: "deliveredPercentage")
  final double? deliveredPercentage;
  @override
  @JsonKey(name: "verifiedPercentage")
  final double? verifiedPercentage;
  @override
  @JsonKey(name: "failedPercentage")
  final double? failedPercentage;
  @override
  @JsonKey(name: "totalCost")
  final double? totalCost;
  final List<CountryWiseCount>? _countryWiseCount;
  @override
  @JsonKey(name: "countryWiseCount")
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
    return 'Data(customerId: $customerId, sent: $sent, delivered: $delivered, verified: $verified, failed: $failed, deliveredPercentage: $deliveredPercentage, verifiedPercentage: $verifiedPercentage, failedPercentage: $failedPercentage, totalCost: $totalCost, countryWiseCount: $countryWiseCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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

  @JsonKey(ignore: true)
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
      @JsonKey(name: "sent") final int? sent,
      @JsonKey(name: "delivered") final int? delivered,
      @JsonKey(name: "verified") final int? verified,
      @JsonKey(name: "failed") final int? failed,
      @JsonKey(name: "deliveredPercentage") final double? deliveredPercentage,
      @JsonKey(name: "verifiedPercentage") final double? verifiedPercentage,
      @JsonKey(name: "failedPercentage") final double? failedPercentage,
      @JsonKey(name: "totalCost") final double? totalCost,
      @JsonKey(name: "countryWiseCount")
      final List<CountryWiseCount>? countryWiseCount}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "sent")
  int? get sent;
  @override
  @JsonKey(name: "delivered")
  int? get delivered;
  @override
  @JsonKey(name: "verified")
  int? get verified;
  @override
  @JsonKey(name: "failed")
  int? get failed;
  @override
  @JsonKey(name: "deliveredPercentage")
  double? get deliveredPercentage;
  @override
  @JsonKey(name: "verifiedPercentage")
  double? get verifiedPercentage;
  @override
  @JsonKey(name: "failedPercentage")
  double? get failedPercentage;
  @override
  @JsonKey(name: "totalCost")
  double? get totalCost;
  @override
  @JsonKey(name: "countryWiseCount")
  List<CountryWiseCount>? get countryWiseCount;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CountryWiseCount _$CountryWiseCountFromJson(Map<String, dynamic> json) {
  return _CountryWiseCount.fromJson(json);
}

/// @nodoc
mixin _$CountryWiseCount {
  @JsonKey(name: "countryName")
  String? get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: "countryCode")
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: "sent")
  int? get sent => throw _privateConstructorUsedError;
  @JsonKey(name: "delivered")
  int? get delivered => throw _privateConstructorUsedError;
  @JsonKey(name: "verified")
  int? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: "failed")
  int? get failed => throw _privateConstructorUsedError;
  @JsonKey(name: "cost")
  double? get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "countryName") String? countryName,
      @JsonKey(name: "countryCode") String? countryCode,
      @JsonKey(name: "sent") int? sent,
      @JsonKey(name: "delivered") int? delivered,
      @JsonKey(name: "verified") int? verified,
      @JsonKey(name: "failed") int? failed,
      @JsonKey(name: "cost") double? cost});
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
      {@JsonKey(name: "countryName") String? countryName,
      @JsonKey(name: "countryCode") String? countryCode,
      @JsonKey(name: "sent") int? sent,
      @JsonKey(name: "delivered") int? delivered,
      @JsonKey(name: "verified") int? verified,
      @JsonKey(name: "failed") int? failed,
      @JsonKey(name: "cost") double? cost});
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
@JsonSerializable()
class _$CountryWiseCountImpl implements _CountryWiseCount {
  const _$CountryWiseCountImpl(
      {@JsonKey(name: "countryName") this.countryName,
      @JsonKey(name: "countryCode") this.countryCode,
      @JsonKey(name: "sent") this.sent,
      @JsonKey(name: "delivered") this.delivered,
      @JsonKey(name: "verified") this.verified,
      @JsonKey(name: "failed") this.failed,
      @JsonKey(name: "cost") this.cost});

  factory _$CountryWiseCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryWiseCountImplFromJson(json);

  @override
  @JsonKey(name: "countryName")
  final String? countryName;
  @override
  @JsonKey(name: "countryCode")
  final String? countryCode;
  @override
  @JsonKey(name: "sent")
  final int? sent;
  @override
  @JsonKey(name: "delivered")
  final int? delivered;
  @override
  @JsonKey(name: "verified")
  final int? verified;
  @override
  @JsonKey(name: "failed")
  final int? failed;
  @override
  @JsonKey(name: "cost")
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, countryName, countryCode, sent,
      delivered, verified, failed, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryWiseCountImplCopyWith<_$CountryWiseCountImpl> get copyWith =>
      __$$CountryWiseCountImplCopyWithImpl<_$CountryWiseCountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryWiseCountImplToJson(
      this,
    );
  }
}

abstract class _CountryWiseCount implements CountryWiseCount {
  const factory _CountryWiseCount(
      {@JsonKey(name: "countryName") final String? countryName,
      @JsonKey(name: "countryCode") final String? countryCode,
      @JsonKey(name: "sent") final int? sent,
      @JsonKey(name: "delivered") final int? delivered,
      @JsonKey(name: "verified") final int? verified,
      @JsonKey(name: "failed") final int? failed,
      @JsonKey(name: "cost") final double? cost}) = _$CountryWiseCountImpl;

  factory _CountryWiseCount.fromJson(Map<String, dynamic> json) =
      _$CountryWiseCountImpl.fromJson;

  @override
  @JsonKey(name: "countryName")
  String? get countryName;
  @override
  @JsonKey(name: "countryCode")
  String? get countryCode;
  @override
  @JsonKey(name: "sent")
  int? get sent;
  @override
  @JsonKey(name: "delivered")
  int? get delivered;
  @override
  @JsonKey(name: "verified")
  int? get verified;
  @override
  @JsonKey(name: "failed")
  int? get failed;
  @override
  @JsonKey(name: "cost")
  double? get cost;
  @override
  @JsonKey(ignore: true)
  _$$CountryWiseCountImplCopyWith<_$CountryWiseCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
