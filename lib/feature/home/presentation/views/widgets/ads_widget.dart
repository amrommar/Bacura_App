import 'package:bacura_app/core/utils/index.dart';

class AdsWidget extends StatelessWidget {
  final String imagePath;

  const AdsWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw6),
      child: SizedBox(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.br12),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
