import 'package:bacura_app/core/utils/index.dart';

class AvatarWidget extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onEditImage;
  final VoidCallback onEditName; // Callback to edit name
  final String userName; // Current user name
  final String imagePath;

  const AvatarWidget({
    super.key,
    this.imageFile,
    required this.onEditImage,
    required this.onEditName,
    required this.userName,
    required this.imagePath,
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
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: AppSizes.br50,
                  child: Image.network(imagePath),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 8,
                  child: Semantics(
                      button: true,
                      child: GestureDetector(
                          onTap: () {
                            onEditImage();
                          },
                          child: CircleAvatar(
                              backgroundColor: ColorManager.primaryBlueColor,
                              radius: AppSizes.br12,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: AppSizes.ph16,
                                color: Colors.white,
                              )))))
            ]),
            SizedBox(height: AppSizes.ph10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: onEditName,
                    child: Icon(
                      Icons.drive_file_rename_outline,
                      color: ColorManager.primaryBlueColor,
                      size: AppSizes.ph22,
                    )),
                SizedBox(width: AppSizes.pw5),
                Text(
                  userName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            )
          ]))
    ]);
  }
}
