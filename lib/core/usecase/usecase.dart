import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call({Params pramas});
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}
