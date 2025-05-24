import 'package:bacura_app/core/utils/index.dart';

class OrderNumContactIconWidget extends StatelessWidget {
  final Color requestColor;
  final int orderId;
  final String status;

  const OrderNumContactIconWidget({
    super.key,
    required this.requestColor,
    required this.orderId,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    String newStatus = '';
    switch (status) {
      case 'pending':
        newStatus = tr(AppStrings.pending);
        break;
      case 'approved':
        newStatus = tr(AppStrings.approved);
        break;
      case 'confirmed':
        newStatus = tr(AppStrings.confirmed);
        break;
      case 'completed':
        newStatus = tr(AppStrings.completed);
        break;
      case 'declined':
        newStatus = tr(AppStrings.cancelled);
        break;

      default:
        newStatus = status;
    }
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
        Text(
          newStatus,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ColorManager.darkBlueColor,
              ),
        ),
        Icon(
          Icons.circle,
          color: requestColor,
          size: AppSizes.ph15,
        ),
      ])
    ]);
  }
}
