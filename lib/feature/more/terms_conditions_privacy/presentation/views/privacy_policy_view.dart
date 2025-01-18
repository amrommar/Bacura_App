import 'package:bacura_app/core/utils/index.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.privacy_policy,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorManager.whiteColor,
                  ))),
      body: PrivacyPolicyViewBody(),
    );
  }
}
