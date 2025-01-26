import 'package:bacura_app/core/utils/index.dart';

class ServiceCardWidget extends StatelessWidget {
  String imagePath;
  String departmentTitle;

  ServiceCardWidget({super.key, required this.imagePath, required this.departmentTitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Card(
          color: ColorManager.whiteColor,
          child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.pw20,
                vertical: AppSizes.ph20,
              ),
              height: AppSizes.ph100,
              width: AppSizes.pw100,
              child: SvgPicture.asset(imagePath))),
      SizedBox(
          width: AppSizes.pw90,
          child: Text(
            departmentTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.blackColor,
                ),
          ))
    ]);
  }
}
