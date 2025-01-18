import 'package:bacura_app/core/utils/index.dart';

class SuggestionsView extends StatefulWidget {
  const SuggestionsView({super.key});

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends State<SuggestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.suggestions),
      ),
      body: const SuggestionsViewBody(),
    );
  }
}
