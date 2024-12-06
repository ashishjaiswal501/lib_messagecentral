// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_details_reporting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailsReportingSearchEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ReportingData? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsReportingSearchEntityCopyWith<DetailsReportingSearchEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsReportingSearchEntityCopyWith<$Res> {
  factory $DetailsReportingSearchEntityCopyWith(
          DetailsReportingSearchEntity value,
          $Res Function(DetailsReportingSearchEntity) then) =
      _$DetailsReportingSearchEntityCopyWithImpl<$Res,
          DetailsReportingSearchEntity>;
  @useResult
  $Res call({int? responseCode, String? message, ReportingData? data});

  $ReportingDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DetailsReportingSearchEntityCopyWithImpl<$Res,
        $Val extends DetailsReportingSearchEntity>
    implements $DetailsReportingSearchEntityCopyWith<$Res> {
  _$DetailsReportingSearchEntityCopyWithImpl(this._value, this._then);

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
              as ReportingData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportingDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReportingDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailsReportingSearchEntityImplCopyWith<$Res>
    implements $DetailsReportingSearchEntityCopyWith<$Res> {
  factory _$$DetailsReportingSearchEntityImplCopyWith(
          _$DetailsReportingSearchEntityImpl value,
          $Res Function(_$DetailsReportingSearchEntityImpl) then) =
      __$$DetailsReportingSearchEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, ReportingData? data});

  @override
  $ReportingDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DetailsReportingSearchEntityImplCopyWithImpl<$Res>
    extends _$DetailsReportingSearchEntityCopyWithImpl<$Res,
        _$DetailsReportingSearchEntityImpl>
    implements _$$DetailsReportingSearchEntityImplCopyWith<$Res> {
  __$$DetailsReportingSearchEntityImplCopyWithImpl(
      _$DetailsReportingSearchEntityImpl _value,
      $Res Function(_$DetailsReportingSearchEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DetailsReportingSearchEntityImpl(
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
              as ReportingData?,
    ));
  }
}

/// @nodoc

