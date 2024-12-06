// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentHistoryEntity {
  int? get responseCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<PaymentData>? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentHistoryEntityCopyWith<PaymentHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryEntityCopyWith<$Res> {
  factory $PaymentHistoryEntityCopyWith(PaymentHistoryEntity value,
          $Res Function(PaymentHistoryEntity) then) =
      _$PaymentHistoryEntityCopyWithImpl<$Res, PaymentHistoryEntity>;
  @useResult
  $Res call({int? responseCode, String? message, List<PaymentData>? data});
}

/// @nodoc
class _$PaymentHistoryEntityCopyWithImpl<$Res,
        $Val extends PaymentHistoryEntity>
    implements $PaymentHistoryEntityCopyWith<$Res> {
  _$PaymentHistoryEntityCopyWithImpl(this._value, this._then);

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
              as List<PaymentData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentHistoryEntityImplCopyWith<$Res>
    implements $PaymentHistoryEntityCopyWith<$Res> {
  factory _$$PaymentHistoryEntityImplCopyWith(_$PaymentHistoryEntityImpl value,
          $Res Function(_$PaymentHistoryEntityImpl) then) =
      __$$PaymentHistoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? responseCode, String? message, List<PaymentData>? data});
}

/// @nodoc
class __$$PaymentHistoryEntityImplCopyWithImpl<$Res>
    extends _$PaymentHistoryEntityCopyWithImpl<$Res, _$PaymentHistoryEntityImpl>
    implements _$$PaymentHistoryEntityImplCopyWith<$Res> {
  __$$PaymentHistoryEntityImplCopyWithImpl(_$PaymentHistoryEntityImpl _value,
      $Res Function(_$PaymentHistoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PaymentHistoryEntityImpl(
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
    ));
  }
}

/// @nodoc

class _$PaymentHistoryEntityImpl implements _PaymentHistoryEntity {
  const _$PaymentHistoryEntityImpl(
      {this.responseCode, this.message, final List<PaymentData>? data})
      : _data = data;

  @override
  final int? responseCode;
  @override
  final String? message;
  final List<PaymentData>? _data;
  @override
  List<PaymentData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentHistoryEntity(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryEntityImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryEntityImplCopyWith<_$PaymentHistoryEntityImpl>
      get copyWith =>
          __$$PaymentHistoryEntityImplCopyWithImpl<_$PaymentHistoryEntityImpl>(
              this, _$identity);
}

abstract class _PaymentHistoryEntity implements PaymentHistoryEntity {
  const factory _PaymentHistoryEntity(
      {final int? responseCode,
      final String? message,
      final List<PaymentData>? data}) = _$PaymentHistoryEntityImpl;

