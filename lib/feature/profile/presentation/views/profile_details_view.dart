import 'package:bacura_app/core/utils/index.dart';

class ProfileDetails_Screen extends StatefulWidget {
  const ProfileDetails_Screen({super.key});

  @override
  State<ProfileDetails_Screen> createState() => _ProfileDetails_ScreenState();
}

class _ProfileDetails_ScreenState extends State<ProfileDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(elevation: 0),
      body: const ProfileDetailsViewBody(),
    );
  }
}
