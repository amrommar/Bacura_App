import 'package:bacura_app/core/utils/index.dart';

class RequestNumContactIconWidget extends StatelessWidget {
  Color requestColor;

  RequestNumContactIconWidget({super.key, required this.requestColor});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '#3333452',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
      ),
      Row(children: [
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.customerServiceRoute);
            },
            child: SvgPicture.asset(
              'assets/images/contact_icon.svg',
              height: AppSizes.ph20,
            )),
        SizedBox(width: AppSizes.pw10),
        Icon(Icons.circle, color: requestColor, size: AppSizes.ph15)
      ])
    ]);
  }
}
