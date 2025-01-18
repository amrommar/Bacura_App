import 'package:bacura_app/core/utils/index.dart';

class SpProfileDetailsView extends StatefulWidget {
  const SpProfileDetailsView({super.key});

  @override
  State<SpProfileDetailsView> createState() => _SpProfileDetailsViewState();
}

class _SpProfileDetailsViewState extends State<SpProfileDetailsView> {
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor, appBar: AppBar(elevation: 0), body: const SpProfileDetailsViewBody());
  }
}
