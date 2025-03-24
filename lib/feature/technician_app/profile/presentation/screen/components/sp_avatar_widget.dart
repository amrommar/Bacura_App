import 'package:bacura_app/core/utils/index.dart';

class SpAvatarWidget extends StatelessWidget {
  final String userName;
  final String? imagePath;

  const SpAvatarWidget({
    super.key,
    required this.userName,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: AppSizes.ph80,
        width: double.infinity,
        color: ColorManager.primaryBlueColor,
      ),
      Transform.translate(
          offset: const Offset(0, -50),
          child: Column(children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.lightBlueColor,
                    width: AppSizes.pw3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: AppSizes.ph80,
                  width: AppSizes.ph80,
                  child: Image.asset(
                    AppAssets.bacuraImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ]),
            SizedBox(height: AppSizes.ph10),
            Text(userName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.darkBlueColor,
                      fontWeight: FontWeight.bold,
                    ))
          ]))
    ]);
  }
}
