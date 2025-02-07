import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_orders/domin/repository/base_my_request_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyordersUseCase extends BaseUseCases<MyRequestEntity, MyordersParameters> {
  BaseMyRequestRepository baseRequestRepository;

  GetMyordersUseCase({required this.baseRequestRepository});
  @override
  Future<Either<Failure, MyRequestEntity>> call(parameters) async {
    return await baseRequestRepository.getRequest(myordersParameters: parameters);
  }
}

class MyordersParameters extends Equatable {
  final int page;
  final int limit;

  const MyordersParameters({this.page = 1, this.limit = 1000});

  Map<String, dynamic> toMap() => {
        "page": page,
        "limit": limit,
      };

  @override
  List<Object?> get props => [page, limit];
}
