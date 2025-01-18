import 'package:bacura_app/core/utils/index.dart';

class TermsConditionsView extends StatefulWidget {
  const TermsConditionsView({super.key});

  @override
  State<TermsConditionsView> createState() => _TermsConditionsViewState();
}

class _TermsConditionsViewState extends State<TermsConditionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.terms_and_conditions,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorManager.whiteColor,
            ),
      )),
      body: const TermsConditionsViewBody(),
    );
  }
}
