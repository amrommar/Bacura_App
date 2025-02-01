import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/index.dart';

class RequestDetailsWidget extends StatelessWidget {
  Color backgroundColor;

  Color requestColor;

  RequestDetailsWidget({super.key, required this.backgroundColor, required this.requestColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            AppSizes.br12,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.midWhiteColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // Offset in the x and y directions
            )
          ]),
      margin: EdgeInsets.only(right: AppSizes.pw18, top: AppSizes.ph18, left: AppSizes.pw18),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
      height: AppSizes.ph180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////  Request Number and Icons for Contact section/////////////////////////////////////////////

          RequestNumContactIconWidget(requestColor: requestColor),
          ////service type section/////////////////////////////////////////////

          SizedBox(
            width: AppSizes.pw400,
            child: Text('كاميرا IP خارجية 8MP 80m - هيكفيجن Hikvision',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.blackColor,
                    )),
          ),
          ////Time and Date section/////////////////////////////////////////////

          const RequestTimeDateWidget(),
          ////  Salary section/////////////////////////////////////////////
          const RequestPriceWidget()
        ],
      ),
    );
  }
}
