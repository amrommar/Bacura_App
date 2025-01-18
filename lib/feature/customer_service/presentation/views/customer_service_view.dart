import 'package:bacura_app/core/utils/index.dart';

class CustomerServiceView extends StatefulWidget {
  const CustomerServiceView({super.key});

  @override
  State<CustomerServiceView> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.service_customer_chat,
            ),
            actions: const [
              CustomerServiceAppBarAction(),
            ]),
        body: const CustomerServiceViewBody());
  }
}
