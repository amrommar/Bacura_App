import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domin/entity/my_request_data_entity.dart';
import 'package:bacura_app/feature/my_orders/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_orders/domin/use_case/get_my_orders_use_case.dart';

class MyordersProvider with ChangeNotifier {
  late MyRequestEntity myRequestEntity;
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingMyorders = true;
  int pageNumber = 1;
  List<String> _selectedFilters = [];
  List<String> get selectedFilters => _selectedFilters;

  MyordersProvider() {
    init();
  }

  init() async {
    await getMyorders();
  }

  Future<void> getMyorders({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();
    (await sl<GetMyordersUseCase>()(
      MyordersParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    ))
        .fold((l) async {
      //! handle in error
    }, (r) {
      if (r.myRequestDataEntity.isEmpty) {
        isFinishedPaging = true;
        isLoadingMyorders = false;
        notifyListeners();
      } else if (isLoadingMore) {
        myRequestEntity.myRequestDataEntity.addAll(r.myRequestDataEntity);
        this.isLoadingMore = false;
        notifyListeners();
      } else {
        myRequestEntity = r;
        isLoadingMyorders = false;
        notifyListeners();
      }
    });
  }

  loadMoreMyorders() async {
    if (isFinishedPaging) return;
    pageNumber++;
    isLoadingMore = true;
    notifyListeners();
    await getMyorders(isLoadingMore: true);
    isLoadingMore = false;
    notifyListeners();
  }

  void setSelectedFilters(List<String> filters) {
    _selectedFilters = filters;
    notifyListeners();
  }

  List<MyRequestDataEntity> get filteredorders {
    if (_selectedFilters.isEmpty) {
      return myRequestEntity.myRequestDataEntity;
    }
    return myRequestEntity.myRequestDataEntity.where((request) {
      return _selectedFilters.contains(request.status);
    }).toList();
  }
}
