import 'package:bacura_app/core/presentation/widget/shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/index.dart';
import 'package:bacura_app/feature/my_requests/presentation/controller/my_requests_provider.dart';
import 'package:bacura_app/feature/my_requests/utils.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shimmer/shimmer.dart';

class RequestsTabScreen extends StatefulWidget {
  const RequestsTabScreen({super.key});

  @override
  State<RequestsTabScreen> createState() => _RequestsTabScreenState();
}

class _RequestsTabScreenState extends State<RequestsTabScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyRequestsProvider(),
      child: Consumer<MyRequestsProvider>(
        builder: (context, provider, child) => provider.isLoadingMyRequests
            ? buildShimmerContainer()
            : Column(
                children: [
                  SizedBox(height: AppSizes.ph5),
                  const RequestsFilterWidget(),
                  Divider(color: ColorManager.lightBlueColor),
                  Expanded(
                    child: LazyLoadScrollView(
                      onEndOfPage: () => provider.loadMoreMyRequests(),
                      child: ListView.builder(
                        itemCount: provider.filteredRequests.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const RequestDetailsScreen()));
                            },
                            child: RequestItemComponent(
                              backgroundColor: requestColor(
                                  statusColors[provider.myRequestEntity.myRequestDataEntity[index].status]!),
                              requestColor: statusColors[provider.myRequestEntity.myRequestDataEntity[index].status]!,
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.ph25),
                  provider.isLoadingMore
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }

  Color requestColor(Color currentColor) {
    if (currentColor == ColorManager.yellowColor) {
      return ColorManager.lightYellowColor;
    } else if (currentColor == ColorManager.primaryBlueColor) {
      return ColorManager.lightBlueColor;
    } else if (currentColor == ColorManager.greenColor) {
      return ColorManager.lightGreenColor;
    } else if (currentColor == ColorManager.redColor) {
      return ColorManager.lightRedColor;
    }
    return ColorManager.whiteColor;
  }
}
