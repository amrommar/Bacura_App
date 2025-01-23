import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SPRequestitemWidget extends StatelessWidget {
  const SPRequestitemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(
            AppSize.s8,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.soLightGreyColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // Offset in the x and y directions
            )
          ]),
      margin: EdgeInsets.only(right: 10.w, top: 24.h, left: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
      height: 160.h,
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
