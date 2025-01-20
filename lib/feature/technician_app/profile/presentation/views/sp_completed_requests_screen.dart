import 'package:bacura_app/core/utils/index.dart';

class SpCompletedrequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الطلبات المنجزة'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SpCompletedRequestContainer();
        },
      ),
    );
  }
}
