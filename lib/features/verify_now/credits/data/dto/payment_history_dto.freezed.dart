// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentHistoryDto _$PaymentHistoryDtoFromJson(Map<String, dynamic> json) {
  return _PaymentHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentHistoryDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentHistoryDtoCopyWith<PaymentHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryDtoCopyWith<$Res> {
  factory $PaymentHistoryDtoCopyWith(
          PaymentHistoryDto value, $Res Function(PaymentHistoryDto) then) =
      _$PaymentHistoryDtoCopyWithImpl<$Res, PaymentHistoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<Datum>? data});
}

/// @nodoc
class _$PaymentHistoryDtoCopyWithImpl<$Res, $Val extends PaymentHistoryDto>
    implements $PaymentHistoryDtoCopyWith<$Res> {
  _$PaymentHistoryDtoCopyWithImpl(this._value, this._then);

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
              as List<Datum>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentHistoryDtoImplCopyWith<$Res>
    implements $PaymentHistoryDtoCopyWith<$Res> {
  factory _$$PaymentHistoryDtoImplCopyWith(_$PaymentHistoryDtoImpl value,
          $Res Function(_$PaymentHistoryDtoImpl) then) =
      __$$PaymentHistoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<Datum>? data});
}

/// @nodoc
class __$$PaymentHistoryDtoImplCopyWithImpl<$Res>
    extends _$PaymentHistoryDtoCopyWithImpl<$Res, _$PaymentHistoryDtoImpl>
    implements _$$PaymentHistoryDtoImplCopyWith<$Res> {
  __$$PaymentHistoryDtoImplCopyWithImpl(_$PaymentHistoryDtoImpl _value,
      $Res Function(_$PaymentHistoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PaymentHistoryDtoImpl(
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
              as List<Datum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentHistoryDtoImpl implements _PaymentHistoryDto {
  const _$PaymentHistoryDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") final List<Datum>? data})
      : _data = data;

  factory _$PaymentHistoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentHistoryDtoImplFromJson(json);

  @override
  @JsonKey(name: "responseCode")
  final int? responseCode;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<Datum>? _data;
  @override
  @JsonKey(name: "data")
  List<Datum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentHistoryDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryDtoImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryDtoImplCopyWith<_$PaymentHistoryDtoImpl> get copyWith =>
      __$$PaymentHistoryDtoImplCopyWithImpl<_$PaymentHistoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentHistoryDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentHistoryDto implements PaymentHistoryDto {
  const factory _PaymentHistoryDto(
          {@JsonKey(name: "responseCode") final int? responseCode,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final List<Datum>? data}) =
      _$PaymentHistoryDtoImpl;

  factory _PaymentHistoryDto.fromJson(Map<String, dynamic> json) =
      _$PaymentHistoryDtoImpl.fromJson;

  @override
  @JsonKey(name: "responseCode")
  int? get responseCode;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  List<Datum>? get data;
  @override
  @JsonKey(ignore: true)
  _$$PaymentHistoryDtoImplCopyWith<_$PaymentHistoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "transactionId")
  dynamic get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: "transactionDateTime")
  DateTime? get transactionDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "creditsPurchased")
  double? get creditsPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: "balanceBeforePurchased")
  double? get balanceBeforePurchased => throw _privateConstructorUsedError;
  @JsonKey(name: "balanceAfterPurchased")
  double? get balanceAfterPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: "creditsType")
  String? get creditsType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "transactionId") dynamic transactionId,
      @JsonKey(name: "transactionDateTime") DateTime? transactionDateTime,
      @JsonKey(name: "creditsPurchased") double? creditsPurchased,
      @JsonKey(name: "balanceBeforePurchased") double? balanceBeforePurchased,
      @JsonKey(name: "balanceAfterPurchased") double? balanceAfterPurchased,
      @JsonKey(name: "creditsType") String? creditsType});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

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
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "customerId") String? customerId,
      @JsonKey(name: "transactionId") dynamic transactionId,
      @JsonKey(name: "transactionDateTime") DateTime? transactionDateTime,
      @JsonKey(name: "creditsPurchased") double? creditsPurchased,
      @JsonKey(name: "balanceBeforePurchased") double? balanceBeforePurchased,
      @JsonKey(name: "balanceAfterPurchased") double? balanceAfterPurchased,
      @JsonKey(name: "creditsType") String? creditsType});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
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
    return _then(_$DatumImpl(
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
@JsonSerializable()
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "transactionId") this.transactionId,
      @JsonKey(name: "transactionDateTime") this.transactionDateTime,
      @JsonKey(name: "creditsPurchased") this.creditsPurchased,
      @JsonKey(name: "balanceBeforePurchased") this.balanceBeforePurchased,
      @JsonKey(name: "balanceAfterPurchased") this.balanceAfterPurchased,
      @JsonKey(name: "creditsType") this.creditsType});

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "transactionId")
  final dynamic transactionId;
  @override
  @JsonKey(name: "transactionDateTime")
  final DateTime? transactionDateTime;
  @override
  @JsonKey(name: "creditsPurchased")
  final double? creditsPurchased;
  @override
  @JsonKey(name: "balanceBeforePurchased")
  final double? balanceBeforePurchased;
  @override
  @JsonKey(name: "balanceAfterPurchased")
  final double? balanceAfterPurchased;
  @override
  @JsonKey(name: "creditsType")
  final String? creditsType;

  @override
  String toString() {
    return 'Datum(id: $id, customerId: $customerId, transactionId: $transactionId, transactionDateTime: $transactionDateTime, creditsPurchased: $creditsPurchased, balanceBeforePurchased: $balanceBeforePurchased, balanceAfterPurchased: $balanceAfterPurchased, creditsType: $creditsType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
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

  @JsonKey(ignore: true)
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
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "customerId") final String? customerId,
      @JsonKey(name: "transactionId") final dynamic transactionId,
      @JsonKey(name: "transactionDateTime") final DateTime? transactionDateTime,
      @JsonKey(name: "creditsPurchased") final double? creditsPurchased,
      @JsonKey(name: "balanceBeforePurchased")
      final double? balanceBeforePurchased,
      @JsonKey(name: "balanceAfterPurchased")
      final double? balanceAfterPurchased,
      @JsonKey(name: "creditsType") final String? creditsType}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "transactionId")
  dynamic get transactionId;
  @override
  @JsonKey(name: "transactionDateTime")
  DateTime? get transactionDateTime;
  @override
  @JsonKey(name: "creditsPurchased")
  double? get creditsPurchased;
  @override
  @JsonKey(name: "balanceBeforePurchased")
  double? get balanceBeforePurchased;
  @override
  @JsonKey(name: "balanceAfterPurchased")
  double? get balanceAfterPurchased;
  @override
  @JsonKey(name: "creditsType")
  String? get creditsType;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
