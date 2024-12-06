// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_a_user_update_brand_name_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyAUserUpdateBrandNameDto _$VerifyAUserUpdateBrandNameDtoFromJson(
    Map<String, dynamic> json) {
  return _VerifyAUserUpdateBrandNameDto.fromJson(json);
}

/// @nodoc
mixin _$VerifyAUserUpdateBrandNameDto {
  @JsonKey(name: "responseCode")
  int? get responseCode => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyAUserUpdateBrandNameDtoCopyWith<VerifyAUserUpdateBrandNameDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyAUserUpdateBrandNameDtoCopyWith<$Res> {
  factory $VerifyAUserUpdateBrandNameDtoCopyWith(
          VerifyAUserUpdateBrandNameDto value,
          $Res Function(VerifyAUserUpdateBrandNameDto) then) =
      _$VerifyAUserUpdateBrandNameDtoCopyWithImpl<$Res,
          VerifyAUserUpdateBrandNameDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") dynamic data});
}

/// @nodoc
class _$VerifyAUserUpdateBrandNameDtoCopyWithImpl<$Res,
        $Val extends VerifyAUserUpdateBrandNameDto>
    implements $VerifyAUserUpdateBrandNameDtoCopyWith<$Res> {
  _$VerifyAUserUpdateBrandNameDtoCopyWithImpl(this._value, this._then);

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
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyAUserUpdateBrandNameDtoImplCopyWith<$Res>
    implements $VerifyAUserUpdateBrandNameDtoCopyWith<$Res> {
  factory _$$VerifyAUserUpdateBrandNameDtoImplCopyWith(
          _$VerifyAUserUpdateBrandNameDtoImpl value,
          $Res Function(_$VerifyAUserUpdateBrandNameDtoImpl) then) =
      __$$VerifyAUserUpdateBrandNameDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "responseCode") int? responseCode,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") dynamic data});
}

/// @nodoc
class __$$VerifyAUserUpdateBrandNameDtoImplCopyWithImpl<$Res>
    extends _$VerifyAUserUpdateBrandNameDtoCopyWithImpl<$Res,
        _$VerifyAUserUpdateBrandNameDtoImpl>
    implements _$$VerifyAUserUpdateBrandNameDtoImplCopyWith<$Res> {
  __$$VerifyAUserUpdateBrandNameDtoImplCopyWithImpl(
      _$VerifyAUserUpdateBrandNameDtoImpl _value,
      $Res Function(_$VerifyAUserUpdateBrandNameDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$VerifyAUserUpdateBrandNameDtoImpl(
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
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyAUserUpdateBrandNameDtoImpl
    implements _VerifyAUserUpdateBrandNameDto {
  const _$VerifyAUserUpdateBrandNameDtoImpl(
      {@JsonKey(name: "responseCode") this.responseCode,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.data});

  factory _$VerifyAUserUpdateBrandNameDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyAUserUpdateBrandNameDtoImplFromJson(json);

  @override
  @JsonKey(name: "responseCode")
  final int? responseCode;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final dynamic data;

  @override
  String toString() {
    return 'VerifyAUserUpdateBrandNameDto(responseCode: $responseCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyAUserUpdateBrandNameDtoImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyAUserUpdateBrandNameDtoImplCopyWith<
          _$VerifyAUserUpdateBrandNameDtoImpl>
      get copyWith => __$$VerifyAUserUpdateBrandNameDtoImplCopyWithImpl<
          _$VerifyAUserUpdateBrandNameDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyAUserUpdateBrandNameDtoImplToJson(
      this,
    );
  }
}

abstract class _VerifyAUserUpdateBrandNameDto
    implements VerifyAUserUpdateBrandNameDto {
  const factory _VerifyAUserUpdateBrandNameDto(
          {@JsonKey(name: "responseCode") final int? responseCode,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final dynamic data}) =
      _$VerifyAUserUpdateBrandNameDtoImpl;

  factory _VerifyAUserUpdateBrandNameDto.fromJson(Map<String, dynamic> json) =
      _$VerifyAUserUpdateBrandNameDtoImpl.fromJson;

  @override
  @JsonKey(name: "responseCode")
  int? get responseCode;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$VerifyAUserUpdateBrandNameDtoImplCopyWith<
          _$VerifyAUserUpdateBrandNameDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
