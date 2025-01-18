import 'package:bacura_app/core/utils/index.dart';

class SpImplementRequestView extends StatefulWidget {
  const SpImplementRequestView({super.key});

  @override
  State<SpImplementRequestView> createState() => _SpImplementRequestViewState();
}

class _SpImplementRequestViewState extends State<SpImplementRequestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تنفيذ الطلب')),
      body: const SpImplementRequestViewBody(),
    );
  }
}

// Custom dashed line painter
