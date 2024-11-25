import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/service_provider/personal/presentation/views/widgets/sp_personal_details_view_body.dart';
import 'package:flutter/material.dart';

class SpPersonalDetailsView extends StatefulWidget {
  const SpPersonalDetailsView({super.key});

  @override
  State<SpPersonalDetailsView> createState() => _SpPersonalDetailsViewState();
}

class _SpPersonalDetailsViewState extends State<SpPersonalDetailsView> {
  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(elevation: 0),
        body: const SpPersonalDetailsViewBody());
  }
}
