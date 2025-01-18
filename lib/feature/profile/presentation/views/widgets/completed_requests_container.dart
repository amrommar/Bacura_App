import 'package:bacura_app/core/utils/index.dart';

class CompletedRequestsContainer extends StatelessWidget {
  const CompletedRequestsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.spCompletedRequestsRoute);
        },
        child: CustomShadowContainer(
            childWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.request_page_outlined, color: ColorManager.midBlueColor),
                  SizedBox(width: 10.w),
                  Text('الطلبات المنجزة',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.darkBlueColor,
                          ))
                ],
              ),
              SizedBox(width: 10.w),
              Text('24',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.blackColor,
                      ))
            ])));
  }
}
