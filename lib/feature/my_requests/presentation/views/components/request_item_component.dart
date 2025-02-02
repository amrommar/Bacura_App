import 'package:bacura_app/core/services/date_parser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/index.dart';
import 'package:bacura_app/feature/my_requests/presentation/controller/my_requests_provider.dart';

class RequestItemComponent extends StatelessWidget {
  final Color backgroundColor;
  final Color requestColor;
  final int index;
  final bool isLoading;

  const RequestItemComponent({
    super.key,
    required this.backgroundColor,
    required this.requestColor,
    required this.index,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MyRequestsProvider>(
      builder: (context, provider, child) {
        return _buildRequestContainer(provider, context);
      },
    );
  }

  Widget _buildRequestContainer(MyRequestsProvider provider, BuildContext context) {
    var requestEntity = provider.filteredRequests[index];
    String communicationDate = DateParser.dateFormatterWithoutTime(requestEntity.communicationDate);
    String communicationTime = DateParser.dateFormatterOnlyTime(requestEntity.communicationTime);
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.br12),
        boxShadow: [
          BoxShadow(
            color: ColorManager.midWhiteColor,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.only(right: AppSizes.pw18, top: AppSizes.ph18, left: AppSizes.pw18),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
      height: AppSizes.ph180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RequestNumContactIconWidget(
            requestColor: requestColor,
            requestNumber: requestEntity.id.toString(),
          ),
          SizedBox(
            width: AppSizes.pw400,
            child: Text(
              requestEntity.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: ColorManager.blackColor,
                  ),
            ),
          ),
          RequestTimeDateWidget(date: communicationDate, time: communicationTime),
          Text(
            '1000 ريال',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.darkBlueColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
