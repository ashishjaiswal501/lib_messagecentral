import 'package:json_annotation/json_annotation.dart';
part 'user_cache_manager.g.dart';

@JsonSerializable()
class UserCacheManager {
  String authToken;
  String customerId;
  bool isuserAutheticated;

   UserCacheManager({this.authToken = '', this.customerId = '', this.isuserAutheticated=false});

  factory UserCacheManager.fromJson(Map<String, dynamic> json) =>
      _$UserCacheManagerFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserCacheManagerToJson(this);
}
