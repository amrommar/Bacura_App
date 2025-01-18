import 'package:bacura_app/core/utils/index.dart';

class AdsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/baner1.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
