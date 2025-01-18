import 'package:bacura_app/core/utils/index.dart';

class UserGuideView extends StatefulWidget {
  const UserGuideView({super.key});

  @override
  State<UserGuideView> createState() => _UserGuideViewState();
}

class _UserGuideViewState extends State<UserGuideView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.user_guide),
      ),
      body: const UserGuideViewBody(),
    );
  }
}
