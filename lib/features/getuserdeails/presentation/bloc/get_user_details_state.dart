import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/getuserdeails/domain/enitity/get_user_details_entity.dart';

class GetUserDetailsState extends Equatable {
  final GetUserDetailsEntity? getUserDetailsEntity;
  final String? dioError;
  const GetUserDetailsState({this.getUserDetailsEntity, this.dioError});
  @override
  
  List<Object?> get props => [getUserDetailsEntity];
}

class GetUserDetailsStateInitial extends GetUserDetailsState {
  const GetUserDetailsStateInitial();
}

class GetUserDetailsStateLoading extends GetUserDetailsState {
  const GetUserDetailsStateLoading();
}

class GetUserDetailsStateError extends GetUserDetailsState {
  const GetUserDetailsStateError( String dioError):super(dioError: dioError);
}

class GetUserDetailsStateSuccess extends GetUserDetailsState {
  const GetUserDetailsStateSuccess(
    GetUserDetailsEntity getUserDetailsEntity,
  ) : super(getUserDetailsEntity: getUserDetailsEntity);
}
