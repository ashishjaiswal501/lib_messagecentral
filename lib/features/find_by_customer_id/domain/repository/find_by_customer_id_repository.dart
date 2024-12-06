import 'package:messagecentral/features/find_by_customer_id/domain/entity/find_by_customer_id_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class  FindByCustomerIdRepository {
   Future<DataState< FindByCustomerIdEntity>> findByCustomerId({required String authToken,required String customerId});

}