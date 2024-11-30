import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/more/terms_conditions_privacy/presentation/views/widgets/privacy_policy_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
