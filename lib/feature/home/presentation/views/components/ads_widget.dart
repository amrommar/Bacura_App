import 'package:bacura_app/core/utils/index.dart';

class AdsWidget extends StatelessWidget {
  String imagePath;

  AdsWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
