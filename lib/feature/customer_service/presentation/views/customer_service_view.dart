import 'package:bacura_app/feature/customer_service/presentation/views/widgets/customer_service_app_bar_action.dart';
import 'package:bacura_app/feature/customer_service/presentation/views/widgets/customer_service_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
