import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_requests/domin/use_case/get_my_requests_use_case.dart';

class MyRequestsProvider with ChangeNotifier {
  late MyRequestEntity myRequestEntity;
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingMyRequests = true;
  int pageNumber = 1;

  MyRequestsProvider() {
    init();
  }

  init() async {
    await getMyRequests();
  }

  Future<void> getMyRequests({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();
    (await sl<GetMyRequestsUseCase>()(
      MyRequestsParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    ))
        .fold((l) async {
      //! handle in error
    }, (r) {
      if (r.myRequestDataEntity.isEmpty) {
        isFinishedPaging = true;
        isLoadingMyRequests = false;
        notifyListeners();
      } else if (isLoadingMore) {
        myRequestEntity.myRequestDataEntity.addAll(r.myRequestDataEntity);
        this.isLoadingMore = false;
        notifyListeners();
      } else {
        myRequestEntity = r;
        isLoadingMyRequests = false;
        notifyListeners();
      }
    });
  }

  loadMoreMyRequests() async {
    pageNumber++;
    isLoadingMore = true;
    notifyListeners();
    await getMyRequests(isLoadingMore: true);
    isLoadingMore = false;
    notifyListeners();
  }
}
