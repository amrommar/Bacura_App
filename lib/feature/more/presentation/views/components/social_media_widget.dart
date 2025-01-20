import 'package:bacura_app/core/utils/index.dart';

class SocialMediaWidget extends StatelessWidget {
  String path;
  String imagePath;

  SocialMediaWidget({super.key, required this.imagePath, required this.path});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(path);
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Image.asset(
        imagePath,
        height: 45,
        width: 45,
      ),
    );
  }
}
