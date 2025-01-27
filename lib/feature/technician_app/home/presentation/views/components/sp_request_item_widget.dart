import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SPRequestItemWidget extends StatelessWidget {
  const SPRequestItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(
            AppSizes.br8,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.soLightGreyColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // Offset in the x and y directions
            )
          ]),
      margin: EdgeInsets.only(right: AppSizes.pw10, top: AppSizes.ph24, left: AppSizes.pw10),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph8),
      height: AppSizes.ph160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ////  Request Number  section/////////////////////////////////////////////

          const SpRequestNumRow(),
          ////service Time section/////////////////////////////////////////////

          const SpRequestImplTimeWidget(),

          //// request details button /////////////////////////////////////////////
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.spRequestDetailsRoute);
            },
            child: Text('تفاصيل الطلب',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.whiteColor,
                    )),
          )
        ],
      ),
    );
  }
}
