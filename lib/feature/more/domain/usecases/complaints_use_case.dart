import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/domain/repositories/base_more_repository.dart';
import 'package:dartz/dartz.dart';

class ComplaintsUseCase extends BaseUseCases<void, ComplaintsParameter> {
  final BaseMoreRepository baseMoreRepository;

  ComplaintsUseCase({required this.baseMoreRepository});

  @override
  Future<Either<Failure, void>> call(ComplaintsParameter parameters) {
    return baseMoreRepository.sendComplaints(complaintsParameter: parameters);
  }
}

class ComplaintsParameter extends Equatable {
  final String complaint;
  final String type;

  const ComplaintsParameter({
    required this.complaint,
    required this.type,
  });

  Map<String, dynamic> toMap() => {
        'complain': complaint,
        'type': type,
      };

  @override
  List<Object?> get props => [
        complaint,
        type,
      ];
}
