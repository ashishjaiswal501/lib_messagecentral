// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_balance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletBalanceDto _$WalletBalanceDtoFromJson(Map<String, dynamic> json) {
  return _WalletBalanceDto.fromJson(json);
}

/// @nodoc
mixin _$WalletBalanceDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletBalanceDtoCopyWith<WalletBalanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBalanceDtoCopyWith<$Res> {
  factory $WalletBalanceDtoCopyWith(
          WalletBalanceDto value, $Res Function(WalletBalanceDto) then) =
      _$WalletBalanceDtoCopyWithImpl<$Res, WalletBalanceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$WalletBalanceDtoCopyWithImpl<$Res, $Val extends WalletBalanceDto>
    implements $WalletBalanceDtoCopyWith<$Res> {
  _$WalletBalanceDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$WalletBalanceDtoImplCopyWith<$Res>
    implements $WalletBalanceDtoCopyWith<$Res> {
  factory _$$WalletBalanceDtoImplCopyWith(_$WalletBalanceDtoImpl value,
          $Res Function(_$WalletBalanceDtoImpl) then) =
      __$$WalletBalanceDtoImplCopyWithImpl<$Res>;
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
class __$$WalletBalanceDtoImplCopyWithImpl<$Res>
    extends _$WalletBalanceDtoCopyWithImpl<$Res, _$WalletBalanceDtoImpl>
    implements _$$WalletBalanceDtoImplCopyWith<$Res> {
  __$$WalletBalanceDtoImplCopyWithImpl(_$WalletBalanceDtoImpl _value,
      $Res Function(_$WalletBalanceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$WalletBalanceDtoImpl(
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
class _$WalletBalanceDtoImpl implements _WalletBalanceDto {
  const _$WalletBalanceDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$WalletBalanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletBalanceDtoImplFromJson(json);

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
    return 'WalletBalanceDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletBalanceDtoImpl &&
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
  _$$WalletBalanceDtoImplCopyWith<_$WalletBalanceDtoImpl> get copyWith =>
      __$$WalletBalanceDtoImplCopyWithImpl<_$WalletBalanceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletBalanceDtoImplToJson(
      this,
    );
  }
}

abstract class _WalletBalanceDto implements WalletBalanceDto {
  const factory _WalletBalanceDto(
      {@JsonKey(name: "responseCode") final int? responseCode,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final Data? data}) = _$WalletBalanceDtoImpl;

  factory _WalletBalanceDto.fromJson(Map<String, dynamic> json) =
      _$WalletBalanceDtoImpl.fromJson;

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
  _$$WalletBalanceDtoImplCopyWith<_$WalletBalanceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "customerId")
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "credits")
  double? get credits => throw _privateConstructorUsedError;
  @JsonKey(name: "lastRechargedCredit")
  double? get lastRechargedCredit => throw _privateConstructorUsedError;
  @JsonKey(name: "createdDateTime")
  DateTime? get createdDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedDateTime")
  DateTime? get updatedDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: "minimumCreditsAllowed")
  String? get minimumCreditsAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: "userPaid")
  bool? get userPaid => throw _privateConstructorUsedError;

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
      @JsonKey(name: "credits") double? credits,
      @JsonKey(name: "lastRechargedCredit") double? lastRechargedCredit,
      @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") DateTime? updatedDateTime,
      @JsonKey(name: "minimumCreditsAllowed") String? minimumCreditsAllowed,
      @JsonKey(name: "userPaid") bool? userPaid});
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
    Object? credits = freezed,
    Object? lastRechargedCredit = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? minimumCreditsAllowed = freezed,
    Object? userPaid = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimumCreditsAllowed: freezed == minimumCreditsAllowed
          ? _value.minimumCreditsAllowed
          : minimumCreditsAllowed // ignore: cast_nullable_to_non_nullable
              as String?,
      userPaid: freezed == userPaid
          ? _value.userPaid
          : userPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      @JsonKey(name: "credits") double? credits,
      @JsonKey(name: "lastRechargedCredit") double? lastRechargedCredit,
      @JsonKey(name: "createdDateTime") DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") DateTime? updatedDateTime,
      @JsonKey(name: "minimumCreditsAllowed") String? minimumCreditsAllowed,
      @JsonKey(name: "userPaid") bool? userPaid});
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
    Object? credits = freezed,
    Object? lastRechargedCredit = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? minimumCreditsAllowed = freezed,
    Object? userPaid = freezed,
  }) {
    return _then(_$DataImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      lastRechargedCredit: freezed == lastRechargedCredit
          ? _value.lastRechargedCredit
          : lastRechargedCredit // ignore: cast_nullable_to_non_nullable
              as double?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minimumCreditsAllowed: freezed == minimumCreditsAllowed
          ? _value.minimumCreditsAllowed
          : minimumCreditsAllowed // ignore: cast_nullable_to_non_nullable
              as String?,
      userPaid: freezed == userPaid
          ? _value.userPaid
          : userPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "customerId") this.customerId,
      @JsonKey(name: "credits") this.credits,
      @JsonKey(name: "lastRechargedCredit") this.lastRechargedCredit,
      @JsonKey(name: "createdDateTime") this.createdDateTime,
      @JsonKey(name: "updatedDateTime") this.updatedDateTime,
      @JsonKey(name: "minimumCreditsAllowed") this.minimumCreditsAllowed,
      @JsonKey(name: "userPaid") this.userPaid});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "customerId")
  final String? customerId;
  @override
  @JsonKey(name: "credits")
  final double? credits;
  @override
  @JsonKey(name: "lastRechargedCredit")
  final double? lastRechargedCredit;
  @override
  @JsonKey(name: "createdDateTime")
  final DateTime? createdDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  final DateTime? updatedDateTime;
  @override
  @JsonKey(name: "minimumCreditsAllowed")
  final String? minimumCreditsAllowed;
  @override
  @JsonKey(name: "userPaid")
  final bool? userPaid;

  @override
  String toString() {
    return 'Data(customerId: $customerId, credits: $credits, lastRechargedCredit: $lastRechargedCredit, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, minimumCreditsAllowed: $minimumCreditsAllowed, userPaid: $userPaid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.lastRechargedCredit, lastRechargedCredit) ||
                other.lastRechargedCredit == lastRechargedCredit) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.minimumCreditsAllowed, minimumCreditsAllowed) ||
                other.minimumCreditsAllowed == minimumCreditsAllowed) &&
            (identical(other.userPaid, userPaid) ||
                other.userPaid == userPaid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      credits,
      lastRechargedCredit,
      createdDateTime,
      updatedDateTime,
      minimumCreditsAllowed,
      userPaid);

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
      @JsonKey(name: "credits") final double? credits,
      @JsonKey(name: "lastRechargedCredit") final double? lastRechargedCredit,
      @JsonKey(name: "createdDateTime") final DateTime? createdDateTime,
      @JsonKey(name: "updatedDateTime") final DateTime? updatedDateTime,
      @JsonKey(name: "minimumCreditsAllowed")
      final String? minimumCreditsAllowed,
      @JsonKey(name: "userPaid") final bool? userPaid}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "customerId")
  String? get customerId;
  @override
  @JsonKey(name: "credits")
  double? get credits;
  @override
  @JsonKey(name: "lastRechargedCredit")
  double? get lastRechargedCredit;
  @override
  @JsonKey(name: "createdDateTime")
  DateTime? get createdDateTime;
  @override
  @JsonKey(name: "updatedDateTime")
  DateTime? get updatedDateTime;
  @override
  @JsonKey(name: "minimumCreditsAllowed")
  String? get minimumCreditsAllowed;
  @override
  @JsonKey(name: "userPaid")
  bool? get userPaid;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
