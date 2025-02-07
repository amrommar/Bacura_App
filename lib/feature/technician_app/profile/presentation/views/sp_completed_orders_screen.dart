import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpCompletedOrdersScreen extends StatelessWidget {
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
