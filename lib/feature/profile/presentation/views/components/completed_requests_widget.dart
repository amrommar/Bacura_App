import 'package:bacura_app/core/utils/index.dart';

class CompletedordersWidget extends StatelessWidget {
  const CompletedordersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.spCompletedordersRoute);
        },
        child: CustomShadowWidget(
            childWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.request_page_outlined, color: ColorManager.midBlueColor),
                  SizedBox(width: AppSizes.pw10),
                  Text('الطلبات المنجزة',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.darkBlueColor,
                          ))
                ],
              ),
              SizedBox(width: AppSizes.pw10),
              Text('24',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.blackColor,
                      ))
            ])));
  }
}
