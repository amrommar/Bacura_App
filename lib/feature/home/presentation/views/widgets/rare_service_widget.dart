import 'package:bacura_app/core/utils/index.dart';

class RareServiceWidget extends StatelessWidget {
  final Function() onTap;
  final String imagePath;
  final String serviceTitle;

  const RareServiceWidget({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.serviceTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Add functionality when tapping the container
      child: SizedBox(
        height: AppSizes.ph156,
        width: AppSizes.ph200,
        child: Container(
          padding: EdgeInsets.all(AppSizes.ph4),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.darkBlueColor,
                ColorManager.midBlueColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.soLightGreyColor,
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3), // Offset in the x and y directions
              ),
            ],
            borderRadius: BorderRadius.circular(AppSizes.br12),
          ),
          margin: EdgeInsets.all(AppSizes.ph8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                imagePath,
                height: AppSizes.ph95,
                width: AppSizes.pw120,
                placeholderBuilder: (BuildContext context) => CircularProgressIndicator(),
              ),
              SizedBox(height: AppSizes.ph5),
              Text(
                serviceTitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorManager.whiteColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