  @override
  int? get responseCode;
  @override
  String? get message;
  @override
  List<PaymentData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$PaymentHistoryEntityImplCopyWith<_$PaymentHistoryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentData {
  int? get id => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  dynamic get transactionId => throw _privateConstructorUsedError;
  DateTime? get transactionDateTime => throw _privateConstructorUsedError;
  double? get creditsPurchased => throw _privateConstructorUsedError;
  double? get balanceBeforePurchased => throw _privateConstructorUsedError;
  double? get balanceAfterPurchased => throw _privateConstructorUsedError;
  String? get creditsType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentDataCopyWith<PaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDataCopyWith<$Res> {
  factory $PaymentDataCopyWith(
          PaymentData value, $Res Function(PaymentData) then) =
      _$PaymentDataCopyWithImpl<$Res, PaymentData>;
  @useResult
  $Res call(
      {int? id,
      String? customerId,
      dynamic transactionId,
      DateTime? transactionDateTime,
      double? creditsPurchased,
      double? balanceBeforePurchased,
      double? balanceAfterPurchased,
      String? creditsType});
}

/// @nodoc
class _$PaymentDataCopyWithImpl<$Res, $Val extends PaymentData>
    implements $PaymentDataCopyWith<$Res> {
  _$PaymentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? transactionId = freezed,
    Object? transactionDateTime = freezed,
    Object? creditsPurchased = freezed,
    Object? balanceBeforePurchased = freezed,
    Object? balanceAfterPurchased = freezed,
    Object? creditsType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transactionDateTime: freezed == transactionDateTime
          ? _value.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      creditsPurchased: freezed == creditsPurchased
          ? _value.creditsPurchased
          : creditsPurchased // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceBeforePurchased: freezed == balanceBeforePurchased
          ? _value.balanceBeforePurchased
          : balanceBeforePurchased // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceAfterPurchased: freezed == balanceAfterPurchased
          ? _value.balanceAfterPurchased
          : balanceAfterPurchased // ignore: cast_nullable_to_non_nullable
              as double?,
      creditsType: freezed == creditsType
          ? _value.creditsType
          : creditsType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDataImplCopyWith<$Res>
    implements $PaymentDataCopyWith<$Res> {
  factory _$$PaymentDataImplCopyWith(
          _$PaymentDataImpl value, $Res Function(_$PaymentDataImpl) then) =
      __$$PaymentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? customerId,
      dynamic transactionId,
      DateTime? transactionDateTime,
      double? creditsPurchased,
      double? balanceBeforePurchased,
      double? balanceAfterPurchased,
      String? creditsType});
}

/// @nodoc
class __$$PaymentDataImplCopyWithImpl<$Res>
    extends _$PaymentDataCopyWithImpl<$Res, _$PaymentDataImpl>
    implements _$$PaymentDataImplCopyWith<$Res> {
  __$$PaymentDataImplCopyWithImpl(
      _$PaymentDataImpl _value, $Res Function(_$PaymentDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? transactionId = freezed,
    Object? transactionDateTime = freezed,
    Object? creditsPurchased = freezed,
    Object? balanceBeforePurchased = freezed,
    Object? balanceAfterPurchased = freezed,
    Object? creditsType = freezed,
  }) {
    return _then(_$PaymentDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transactionDateTime: freezed == transactionDateTime
          ? _value.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      creditsPurchased: freezed == creditsPurchased
          ? _value.creditsPurchased
          : creditsPurchased // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceBeforePurchased: freezed == balanceBeforePurchased
          ? _value.balanceBeforePurchased
          : balanceBeforePurchased // ignore: cast_nullable_to_non_nullable
              as double?,
      balanceAfterPurchased: freezed == balanceAfterPurchased
          ? _value.balanceAfterPurchased
          : balanceAfterPurchased // ignore: cast_nullable_to_non_nullable
              as double?,
      creditsType: freezed == creditsType
          ? _value.creditsType
          : creditsType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PaymentDataImpl implements _PaymentData {
  const _$PaymentDataImpl(
      {this.id,
      this.customerId,
      this.transactionId,
      this.transactionDateTime,
      this.creditsPurchased,
      this.balanceBeforePurchased,
      this.balanceAfterPurchased,
      this.creditsType});

  @override
  final int? id;
  @override
  final String? customerId;
  @override
  final dynamic transactionId;
  @override
  final DateTime? transactionDateTime;
  @override
  final double? creditsPurchased;
  @override
  final double? balanceBeforePurchased;
  @override
  final double? balanceAfterPurchased;
  @override
  final String? creditsType;

  @override
  String toString() {
    return 'PaymentData(id: $id, customerId: $customerId, transactionId: $transactionId, transactionDateTime: $transactionDateTime, creditsPurchased: $creditsPurchased, balanceBeforePurchased: $balanceBeforePurchased, balanceAfterPurchased: $balanceAfterPurchased, creditsType: $creditsType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId) &&
            (identical(other.transactionDateTime, transactionDateTime) ||
                other.transactionDateTime == transactionDateTime) &&
            (identical(other.creditsPurchased, creditsPurchased) ||
                other.creditsPurchased == creditsPurchased) &&
            (identical(other.balanceBeforePurchased, balanceBeforePurchased) ||
                other.balanceBeforePurchased == balanceBeforePurchased) &&
            (identical(other.balanceAfterPurchased, balanceAfterPurchased) ||
                other.balanceAfterPurchased == balanceAfterPurchased) &&
            (identical(other.creditsType, creditsType) ||
                other.creditsType == creditsType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      const DeepCollectionEquality().hash(transactionId),
      transactionDateTime,
      creditsPurchased,
      balanceBeforePurchased,
      balanceAfterPurchased,
      creditsType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      __$$PaymentDataImplCopyWithImpl<_$PaymentDataImpl>(this, _$identity);
}

abstract class _PaymentData implements PaymentData {
  const factory _PaymentData(
      {final int? id,
      final String? customerId,
      final dynamic transactionId,
      final DateTime? transactionDateTime,
      final double? creditsPurchased,
      final double? balanceBeforePurchased,
      final double? balanceAfterPurchased,
      final String? creditsType}) = _$PaymentDataImpl;

  @override
  int? get id;
  @override
  String? get customerId;
  @override
  dynamic get transactionId;
  @override
  DateTime? get transactionDateTime;
  @override
  double? get creditsPurchased;
  @override
  double? get balanceBeforePurchased;
  @override
  double? get balanceAfterPurchased;
  @override
  String? get creditsType;
  @override
  @JsonKey(ignore: true)
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
