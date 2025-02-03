import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/data/data_source/more_remote_data_source.dart';
import 'package:bacura_app/feature/more/domain/repositories/base_more_repository.dart';
import 'package:bacura_app/feature/more/domain/usecases/suggetions_use_case.dart';
import 'package:dartz/dartz.dart';

class MoreRepository extends BaseMoreRepository {
  final BaseMoreRemoteDataSource baseMoreRemoteDataSource;

  MoreRepository({required this.baseMoreRemoteDataSource});

  @override
  Future<Either<Failure, void>> sendSuggestions({required SuggestionsParameter suggestionsParameter}) async {
    try {
      return Right(await baseMoreRemoteDataSource.sendSuggestion(suggestionsParameter));
    } on Failure catch (ex) {
      return Left(ServerFailure(code: ex.code, message: ex.message));
    }
  }
}
