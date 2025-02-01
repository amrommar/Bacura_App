import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_requests/domin/repository/base_my_request_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyRequestsUseCase extends BaseUseCases<MyRequestEntity, MyRequestsParameters> {
  BaseMyRequestRepository baseRequestRepository;

  GetMyRequestsUseCase({required this.baseRequestRepository});
  @override
  Future<Either<Failure, MyRequestEntity>> call(parameters) async {
    return await baseRequestRepository.getRequest(myRequestsParameters: parameters);
  }
}

class MyRequestsParameters extends Equatable {
  final int page;
  final int limit;

  const MyRequestsParameters({this.page = 1, this.limit = 1000});

  Map<String, dynamic> toMap() => {
        "page": page,
        "limit": limit,
      };

  @override
  List<Object?> get props => [page, limit];
}
