// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'low_balance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LowBalanceDto _$LowBalanceDtoFromJson(Map<String, dynamic> json) {
  return _LowBalanceDto.fromJson(json);
}

/// @nodoc
mixin _$LowBalanceDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LowBalanceDtoCopyWith<LowBalanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LowBalanceDtoCopyWith<$Res> {
  factory $LowBalanceDtoCopyWith(
          LowBalanceDto value, $Res Function(LowBalanceDto) then) =
      _$LowBalanceDtoCopyWithImpl<$Res, LowBalanceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LowBalanceDtoCopyWithImpl<$Res, $Val extends LowBalanceDto>
    implements $LowBalanceDtoCopyWith<$Res> {
  _$LowBalanceDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$LowBalanceDtoImplCopyWith<$Res>
    implements $LowBalanceDtoCopyWith<$Res> {
  factory _$$LowBalanceDtoImplCopyWith(
          _$LowBalanceDtoImpl value, $Res Function(_$LowBalanceDtoImpl) then) =
      __$$LowBalanceDtoImplCopyWithImpl<$Res>;
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
class __$$LowBalanceDtoImplCopyWithImpl<$Res>
    extends _$LowBalanceDtoCopyWithImpl<$Res, _$LowBalanceDtoImpl>
    implements _$$LowBalanceDtoImplCopyWith<$Res> {
  __$$LowBalanceDtoImplCopyWithImpl(
      _$LowBalanceDtoImpl _value, $Res Function(_$LowBalanceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LowBalanceDtoImpl(
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
class _$LowBalanceDtoImpl implements _LowBalanceDto {
  const _$LowBalanceDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$LowBalanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LowBalanceDtoImplFromJson(json);

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
    return 'LowBalanceDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LowBalanceDtoImpl &&
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
  _$$LowBalanceDtoImplCopyWith<_$LowBalanceDtoImpl> get copyWith =>
      __$$LowBalanceDtoImplCopyWithImpl<_$LowBalanceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LowBalanceDtoImplToJson(
      this,
    );
  }
}

abstract class _LowBalanceDto implements LowBalanceDto {
  const factory _LowBalanceDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$LowBalanceDtoImpl;

  factory _LowBalanceDto.fromJson(Map<String, dynamic> json) =
      _$LowBalanceDtoImpl.fromJson;

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
  _$$LowBalanceDtoImplCopyWith<_$LowBalanceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "alertAmount")
  int? get alertAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "alternaletcountryCode_1")
  dynamic get alternaletcountryCode1 => throw _privateConstructorUsedError;
  @JsonKey(name: "alternatePhoneNo_1")
  dynamic get alternatePhoneNo1 => throw _privateConstructorUsedError;
  @JsonKey(name: "alternaletcountryCode_2")
  dynamic get alternaletcountryCode2 => throw _privateConstructorUsedError;
  @JsonKey(name: "alternatePhoneNo_2")
  dynamic get alternatePhoneNo2 => throw _privateConstructorUsedError;
  @JsonKey(name: "lowBalanceAlertFlag")
  bool? get lowBalanceAlertFlag => throw _privateConstructorUsedError;
  @JsonKey(name: "islowBalanceAlertSent")
  bool? get islowBalanceAlertSent => throw _privateConstructorUsedError;
  @JsonKey(name: "lowBalanceAlertSentDateTime")
  dynamic get lowBalanceAlertSentDateTime => throw _privateConstructorUsedError;

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
      @JsonKey(name: "alertAmount") int? alertAmount,
      @JsonKey(name: "alternaletcountryCode_1") dynamic alternaletcountryCode1,
      @JsonKey(name: "alternatePhoneNo_1") dynamic alternatePhoneNo1,
      @JsonKey(name: "alternaletcountryCode_2") dynamic alternaletcountryCode2,
      @JsonKey(name: "alternatePhoneNo_2") dynamic alternatePhoneNo2,
      @JsonKey(name: "lowBalanceAlertFlag") bool? lowBalanceAlertFlag,
      @JsonKey(name: "islowBalanceAlertSent") bool? islowBalanceAlertSent,
      @JsonKey(name: "lowBalanceAlertSentDateTime")
      dynamic lowBalanceAlertSentDateTime});
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
    Object? alertAmount = freezed,
    Object? alternaletcountryCode1 = freezed,
    Object? alternatePhoneNo1 = freezed,
    Object? alternaletcountryCode2 = freezed,
    Object? alternatePhoneNo2 = freezed,
    Object? lowBalanceAlertFlag = freezed,
    Object? islowBalanceAlertSent = freezed,
    Object? lowBalanceAlertSentDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      alertAmount: freezed == alertAmount
          ? _value.alertAmount
          : alertAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      alternaletcountryCode1: freezed == alternaletcountryCode1
          ? _value.alternaletcountryCode1
          : alternaletcountryCode1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo1: freezed == alternatePhoneNo1
          ? _value.alternatePhoneNo1
          : alternatePhoneNo1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternaletcountryCode2: freezed == alternaletcountryCode2
          ? _value.alternaletcountryCode2
          : alternaletcountryCode2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo2: freezed == alternatePhoneNo2
          ? _value.alternatePhoneNo2
          : alternatePhoneNo2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lowBalanceAlertFlag: freezed == lowBalanceAlertFlag
          ? _value.lowBalanceAlertFlag
          : lowBalanceAlertFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      islowBalanceAlertSent: freezed == islowBalanceAlertSent
          ? _value.islowBalanceAlertSent
          : islowBalanceAlertSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowBalanceAlertSentDateTime: freezed == lowBalanceAlertSentDateTime
          ? _value.lowBalanceAlertSentDateTime
          : lowBalanceAlertSentDateTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      @JsonKey(name: "alertAmount") int? alertAmount,
      @JsonKey(name: "alternaletcountryCode_1") dynamic alternaletcountryCode1,
      @JsonKey(name: "alternatePhoneNo_1") dynamic alternatePhoneNo1,
      @JsonKey(name: "alternaletcountryCode_2") dynamic alternaletcountryCode2,
      @JsonKey(name: "alternatePhoneNo_2") dynamic alternatePhoneNo2,
      @JsonKey(name: "lowBalanceAlertFlag") bool? lowBalanceAlertFlag,
      @JsonKey(name: "islowBalanceAlertSent") bool? islowBalanceAlertSent,
      @JsonKey(name: "lowBalanceAlertSentDateTime")
      dynamic lowBalanceAlertSentDateTime});
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
    Object? alertAmount = freezed,
    Object? alternaletcountryCode1 = freezed,
    Object? alternatePhoneNo1 = freezed,
    Object? alternaletcountryCode2 = freezed,
    Object? alternatePhoneNo2 = freezed,
    Object? lowBalanceAlertFlag = freezed,
    Object? islowBalanceAlertSent = freezed,
    Object? lowBalanceAlertSentDateTime = freezed,
  }) {
    return _then(_$DataImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      alertAmount: freezed == alertAmount
          ? _value.alertAmount
          : alertAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      alternaletcountryCode1: freezed == alternaletcountryCode1
          ? _value.alternaletcountryCode1
          : alternaletcountryCode1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo1: freezed == alternatePhoneNo1
          ? _value.alternatePhoneNo1
          : alternatePhoneNo1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternaletcountryCode2: freezed == alternaletcountryCode2
          ? _value.alternaletcountryCode2
          : alternaletcountryCode2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alternatePhoneNo2: freezed == alternatePhoneNo2
          ? _value.alternatePhoneNo2
          : alternatePhoneNo2 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lowBalanceAlertFlag: freezed == lowBalanceAlertFlag
          ? _value.lowBalanceAlertFlag
          : lowBalanceAlertFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      islowBalanceAlertSent: freezed == islowBalanceAlertSent
          ? _value.islowBalanceAlertSent
          : islowBalanceAlertSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowBalanceAlertSentDateTime: freezed == lowBalanceAlertSentDateTime
          ? _value.lowBalanceAlertSentDateTime
          : lowBalanceAlertSentDateTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "alertAmount") this.alertAmount,
      @JsonKey(name: "alternaletcountryCode_1") this.alternaletcountryCode1,
      @JsonKey(name: "alternatePhoneNo_1") this.alternatePhoneNo1,
      @JsonKey(name: "alternaletcountryCode_2") this.alternaletcountryCode2,
      @JsonKey(name: "alternatePhoneNo_2") this.alternatePhoneNo2,
      @JsonKey(name: "lowBalanceAlertFlag") this.lowBalanceAlertFlag,
      @JsonKey(name: "islowBalanceAlertSent") this.islowBalanceAlertSent,
      @JsonKey(name: "lowBalanceAlertSentDateTime")
      this.lowBalanceAlertSentDateTime});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "alertAmount")
  final int? alertAmount;
  @override
  @JsonKey(name: "alternaletcountryCode_1")
  final dynamic alternaletcountryCode1;
  @override
  @JsonKey(name: "alternatePhoneNo_1")
  final dynamic alternatePhoneNo1;
  @override
  @JsonKey(name: "alternaletcountryCode_2")
  final dynamic alternaletcountryCode2;
  @override
  @JsonKey(name: "alternatePhoneNo_2")
  final dynamic alternatePhoneNo2;
  @override
  @JsonKey(name: "lowBalanceAlertFlag")
  final bool? lowBalanceAlertFlag;
  @override
  @JsonKey(name: "islowBalanceAlertSent")
  final bool? islowBalanceAlertSent;
  @override
  @JsonKey(name: "lowBalanceAlertSentDateTime")
  final dynamic lowBalanceAlertSentDateTime;

  @override
  String toString() {
    return 'Data(customerId: $customerId, alertAmount: $alertAmount, alternaletcountryCode1: $alternaletcountryCode1, alternatePhoneNo1: $alternatePhoneNo1, alternaletcountryCode2: $alternaletcountryCode2, alternatePhoneNo2: $alternatePhoneNo2, lowBalanceAlertFlag: $lowBalanceAlertFlag, islowBalanceAlertSent: $islowBalanceAlertSent, lowBalanceAlertSentDateTime: $lowBalanceAlertSentDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.alertAmount, alertAmount) ||
                other.alertAmount == alertAmount) &&
            const DeepCollectionEquality()
                .equals(other.alternaletcountryCode1, alternaletcountryCode1) &&
            const DeepCollectionEquality()
                .equals(other.alternatePhoneNo1, alternatePhoneNo1) &&
            const DeepCollectionEquality()
                .equals(other.alternaletcountryCode2, alternaletcountryCode2) &&
            const DeepCollectionEquality()
                .equals(other.alternatePhoneNo2, alternatePhoneNo2) &&
            (identical(other.lowBalanceAlertFlag, lowBalanceAlertFlag) ||
                other.lowBalanceAlertFlag == lowBalanceAlertFlag) &&
            (identical(other.islowBalanceAlertSent, islowBalanceAlertSent) ||
                other.islowBalanceAlertSent == islowBalanceAlertSent) &&
            const DeepCollectionEquality().equals(
                other.lowBalanceAlertSentDateTime,
                lowBalanceAlertSentDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      alertAmount,
      const DeepCollectionEquality().hash(alternaletcountryCode1),
      const DeepCollectionEquality().hash(alternatePhoneNo1),
      const DeepCollectionEquality().hash(alternaletcountryCode2),
      const DeepCollectionEquality().hash(alternatePhoneNo2),
      lowBalanceAlertFlag,
      islowBalanceAlertSent,
      const DeepCollectionEquality().hash(lowBalanceAlertSentDateTime));

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
      @JsonKey(name: "alertAmount") final int? alertAmount,
      @JsonKey(name: "alternaletcountryCode_1")
      final dynamic alternaletcountryCode1,
      @JsonKey(name: "alternatePhoneNo_1") final dynamic alternatePhoneNo1,
      @JsonKey(name: "alternaletcountryCode_2")
      final dynamic alternaletcountryCode2,
      @JsonKey(name: "alternatePhoneNo_2") final dynamic alternatePhoneNo2,
      @JsonKey(name: "lowBalanceAlertFlag") final bool? lowBalanceAlertFlag,
      @JsonKey(name: "islowBalanceAlertSent") final bool? islowBalanceAlertSent,
      @JsonKey(name: "lowBalanceAlertSentDateTime")
      final dynamic lowBalanceAlertSentDateTime}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "alertAmount")
  int? get alertAmount;
  @override
  @JsonKey(name: "alternaletcountryCode_1")
  dynamic get alternaletcountryCode1;
  @override
  @JsonKey(name: "alternatePhoneNo_1")
  dynamic get alternatePhoneNo1;
  @override
  @JsonKey(name: "alternaletcountryCode_2")
  dynamic get alternaletcountryCode2;
  @override
  @JsonKey(name: "alternatePhoneNo_2")
  dynamic get alternatePhoneNo2;
  @override
  @JsonKey(name: "lowBalanceAlertFlag")
  bool? get lowBalanceAlertFlag;
  @override
  @JsonKey(name: "islowBalanceAlertSent")
  bool? get islowBalanceAlertSent;
  @override
  @JsonKey(name: "lowBalanceAlertSentDateTime")
  dynamic get lowBalanceAlertSentDateTime;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
