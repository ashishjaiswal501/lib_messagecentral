// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_offer_update_eligibility_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckOfferUpdateEligibilityDto _$CheckOfferUpdateEligibilityDtoFromJson(
    Map<String, dynamic> json) {
  return _CheckOfferUpdateEligibilityDto.fromJson(json);
}

/// @nodoc
mixin _$CheckOfferUpdateEligibilityDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckOfferUpdateEligibilityDtoCopyWith<CheckOfferUpdateEligibilityDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOfferUpdateEligibilityDtoCopyWith<$Res> {
  factory $CheckOfferUpdateEligibilityDtoCopyWith(
          CheckOfferUpdateEligibilityDto value,
          $Res Function(CheckOfferUpdateEligibilityDto) then) =
      _$CheckOfferUpdateEligibilityDtoCopyWithImpl<$Res,
          CheckOfferUpdateEligibilityDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CheckOfferUpdateEligibilityDtoCopyWithImpl<$Res,
        $Val extends CheckOfferUpdateEligibilityDto>
    implements $CheckOfferUpdateEligibilityDtoCopyWith<$Res> {
  _$CheckOfferUpdateEligibilityDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$CheckOfferUpdateEligibilityDtoImplCopyWith<$Res>
    implements $CheckOfferUpdateEligibilityDtoCopyWith<$Res> {
  factory _$$CheckOfferUpdateEligibilityDtoImplCopyWith(
          _$CheckOfferUpdateEligibilityDtoImpl value,
          $Res Function(_$CheckOfferUpdateEligibilityDtoImpl) then) =
      __$$CheckOfferUpdateEligibilityDtoImplCopyWithImpl<$Res>;
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
class __$$CheckOfferUpdateEligibilityDtoImplCopyWithImpl<$Res>
    extends _$CheckOfferUpdateEligibilityDtoCopyWithImpl<$Res,
        _$CheckOfferUpdateEligibilityDtoImpl>
    implements _$$CheckOfferUpdateEligibilityDtoImplCopyWith<$Res> {
  __$$CheckOfferUpdateEligibilityDtoImplCopyWithImpl(
      _$CheckOfferUpdateEligibilityDtoImpl _value,
      $Res Function(_$CheckOfferUpdateEligibilityDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CheckOfferUpdateEligibilityDtoImpl(
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
class _$CheckOfferUpdateEligibilityDtoImpl
    implements _CheckOfferUpdateEligibilityDto {
  const _$CheckOfferUpdateEligibilityDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$CheckOfferUpdateEligibilityDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CheckOfferUpdateEligibilityDtoImplFromJson(json);

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
    return 'CheckOfferUpdateEligibilityDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOfferUpdateEligibilityDtoImpl &&
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
  _$$CheckOfferUpdateEligibilityDtoImplCopyWith<
          _$CheckOfferUpdateEligibilityDtoImpl>
      get copyWith => __$$CheckOfferUpdateEligibilityDtoImplCopyWithImpl<
          _$CheckOfferUpdateEligibilityDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckOfferUpdateEligibilityDtoImplToJson(
      this,
    );
  }
}

abstract class _CheckOfferUpdateEligibilityDto
    implements CheckOfferUpdateEligibilityDto {
  const factory _CheckOfferUpdateEligibilityDto(
          {@JsonKey(name: "responseCode") final int? responseCode,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final Data? data}) =
      _$CheckOfferUpdateEligibilityDtoImpl;

  factory _CheckOfferUpdateEligibilityDto.fromJson(Map<String, dynamic> json) =
      _$CheckOfferUpdateEligibilityDtoImpl.fromJson;

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
  _$$CheckOfferUpdateEligibilityDtoImplCopyWith<
          _$CheckOfferUpdateEligibilityDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "endDate")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "Username")
  String? get username => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "Username") String? username});
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
    Object? endDate = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "Username") String? username});
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
    Object? endDate = freezed,
    Object? username = freezed,
  }) {
    return _then(_$DataImpl(
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: "endDate") this.endDate,
      @JsonKey(name: "Username") this.username});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "endDate")
  final DateTime? endDate;
  @override
  @JsonKey(name: "Username")
  final String? username;

  @override
  String toString() {
    return 'Data(endDate: $endDate, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, endDate, username);

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
      {@JsonKey(name: "endDate") final DateTime? endDate,
      @JsonKey(name: "Username") final String? username}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "endDate")
  DateTime? get endDate;
  @override
  @JsonKey(name: "Username")
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
