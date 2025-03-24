import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/cancel_order_use_case.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/get_my_orders_use_case.dart';

class MyOrderProvider with ChangeNotifier {
  MyOrderEntity myOrderEntity = const MyOrderEntity(
    myOrderDataEntity: [],
    limit: 10,
    page: 1,
    totalRecords: 0,
    totalPages: 0,
    nextPageLink: null,
    previousPageLink: null,
  );
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingMyOrders = true;
  int pageNumber = 1;
  List<String> _selectedFilters = [];

  List<String> get selectedFilters => _selectedFilters;

  MyOrderProvider() {
    init();
  }

  init() async {
    await _getMyOrders();
  }

  refresh() async {
    isFinishedPaging = false;
    isLoadingMyOrders = true;
    pageNumber = 1;
    myOrderEntity = const MyOrderEntity(
      myOrderDataEntity: [],
      limit: 10,
      page: 1,
      totalRecords: 0,
      totalPages: 0,
      nextPageLink: null,
      previousPageLink: null,
    );
    notifyListeners();

    await _fetchAllPages();
  }

  Future<void> _fetchAllPages() async {
    List<MyOrderDataEntity> allOrders = [];
    int currentPage = 1;
    bool hasMorePages = true;

    while (hasMorePages) {
      final result = await sl<GetMyOrdersUseCase>()(
        MyOrdersParameters(
          page: currentPage,
          limit: AppConstants.defaultPageSize,
        ),
      );

      result.fold((l) {
        hasMorePages = false;
      }, (r) {
        if (r.myOrderDataEntity.isEmpty) {
          hasMorePages = false;
        } else {
          allOrders.addAll(r.myOrderDataEntity);
          currentPage++;
        }
      });
    }

    myOrderEntity = myOrderEntity.copyWith(myOrderDataEntity: allOrders);
    isLoadingMyOrders = false;
    notifyListeners();
  }

  Future<void> cancelOrder({required BuildContext context, required int index}) async {
    final result = await sl<CancelOrderUseCase>()(
        CancelOrderParameter(status: 'declined', id: myOrderEntity.myOrderDataEntity[index].id!));

    result.fold((l) async {
      //! handle in error
      customShowCustomDialog(
          context: context,
          title: 'حدث خطاء',
          imagePath: 'assets/images/png/bad-feedback.png',
          content: 'برجاء المحاولة مرة اخرى واذا تكرر الخطاء يرجاء التواصل معنا',
          isOk: true,
          isCancel: false,
          onCancel: () {},
          onOk: () async {
            Navigator.pop(context);
          });
    }, (r) {
      //! handle in success
      customShowCustomDialog(
          context: context,
          title: 'تم  الغاء الطلب بنجاح',
          imagePath: 'assets/images/png/checked.png',
          content: 'تم الغاء الطلب وان كنت تواجه اي مشكلة نرحب بالتواصل بنا',
          isOk: true,
          isCancel: false,
          onCancel: () {},
          onOk: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          });
    });
  }

  Future<void> _getMyOrders({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();

    final result = await sl<GetMyOrdersUseCase>()(
      MyOrdersParameters(
        page: pageNumber,
        limit: AppConstants.defaultPageSize,
      ),
    );

    result.fold((l) async {
      //! handle in error
    }, (r) {
      if (r.myOrderDataEntity.isEmpty) {
        isFinishedPaging = true;
      } else {
        if (isLoadingMore) {
          myOrderEntity = myOrderEntity.copyWith(
            myOrderDataEntity: [
              ...myOrderEntity.myOrderDataEntity,
              ...r.myOrderDataEntity,
            ],
          );
        } else {
          myOrderEntity = r;
        }
      }

      isLoadingMore = false;
      isLoadingMyOrders = false;
      notifyListeners();
    });
  }

  void applyFilters() {
    if (_selectedFilters.isNotEmpty) {
      myOrderEntity = myOrderEntity.copyWith(
        myOrderDataEntity: myOrderEntity.myOrderDataEntity.where((order) {
          return _selectedFilters.contains(order.status);
        }).toList(),
      );
    }
  }

  loadMoreMyOrders() async {
    if (isFinishedPaging) return;
    pageNumber++;
    isLoadingMore = true;
    notifyListeners();
    await _getMyOrders(isLoadingMore: true);
    isLoadingMore = false;
    notifyListeners();
  }

  void setSelectedFilters(List<String> filters) async {
    _selectedFilters = filters;
    pageNumber = 1;
    isFinishedPaging = false;
    isLoadingMyOrders = true;
    myOrderEntity = const MyOrderEntity(
      myOrderDataEntity: [],
      limit: 10,
      page: 1,
      totalRecords: 0,
      totalPages: 0,
      nextPageLink: null,
      previousPageLink: null,
    );

    notifyListeners();

    await _getMyOrders();
  }

  List<MyOrderDataEntity> get filteredOrders {
    if (_selectedFilters.isEmpty) {
      return myOrderEntity.myOrderDataEntity;
    }
    return myOrderEntity.myOrderDataEntity.where((request) {
      return _selectedFilters.contains(request.status);
    }).toList();
  }

  String dateCreateOrder(int index) {
    var requestEntity = filteredOrders[index];
    String fullDateTime = requestEntity.createdAt!;
    String dateOnly = fullDateTime.split("T")[0];
    return dateOnly;
  }
}
