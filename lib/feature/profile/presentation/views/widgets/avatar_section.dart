import 'package:bacura_app/core/utils/index.dart';

class AvatarSection extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onEditImage;
  final VoidCallback onEditName; // Callback to edit name
  final String userName; // Current user name

  const AvatarSection({
    Key? key,
    this.imageFile,
    required this.onEditImage,
    required this.onEditName,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Blue container background
      Container(
        height: 80,
        width: double.infinity,
        color: ColorManager.primaryBlueColor,
      ),

      // Profile Picture Section
      Transform.translate(
          offset: const Offset(0, -50),
          child: Column(children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.lightBlueColor, // Border color
                    width: 3.0, // Border width
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
                  radius: 50,
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile!) as ImageProvider
                      : const AssetImage('assets/images/Ellipse 1.png'),
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
                              radius: 12,
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 16,
                                color: Colors.white,
                              )))))
            ]),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: onEditName,
                    child: Icon(
                      Icons.drive_file_rename_outline,
                      color: ColorManager.primaryBlueColor,
                      size: 22,
                    )),
                const SizedBox(width: 5),
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
