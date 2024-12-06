import 'package:messagecentral/features/getuserdeails/domain/enitity/get_user_details_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class GetUserDetailsRepository {
   Future<DataState<GetUserDetailsEntity>> getUserDetails({required String authToken});

}