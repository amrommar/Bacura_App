import 'package:bacura_app/core/error/failaure.dart';
import 'package:bacura_app/feature/more/domain/usecases/complaints_use_case.dart';
import 'package:bacura_app/feature/more/domain/usecases/suggetions_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMoreRepository {
  Future<Either<Failure, void>> sendSuggestions({required SuggestionsParameter suggestionsParameter});

  Future<Either<Failure, void>> sendComplaints({required ComplaintsParameter complaintsParameter});
}
