import 'package:messagecentral/features/getuserdeails/data/repository/get_user_details_repository.dart';
import 'package:messagecentral/features/getuserdeails/domain/enitity/get_user_details_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class GetUserDetailsUsecase
    implements UseCase<DataState<GetUserDetailsEntity>, String> {
  final GetUserDetailsRepository getUserDetailsRepository;
  GetUserDetailsUsecase(this.getUserDetailsRepository);

  @override
  Future<DataState<GetUserDetailsEntity>> call({String? pramas}) {
    return getUserDetailsRepository.getUserDetails(authToken: pramas!);
  }
}
