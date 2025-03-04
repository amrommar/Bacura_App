import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpCompletedRequestContainer extends StatefulWidget {
  const SpCompletedRequestContainer({super.key});

  @override
  State<SpCompletedRequestContainer> createState() => _SpCompletedRequestContainerState();
}

class _SpCompletedRequestContainerState extends State<SpCompletedRequestContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.spRequestDetailsRoute);
      },
      child: CustomShadowWidget(
          childWidget: Column(
        children: [
          ////Time and Date section/////////////////////////////////////////////
          const SpCompletedRequestTimeNumRow(),
          const Divider(),
          SizedBox(height: AppSizes.ph10),

          Row(children: [
            Text('اسم العميل: ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.darkBlueColor,
                    )),
            Text("clientName",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.primaryBlueColor,
                      fontWeight: FontWeight.bold,
                    ))
          ]),
        ],
      )),
    );
  }
}
