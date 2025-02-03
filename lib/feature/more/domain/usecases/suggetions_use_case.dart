import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/domain/repositories/base_more_repository.dart';
import 'package:dartz/dartz.dart';

class SuggestionsUseCase extends BaseUseCases<void, SuggestionsParameter> {
  final BaseMoreRepository baseMoreRepository;

  SuggestionsUseCase({required this.baseMoreRepository});

  @override
  Future<Either<Failure, void>> call(SuggestionsParameter parameters) {
    return baseMoreRepository.sendSuggestions(suggestionsParameter: parameters);
  }
}

class SuggestionsParameter extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String suggestion;

  const SuggestionsParameter({
    required this.name,
    required this.phone,
    required this.email,
    required this.suggestion,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'phone': phone,
        'email': email,
        'suggestion': suggestion,
      };

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        suggestion,
      ];
}
