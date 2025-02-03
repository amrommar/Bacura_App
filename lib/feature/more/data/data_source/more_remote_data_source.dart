import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/domain/usecases/suggetions_use_case.dart';

abstract class BaseMoreRemoteDataSource {
  Future<void> sendSuggestion(SuggestionsParameter suggestionsParameter);
}

class MoreRemoteDataSource implements BaseMoreRemoteDataSource {
  @override
  Future<void> sendSuggestion(SuggestionsParameter suggestionsParameter) async {
    await ApiClient().apiCall(
      requestType: RequestType.POST,
      url: ApiEndPoint.postSuggestions,
      body: suggestionsParameter.toMap(),
    );
  }
}