class _$DetailsReportingSearchEntityImpl
    implements _DetailsReportingSearchEntity {
  const _$DetailsReportingSearchEntityImpl(
      {this.responseCode, this.message, this.data});

  @override
  final int? responseCode;
  @override
  final String? message;
  @override
  final ReportingData? data;

  @override
  String toString() {
    return 'DetailsReportingSearchEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsReportingSearchEntityImpl &&
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
  _$$DetailsReportingSearchEntityImplCopyWith<
          _$DetailsReportingSearchEntityImpl>
      get copyWith => __$$DetailsReportingSearchEntityImplCopyWithImpl<
          _$DetailsReportingSearchEntityImpl>(this, _$identity);
}

abstract class _DetailsReportingSearchEntity
    implements DetailsReportingSearchEntity {
  const factory _DetailsReportingSearchEntity(
      {final int? responseCode,
      final String? message,
      final ReportingData? data}) = _$DetailsReportingSearchEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  ReportingData? get data;
  @override
  @JsonKey(ignore: true)
  _$$DetailsReportingSearchEntityImplCopyWith<
          _$DetailsReportingSearchEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportingData {
  List<DatumReport>? get data => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportingDataCopyWith<ReportingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportingDataCopyWith<$Res> {
  factory $ReportingDataCopyWith(
          ReportingData value, $Res Function(ReportingData) then) =
      _$ReportingDataCopyWithImpl<$Res, ReportingData>;
  @useResult
  $Res call({List<DatumReport>? data, int? count});
}

/// @nodoc
class _$ReportingDataCopyWithImpl<$Res, $Val extends ReportingData>
    implements $ReportingDataCopyWith<$Res> {
  _$ReportingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DatumReport>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportingDataImplCopyWith<$Res>
    implements $ReportingDataCopyWith<$Res> {
  factory _$$ReportingDataImplCopyWith(
          _$ReportingDataImpl value, $Res Function(_$ReportingDataImpl) then) =
      __$$ReportingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DatumReport>? data, int? count});
}

/// @nodoc
class __$$ReportingDataImplCopyWithImpl<$Res>
    extends _$ReportingDataCopyWithImpl<$Res, _$ReportingDataImpl>
    implements _$$ReportingDataImplCopyWith<$Res> {
  __$$ReportingDataImplCopyWithImpl(
      _$ReportingDataImpl _value, $Res Function(_$ReportingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? count = freezed,
  }) {
    return _then(_$ReportingDataImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DatumReport>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ReportingDataImpl implements _ReportingData {
  const _$ReportingDataImpl({final List<DatumReport>? data, this.count})
      : _data = data;

  final List<DatumReport>? _data;
  @override
  List<DatumReport>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'ReportingData(data: $data, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportingDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportingDataImplCopyWith<_$ReportingDataImpl> get copyWith =>
      __$$ReportingDataImplCopyWithImpl<_$ReportingDataImpl>(this, _$identity);
}

abstract class _ReportingData implements ReportingData {
  const factory _ReportingData(
      {final List<DatumReport>? data, final int? count}) = _$ReportingDataImpl;

  @override
  List<DatumReport>? get data;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$ReportingDataImplCopyWith<_$ReportingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DatumReport {
  String? get countryCode => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  dynamic get senderId => throw _privateConstructorUsedError;
  dynamic get templateId => throw _privateConstructorUsedError;
  String? get messageBody => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  dynamic get errorCode => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DatumReportCopyWith<DatumReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumReportCopyWith<$Res> {
  factory $DatumReportCopyWith(
          DatumReport value, $Res Function(DatumReport) then) =
      _$DatumReportCopyWithImpl<$Res, DatumReport>;
  @useResult
  $Res call(
      {String? countryCode,
      String? mobileNumber,
      dynamic senderId,
      dynamic templateId,
      String? messageBody,
      String? status,
      dynamic errorCode,
      DateTime? createdAt,
      DateTime? deliveredAt,
      dynamic updatedAt});
}

/// @nodoc
class _$DatumReportCopyWithImpl<$Res, $Val extends DatumReport>
    implements $DatumReportCopyWith<$Res> {
  _$DatumReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = freezed,
    Object? mobileNumber = freezed,
    Object? senderId = freezed,
    Object? templateId = freezed,
    Object? messageBody = freezed,
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? createdAt = freezed,
    Object? deliveredAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      messageBody: freezed == messageBody
          ? _value.messageBody
          : messageBody // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumReportImplCopyWith<$Res>
    implements $DatumReportCopyWith<$Res> {
  factory _$$DatumReportImplCopyWith(
          _$DatumReportImpl value, $Res Function(_$DatumReportImpl) then) =
      __$$DatumReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? countryCode,
      String? mobileNumber,
      dynamic senderId,
      dynamic templateId,
      String? messageBody,
      String? status,
      dynamic errorCode,
      DateTime? createdAt,
      DateTime? deliveredAt,
      dynamic updatedAt});
}

/// @nodoc
class __$$DatumReportImplCopyWithImpl<$Res>
    extends _$DatumReportCopyWithImpl<$Res, _$DatumReportImpl>
    implements _$$DatumReportImplCopyWith<$Res> {
  __$$DatumReportImplCopyWithImpl(
      _$DatumReportImpl _value, $Res Function(_$DatumReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = freezed,
    Object? mobileNumber = freezed,
    Object? senderId = freezed,
    Object? templateId = freezed,
    Object? messageBody = freezed,
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? createdAt = freezed,
    Object? deliveredAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DatumReportImpl(
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      messageBody: freezed == messageBody
          ? _value.messageBody
          : messageBody // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$DatumReportImpl implements _DatumReport {
  const _$DatumReportImpl(
      {this.countryCode,
      this.mobileNumber,
      this.senderId,
      this.templateId,
      this.messageBody,
      this.status,
      this.errorCode,
      this.createdAt,
      this.deliveredAt,
      this.updatedAt});

  @override
  final String? countryCode;
  @override
  final String? mobileNumber;
  @override
  final dynamic senderId;
  @override
  final dynamic templateId;
  @override
  final String? messageBody;
  @override
  final String? status;
  @override
  final dynamic errorCode;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? deliveredAt;
  @override
  final dynamic updatedAt;

  @override
  String toString() {
    return 'DatumReport(countryCode: $countryCode, mobileNumber: $mobileNumber, senderId: $senderId, templateId: $templateId, messageBody: $messageBody, status: $status, errorCode: $errorCode, createdAt: $createdAt, deliveredAt: $deliveredAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumReportImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            const DeepCollectionEquality().equals(other.senderId, senderId) &&
            const DeepCollectionEquality()
                .equals(other.templateId, templateId) &&
            (identical(other.messageBody, messageBody) ||
                other.messageBody == messageBody) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryCode,
      mobileNumber,
      const DeepCollectionEquality().hash(senderId),
      const DeepCollectionEquality().hash(templateId),
      messageBody,
      status,
      const DeepCollectionEquality().hash(errorCode),
      createdAt,
      deliveredAt,
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumReportImplCopyWith<_$DatumReportImpl> get copyWith =>
      __$$DatumReportImplCopyWithImpl<_$DatumReportImpl>(this, _$identity);
}

abstract class _DatumReport implements DatumReport {
  const factory _DatumReport(
      {final String? countryCode,
      final String? mobileNumber,
      final dynamic senderId,
      final dynamic templateId,
      final String? messageBody,
      final String? status,
      final dynamic errorCode,
      final DateTime? createdAt,
      final DateTime? deliveredAt,
      final dynamic updatedAt}) = _$DatumReportImpl;

  @override
  String? get countryCode;
  @override
  String? get mobileNumber;
  @override
  dynamic get senderId;
  @override
  dynamic get templateId;
  @override
  String? get messageBody;
  @override
  String? get status;
  @override
  dynamic get errorCode;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get deliveredAt;
  @override
  dynamic get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DatumReportImplCopyWith<_$DatumReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
