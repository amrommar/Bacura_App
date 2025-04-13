import 'package:bacura_app/core/utils/index.dart';

class OrderNumContactIconWidget extends StatelessWidget {
  final Color requestColor;
  final int orderId;

  const OrderNumContactIconWidget({
    super.key,
    required this.requestColor,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '#${orderId.toString()}',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorManager.darkBlueColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      Row(children: [
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.customerServiceRoute);
            },
            child: SvgPicture.asset(
              AppAssets.contactIcon,
              height: AppSizes.ph20,
            )),
        SizedBox(width: AppSizes.pw10),
        Icon(
          Icons.circle,
          color: requestColor,
          size: AppSizes.ph15,
        )
      ])
    ]);
  }
}
