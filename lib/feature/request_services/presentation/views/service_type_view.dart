import 'package:bacura_app/core/utils/index.dart';

class ServiceType_Screen extends StatefulWidget {
  @override
  State<ServiceType_Screen> createState() => _ServiceType_ScreenState();
}

class _ServiceType_ScreenState extends State<ServiceType_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.service_type),
        elevation: 0,
      ),
      body: const ServiceTypeViewBody(),
    );
  }
}

/// container have circle icon and text ////////////////////////////////////
